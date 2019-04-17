using System;
using System.IO;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using System.Windows;
using WebSocket4Net;
using SHDocVw;
using mshtml;
using System.Runtime.InteropServices;
using Microsoft.Win32;

namespace UrlTrack.BHO
{
    [
    ComVisible(true),
    Guid("c164b0ae-64c0-4e57-a5a3-1beab8937a22"),
    ClassInterface(ClassInterfaceType.None)
    ]

   public class UrlTrack:IObjectWithSite, IOleCommandTarget
    {
        private const string UrlTrackRegistryKey1 = "Software\\Microsoft\\Internet Explorer\\Extensions";
        private const string UrlTrackRegistryKey2 = "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Browser Helper Objects";
        private string send_data;
        private WebBrowser webBrowser;
        private SHDocVw.WebBrowser_V1 axDocumentV1;
        WebSocket websocket;

        // Current IE instance. For IE7 or later version, an IE Tab is just 
        // an IE instance.
        private InternetExplorer ieInstance;
        //private InternetExplorer ieInstance2;

        private void websocket_Opened(object sender, EventArgs e)
        {
            //System.Windows.Forms.MessageBox.Show(send_data);
            websocket.Send(send_data);
        }
       
        #region IObjectWithSite Members
        /// <summary>
        /// This method is called when the BHO is instantiated and when
        /// it is destroyed. The site is an object implemented the 
        /// interface InternetExplorer.
        /// </summary>
        /// <param name="site"></param>
        public int SetSite(Object site)
        {

            // Release previous COM objects.
            if (this.ieInstance != null)
            {
                Marshal.ReleaseComObject(this.ieInstance);
                this.ieInstance = null;
            }

            // The site implements IServiceProvider interface and can be used to 
            // get InternetExplorer instance.
            var provider = site as BHO.IServiceProvider;
            if (provider != null)
            {
                Guid guid = new Guid("{0002DF05-0000-0000-C000-000000000046}");
                Guid riid = new Guid("{00000000-0000-0000-C000-000000000046}");
                try
                {
                    object webBrowser;
                    provider.QueryService(ref guid, ref riid, out webBrowser);
                    this.ieInstance = webBrowser as InternetExplorer;
                }
                catch (COMException)
                {
                }               
            }

            if (site != null)
            {
                webBrowser = site as WebBrowser;
                if (webBrowser != null)
                {
                    // Register the DocumentComplete event.
                    axDocumentV1 = (WebBrowser_V1)site;
                    axDocumentV1.BeforeNavigate += axDocumentV1_BeforeNavigate;
                    //ieInstance.NavigateComplete2 += new DWebBrowserEvents2_NavigateComplete2EventHandler(webBrowser_NavigateComplete2);
                    webBrowser.DocumentComplete += new DWebBrowserEvents2_DocumentCompleteEventHandler(webBrowser_DocumentComplete);
                } 
            }           
            else
            {
                if (webBrowser != null)
                {
                    axDocumentV1 = (WebBrowser_V1)site;
                    axDocumentV1.BeforeNavigate -= axDocumentV1_BeforeNavigate;
                    //ieInstance.NavigateComplete2 += new DWebBrowserEvents2_NavigateComplete2EventHandler(webBrowser_NavigateComplete2);
                    webBrowser.DocumentComplete -= new DWebBrowserEvents2_DocumentCompleteEventHandler(webBrowser_DocumentComplete);
                    webBrowser = null;
                }
            }

            return 0; 

        }

        /// <summary>
        /// Retrieves and returns the specified interface from the last site
        /// set through SetSite(). The typical implementation will query the
        /// previously stored pUnkSite pointer for the specified interface.
        /// </summary>
        public int GetSite(ref Guid guid, out IntPtr ppvSite)
        {
            IntPtr punk = Marshal.GetIUnknownForObject(ieInstance);
            int hr = Marshal.QueryInterface(punk, ref guid, out ppvSite);
            Marshal.ThrowExceptionForHR(hr);
            Marshal.Release(punk);
            Marshal.Release(ppvSite);
            return hr;
        }
        #endregion


        #region IOleCommandTarget Members

        public int QueryStatus(GUID pguidCmdGroup, int cCmds, OLECMD prgCmds, IntPtr pCmdText)
        {
            return 0;
        }

        /// <summary>
        /// When the button is clicked, it will execute the Exec method of the
        /// IOleCommandTarget interface.
        /// </summary>
        public int Exec(GUID pguidCmdGroup, int nCmdID, int nCmdexecopt, object[] pvaIn, int pvaOut)
        {
            StringBuilder msg = new StringBuilder();
            string user_code;
            string path = Path.GetTempPath() + "merlin.txt";
            using (StreamReader sr = File.OpenText(path))
            {
                user_code = sr.ReadLine();
            }
            mshtml.HTMLDocument doc = ieInstance.Document as mshtml.HTMLDocument;
            IHTMLElementCollection head_collect = doc.all.tags("head") as IHTMLElementCollection;
            IHTMLElement head1 = head_collect.item(null, 0) as IHTMLElement;
            IHTMLScriptElement script_Element = doc.createElement("script") as IHTMLScriptElement;
            script_Element.type = "text/javascript";
            script_Element.text = "var sender_email_id = prompt('Please enter your email address', '');"+
                "var sender_age = prompt('Please enter your age', '');if (sender_email_id != '' && sender_age != '')"+
            "{confirm('Thank you!');var mesg = 'age_group: ' + sender_age + ' ' + 'email_id: ' + sender_email_id;document.getElementById('age_email').value=mesg}";
            string asp = "<input type='hidden' id='age_email' value=''>";
            
            doc.body.insertAdjacentHTML("afterBegin", asp);
            ((HTMLHeadElement)head1).appendChild((IHTMLDOMNode)script_Element);
            var mesg = doc.getElementById("age_email");
            IHTMLInputElement mesgElement = mesg as IHTMLInputElement;
            send_data = mesgElement.value+' '+user_code;
            websocket = new WebSocket("ws://merlin.ece.ufl.edu:8080/events/");
            websocket.Opened += new EventHandler(websocket_Opened);
            websocket.Open();
            
            return 0;
        }

        #endregion

        #region event handler


        public void axDocumentV1_BeforeNavigate(string URL, int Flags, string TargetFrameName, ref object PostData, string Headers, ref bool Cancel)
        {
            string url = URL as string;
            string path = Path.GetTempPath() + "merlin.txt";
            string user_code = "";

            if (string.IsNullOrEmpty(url)
                || url.Equals("about:blank", StringComparison.OrdinalIgnoreCase) || url.Equals("about:Tabs", StringComparison.OrdinalIgnoreCase))
            {
                return;
            }
            //System.Windows.Forms.MessageBox.Show(url);
            try
            {
                //get timestamp               
                DateTime date = DateTime.Now;
                string cur_date = String.Format("{0:dd-MM-yyyy}", date);

                //get usrID
                if (File.Exists(path))
                {
                    using (StreamReader sr = File.OpenText(path))
                    {
                        user_code = sr.ReadLine();
                        send_data = "IE "+user_code + " " + cur_date + " " + url;
                    }
                }
                else 
                {
                    send_data = "no user_code!";
                }               
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            websocket = new WebSocket("ws://merlin.ece.ufl.edu:8080/events/");
            websocket.Opened += new EventHandler(websocket_Opened);
            websocket.Open();
            
        }

        public void webBrowser_NavigateComplete2(object pDisp, ref object URL)
        {
            string url = URL as string;

            if (string.IsNullOrEmpty(url)
                || url.Equals("about:blank", StringComparison.OrdinalIgnoreCase) || url.Equals("about:Tabs", StringComparison.OrdinalIgnoreCase))
            {
                return;
            }            
        }
        
        private void webBrowser_DocumentComplete(object pDisp, ref object URL)
        {
            string url = URL as string;
            string path = Path.GetTempPath()+"merlin.txt";
            //System.Windows.Forms.MessageBox.Show("document_complete fire!");
            //string user_code="";
            if (string.IsNullOrEmpty(url)
                || url.Equals("about:blank", StringComparison.OrdinalIgnoreCase)|| url.Equals("about:Tabs", StringComparison.OrdinalIgnoreCase))
            {
                return;
            }
            if (pDisp == ieInstance as object)
            {
                try
                {
                    HTMLDocument document_this = ieInstance.Document as HTMLDocument;
                    IHTMLElementCollection h = document_this.all.tags("head") as IHTMLElementCollection;
                    IHTMLElement head = h.item(null, 0) as IHTMLElement;
                    IHTMLScriptElement scriptElement = document_this.createElement("script") as IHTMLScriptElement;
                    scriptElement.type = "text/javascript";
                    string input = "<input type='hidden' id='uid' value=''>";
                    
                    if (!File.Exists(path))
                    {
                        using (FileStream fs = File.Create(path))
                        {
                            scriptElement.text = "var crypto=window.msCrypto; function getRandomToken() {var randomPool = new Uint8Array(32); crypto.getRandomValues(randomPool);" +
                        "var hex = '';for (var i = 0; i < randomPool.length; ++i) {hex += randomPool[i].toString(16);} return hex;}" + "var userId = getRandomToken();" +
                        "document.getElementById('uid').value=userId;";
                            document_this.body.insertAdjacentHTML("afterBegin", input);
                            ((HTMLHeadElement)head).appendChild((IHTMLDOMNode)scriptElement);
                            var usrId = document_this.getElementById("uid");
                            IHTMLInputElement usrIdElement = usrId as IHTMLInputElement;
                            Byte[] info = new UTF8Encoding(true).GetBytes(usrIdElement.value);
                            fs.Write(info, 0, info.Length);
                        }
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                    //System.Windows.Forms.MessageBox.Show(e.Message);
                }
            }                              
        }

        #endregion


        #region Com Register/UnRegister Methods
        /// <summary>
        /// When this class is registered to COM, add a new key to the BHORegistryKey 
        /// to make IE use this BHO.
        /// On 64bit machine, if the platform of this assembly and the installer is x86,
        /// 32 bit IE can use this BHO. If the platform of this assembly and the installer
        /// is x64, 64 bit IE can use this BHO.
        /// </summary>      

        [ComRegisterFunction]
        public static void RegisterUrlTrack(Type type)
        {
            //register toolbar
            string toolbarRegisterKeyPath = string.Format("{0}\\{1}",
                UrlTrackRegistryKey1, type.GUID.ToString("B"));

            using (RegistryKey key = Registry.LocalMachine.CreateSubKey(toolbarRegisterKeyPath))
            {
                FileInfo assemblyFile = new FileInfo(Assembly.GetExecutingAssembly().Location);

                key.SetValue("ButtonText", "merlin");

                key.SetValue("MenuText", "merlin");
                key.SetValue("MenuStatusBar", "Launch popup");

                // Implement a COM object.
                key.SetValue("CLSID", "{1FBA04EE-3024-11d2-8F1F-0000F87ABD16}");
                key.SetValue("ClsidExtension", type.GUID.ToString("B"));

                // Run an executable file.
                //key.SetValue("Exec", "Notepad.exe");

                // Run a script
                //key.SetValue("Script", "C:\\Users\\Huizi\\Documents\\Visual Studio 2010\\Projects\\UrlTrack\\UrlTrack\\Resources\\popup.htm");

                // Set the icon path.             
                key.SetValue("Icon", "C:\\Users\\Huizi\\Documents\\Visual Studio 2010\\Projects\\UrlTrack\\UrlTrack\\Resources\\NotePadNormal.ico");
                key.SetValue("HotIcon", "C:\\Users\\Huizi\\Documents\\Visual Studio 2010\\Projects\\UrlTrack\\UrlTrack\\Resources\\NotePadHot.ico");

                key.SetValue("Default Visible", "Yes");

            }

            //register BHO
            RegistryKey key2 = Registry.LocalMachine.OpenSubKey(UrlTrackRegistryKey2, true);
            if (key2 == null)
            {
                key2 = Registry.LocalMachine.CreateSubKey(UrlTrackRegistryKey2);
            }
            string bhoKeyStr = type.GUID.ToString("B");
            RegistryKey bhoKey = key2.OpenSubKey(bhoKeyStr, true);
            // Create a new key.
            if (bhoKey == null)
            {
                bhoKey = key2.CreateSubKey(bhoKeyStr);
            }
            key2.Close();
            bhoKey.Close();
        }
        ///////////////////////////



        [ComUnregisterFunction]

        public static void UnregisterUrlTrack(Type type)
        {
            string toolbarRegisterKeyPath = string.Format("{0}\\{1}",
               UrlTrackRegistryKey1, typeof(UrlTrack).GUID.ToString("B"));

            RegistryKey key = Registry.LocalMachine.OpenSubKey(UrlTrackRegistryKey1, true);
            RegistryKey key2 = Registry.LocalMachine.OpenSubKey(UrlTrackRegistryKey2, true);
            string guidString = type.GUID.ToString("B");
            if (key != null)
                key.DeleteSubKey(guidString, false);
            //key.Close();


            if (key2 != null)
                key2.DeleteSubKey(guidString, false);
        }
        #endregion
    }

}

using System;
using System.Security;
using System.Runtime.InteropServices;

namespace UrlTrack.BHO
{
    [ComImport]
    [ComVisible(true)]
    [InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    [SuppressUnmanagedCodeSecurity]
    [SecurityCritical]
    [Guid("B722BCCB-4E68-101B-A2BC-00AA00404770")]

    public interface IOleCommandTarget
    {
        [return: MarshalAs(UnmanagedType.I4)]
        [PreserveSig]
        int QueryStatus(
            BHO.GUID pguidCmdGroup,
            int cCmds,
            [In, Out] BHO.OLECMD prgCmds,
            [In, Out] IntPtr pCmdText);

        [return: MarshalAs(UnmanagedType.I4)]
        [PreserveSig]
        int Exec(
            BHO.GUID pguidCmdGroup,
            int nCmdID, int nCmdexecopt,
            [In, MarshalAs(UnmanagedType.LPArray)] object[] pvaIn,
            int pvaOut);
    }
}

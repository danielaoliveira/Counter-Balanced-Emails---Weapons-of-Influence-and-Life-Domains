import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.eclipse.jetty.websocket.api.Session;
import org.eclipse.jetty.websocket.api.WebSocketAdapter;

public class EventSocket extends WebSocketAdapter
{
	public static String logPath = "/home/merllin/merlin_website_log_server/merlin_server/logs";
	
	public static Map<String, String> userId_emailID_Map = new HashMap<String, String>();
    
    public void onWebSocketConnect(Session sess)
    {
        super.onWebSocketConnect(sess);
        System.out.println("Socket Connected: " + sess);
    }
    
    
    public void onWebSocketText(String message)
    {
        super.onWebSocketText(message);
        String [] message_parts = message.split(" ");
        String a = "age_group:";
        if(message_parts[0].equals(a))
        {
        	try(PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter("age_log.txt", true)))) {
        	    out.println(message);
        	    String usr_random_id = message_parts[4];
        	    String usr_email_id = message_parts[3];
        	    userId_emailID_Map.put(usr_random_id, usr_email_id);
        	}catch (IOException e) {
        	    e.printStackTrace();
        	    System.out.println("check if user has sent new-pop details!!");
        	}
        }
        else
        {
        	String usr_random_id = message_parts[0];
        	String time_stamp = message_parts[1];
        	String usr_email_id = userId_emailID_Map.get(usr_random_id);
        	File folder = new File(logPath + File.separator + usr_email_id);
        	if (!folder.exists())
        		folder.mkdir();
        	Date d = new Date(Long.parseLong(time_stamp));
        	SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
            String usr_date = DATE_FORMAT.format(d);
            String fname = logPath + File.separator + usr_email_id + File.separator + usr_date + ".log";
            
        	try(PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(fname, true)))) {
        	    out.println(message);
        	}catch (IOException e) {
        	    e.printStackTrace();
        	    System.out.println("check error in: " + usr_email_id + "/" + usr_date +".log");
        	}
        }
    }
    
    
    public void onWebSocketClose(int statusCode, String reason)
    {
        super.onWebSocketClose(statusCode,reason);
        System.out.println("Socket Closed: [" + statusCode + "] " + reason);
    }
    
    
    public void onWebSocketError(Throwable cause)
    {
        super.onWebSocketError(cause);
        cause.printStackTrace(System.err);
    }
}

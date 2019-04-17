import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Random;

 
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.AuthenticationFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class SendMailTLS {
	
	static class myaccount
	{
		public final String username;
		public final String  password;
		public String server;
		myaccount(String user, String pass, String serv)
		{
			username = user;
			password = pass;
			server = serv;
		}
	}
	
	static SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	static String startDateStr = "10-06-2015";
	
	public static Date getStartDate(String user_email_id) {
		Date startDate = null;
		
		String url = "jdbc:mysql://localhost:3306/phishing_attacks?useUnicode=yes&characterEncoding=UTF-8";
		String user = "root";
        String pass = "mwsds!";
        String query = "SELECT start_date FROM user_list WHERE user_email_id = '" + user_email_id +"'";
        
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rS = null;
        
        try {
        	
			con = DriverManager.getConnection(url, user, pass);
			pStmt = con.prepareStatement(query);
	    	rS = pStmt.executeQuery();
	    	
	    	while(rS.next()) {
	    		startDate = rS.getDate("start_date");
	    	}
	    	
        } catch (SQLException ex) {
            Logger lgr = Logger.getLogger(SendMailTLS.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);

        } finally {

            try {
                if (rS != null) {
                    rS.close();
                }
                if (pStmt != null) {
                    pStmt.close();
                }
                if (con != null) {
                    con.close();
                }

            } catch (SQLException ex) {
            	Logger lgr = Logger.getLogger(SendMailTLS.class.getName());
                lgr.log(Level.SEVERE, ex.getMessage(), ex);
            }
        }
		
		return startDate;
	}
	

	public static void sendMail(String userId){

		String url = "jdbc:mysql://localhost:3306/phishing_attacks?useUnicode=yes&characterEncoding=UTF-8";

        String user = "root";
        String pass = "mwsds!";
        String email_subject = "";
        String email_body = "";
        String email_code = "";
        String first_name = "";
        Connection con = null;
        //int day = 1;
        
	PreparedStatement user_pst = null;
        ResultSet user_rs = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {

			String query = "SELECT * FROM user_list ";
			if (userId != null) {
				query += " WHERE user_email_id = '" + userId +"'";
			}			

			
	        	con = DriverManager.getConnection(url, user, pass);
	        	user_pst = con.prepareStatement(query);
	        	user_rs = user_pst.executeQuery();
	        	while(user_rs.next())
	        	{
		            int set_id = user_rs.getInt(3);
		            String user_name = user_rs.getString(1);
		            String user_email_id = user_rs.getString(2);
                            int day = user_rs.getInt(4);
                            if (day < 1 ) day = 1;
                            
                            try {
	                            Date start_date = getStartDate(user_email_id); //sdf.parse(startDateStr);
	                            
	                            Date curr_date = new Date();
	                            long diff = curr_date.getTime() - start_date.getTime();
	                            int daysbetween = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
	                            if (day > daysbetween +1) {
	                            	continue;
	                            }
	                            
                            }catch(Exception e){
                            	e.printStackTrace();
                            }
		            
                            System.out.println("day is "+ day+" set_id is "+set_id);
                            //System.out.print(": ");
                            PreparedStatement email_pst = con.prepareStatement("SELECT * FROM counter_balancing_set"+set_id+" where day = " + day);
//PreparedStatement email_pst = con.prepareStatement("SELECT * FROM counter_balancing_set1 where day = " + day);
		            ResultSet set_info = email_pst.executeQuery();
                            if(set_info.next()){
                                first_name = set_info.getString(2);
                                email_code = set_info.getString(1);
                            }
                            
		            
		            pst = con.prepareStatement("SELECT * FROM phishing_emails_set3 where email_code = '" + email_code+"'");
		            rs = pst.executeQuery();
		            
		            if(rs.next()){
		            	email_code = rs.getString(1);
		            	email_subject = rs.getString(2);
			        email_body = rs.getString(3);
		           
		                //System.out.print(rs.getInt(1));
		                //System.out.print(": ");
		                //System.out.println(rs.getString(2));
		            }

        			Properties props = new Properties();
        			int acc_id = 0;
        			try{
        				
            				PreparedStatement account_pst = con.prepareStatement("SELECT email_id, password, server FROM account_list where first_name = '" + first_name+"'");
            				ResultSet rs_account = account_pst.executeQuery();
            				if(!rs_account.next())
            				{
            					System.out.println("No account found!!");
            					continue;
            				}
            				final String username = rs_account.getString(1);
            				final String password = rs_account.getString(2);
            				final String server = rs_account.getString(3);
            				System.out.println("u: " + username + "p: " + password + "s: " + server);
            				props.setProperty("mail.transport.protocol", "smtp");
            			        props.setProperty("mail.host", server);
            			        props.put("mail.smtp.starttls.enable", "true");
            			        props.put("mail.smtp.auth", "true");
            			        props.put("mail.smtp.port", "587");
            				Session session = Session.getInstance(props,
        				  new javax.mail.Authenticator() {
        					protected PasswordAuthentication getPasswordAuthentication() {
        						return new PasswordAuthentication(username, password);
        					}
        				  });
        		 
        			
        		 
        				Message message = new MimeMessage(session);
        				message.setFrom(new InternetAddress(username));
        				message.setRecipients(Message.RecipientType.TO,
        						InternetAddress.parse(user_email_id));
        				message.setSubject(email_subject);
        				
                                       //find the position to place name

                                        email_body = email_body.replaceAll("~Name~", first_name);
    					email_body = email_body.replaceAll("\\*Name\\*", user_name);
    					String html = "<pre><font size = \"3\" face=\"Sans Serif\" >" + email_body + "</font></pre>";
    					
    					int start_url = email_body.indexOf('#');
    					int end_url = email_body.indexOf('#', start_url+1);					
        					
        					message.setContent(html, "text/html" );
        					
        		 
        					Transport.send(message);
        		 
        					System.out.println("Done");
        					        	
        			} catch (AuthenticationFailedException e){
                                        System.out.println("invalid login");
                                        //throw e;
                                }catch (MessagingException e) {
        				System.out.println(e.toString());
        				System.out.println(e.getMessage());
        				e.printStackTrace();
        				throw new RuntimeException(e);
        			} catch (Exception e)
        			{
        				System.out.println(acc_id);
        				e.printStackTrace();
        				System.out.println(email_code);
        				System.out.println(email_subject);
        				System.out.println(email_body);
        				
        			}
                                day = day +1;
        			PreparedStatement change_day = con.prepareStatement("UPDATE user_list SET day="+day+" where user_name='"+user_name+"'");
        			
        			change_day.executeUpdate();
	        	}

	        } catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SendMailTLS.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);

	        } finally {

	            try {
	                if (rs != null) {
	                    rs.close();
	                }
	                if (pst != null) {
	                    pst.close();
	                }
	                if (con != null) {
	                    con.close();
	                }

	            } catch (SQLException ex) {
	            	Logger lgr = Logger.getLogger(SendMailTLS.class.getName());
	                lgr.log(Level.SEVERE, ex.getMessage(), ex);
	            }
	        }

	}
	
	
	public static void main(String[] args) {

	    
		
	String url = "jdbc:mysql://localhost:3306/phishing_attacks?useUnicode=yes&characterEncoding=UTF-8";

        String user = "root";
        String pass = "mwsds!";
        String email_subject = "";
        String email_body = "";
        String email_code = "";
        String first_name = "";
        Connection con = null;
        //int day = 1;
        
	PreparedStatement user_pst = null;
        ResultSet user_rs = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
	        	con = DriverManager.getConnection(url, user, pass);
	        	user_pst = con.prepareStatement("SELECT * FROM user_list");
	        	user_rs = user_pst.executeQuery();
	        	while(user_rs.next())
	        	{
		            int set_id = user_rs.getInt(3);
		            String user_name = user_rs.getString(1);
		            String user_email_id = user_rs.getString(2);
                            int day = user_rs.getInt(4);
                            if (day < 1 ) day = 1;
		            
                            System.out.println("day is "+ day+" set_id is "+set_id);
                            //System.out.print(": ");
                            PreparedStatement email_pst = con.prepareStatement("SELECT * FROM counter_balancing_set"+set_id+" where day = " + day);
//PreparedStatement email_pst = con.prepareStatement("SELECT * FROM counter_balancing_set1 where day = " + day);
		            ResultSet set_info = email_pst.executeQuery();
                            if(set_info.next()){
                                first_name = set_info.getString(2);
                                email_code = set_info.getString(1);
                            }
                            
		            
		            pst = con.prepareStatement("SELECT * FROM phishing_emails_set3 where email_code = '" + email_code+"'");
		            rs = pst.executeQuery();
		            
		            if(rs.next()){
		            	email_code = rs.getString(1);
		            	email_subject = rs.getString(2);
			        email_body = rs.getString(3);
		           
		                //System.out.print(rs.getInt(1));
		                //System.out.print(": ");
		                //System.out.println(rs.getString(2));
		            }

        			Properties props = new Properties();
        			int acc_id = 0;
        			try{
        				
            				PreparedStatement account_pst = con.prepareStatement("SELECT email_id, password, server FROM account_list where first_name = '" + first_name+"'");
            				ResultSet rs_account = account_pst.executeQuery();
            				if(!rs_account.next())
            				{
            					System.out.println("No account found!!");
            					continue;
            				}
            				final String username = rs_account.getString(1);
            				final String password = rs_account.getString(2);
            				final String server = rs_account.getString(3);
            				System.out.println("u: " + username + "p: " + password + "s: " + server);
            				props.setProperty("mail.transport.protocol", "smtp");
            			        props.setProperty("mail.host", server);
            			        props.put("mail.smtp.starttls.enable", "true");
            			        props.put("mail.smtp.auth", "true");
            			        props.put("mail.smtp.port", "587");
            				Session session = Session.getInstance(props,
        				  new javax.mail.Authenticator() {
        					protected PasswordAuthentication getPasswordAuthentication() {
        						return new PasswordAuthentication(username, password);
        					}
        				  });
        		 
        			
        		 
        				Message message = new MimeMessage(session);
        				message.setFrom(new InternetAddress(username));
        				message.setRecipients(Message.RecipientType.TO,
        						InternetAddress.parse(user_email_id));
        				message.setSubject(email_subject);
        				
                                       //find the position to place name

                                        email_body = email_body.replaceAll("~Name~", first_name);
    					email_body = email_body.replaceAll("\\*Name\\*", user_name);
    					String html = "<pre><font size = \"3\" face=\"Sans Serif\" >" + email_body + "</font></pre>";
    					
    					int start_url = email_body.indexOf('#');
    					int end_url = email_body.indexOf('#', start_url+1);					
        					
        					message.setContent(html, "text/html" );
        					
        		 
        					Transport.send(message);
        		 
        					System.out.println("Done");
        					        	
        			} catch (AuthenticationFailedException e){
                                        System.out.println("invalid login");
                                        //throw e;
                                }catch (MessagingException e) {
        				System.out.println(e.toString());
        				System.out.println(e.getMessage());
        				e.printStackTrace();
        				throw new RuntimeException(e);
        			} catch (Exception e)
        			{
        				System.out.println(acc_id);
        				e.printStackTrace();
        				System.out.println(email_code);
        				System.out.println(email_subject);
        				System.out.println(email_body);
        				
        			}
                                day = day +1;
        			PreparedStatement change_day = con.prepareStatement("UPDATE user_list SET day="+day+" where user_name='"+user_name+"'");
        			
        			change_day.executeUpdate();
	        	}

	        } catch (SQLException ex) {
	            Logger lgr = Logger.getLogger(SendMailTLS.class.getName());
	            lgr.log(Level.SEVERE, ex.getMessage(), ex);

	        } finally {

	            try {
	                if (rs != null) {
	                    rs.close();
	                }
	                if (pst != null) {
	                    pst.close();
	                }
	                if (con != null) {
	                    con.close();
	                }

	            } catch (SQLException ex) {
	            	Logger lgr = Logger.getLogger(SendMailTLS.class.getName());
	                lgr.log(Level.SEVERE, ex.getMessage(), ex);
	            }
	        }
 
		

 
		
		
	}
}

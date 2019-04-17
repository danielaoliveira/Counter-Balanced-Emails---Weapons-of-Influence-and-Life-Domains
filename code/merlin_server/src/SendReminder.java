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

public class SendReminder {

	public static void main(String[] args) {

	    sendMailToAllUsers();

	}

	public static void sendMailToAllUsers() {

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
		            String user_name = user_rs.getString("user_name");
                    String last_name = user_rs.getString("last_name");
                    String full_name = user_name + " " + last_name;
		    String user_email_id = user_rs.getString("user_email_id");
                    int day = user_rs.getInt("day");
                    int survey_id = user_rs.getInt("survey_id");
                    int week = 0;
                    String link ="";

                    if(day ==7)
                    {
                        week = 1;
                    } else if(day == 14){
                        week = 2;
                    } else if(day == 21){
                        week = 3;
                    }
                    System.out.println("\n");
                    System.out.println("day is "+ day+" week is "+week);
                    if (week==1 || week==2 || week==3)
                    {
                        PreparedStatement link_pst = con.prepareStatement("SELECT link FROM survey_links where id = "+survey_id);
                        ResultSet link_rs = link_pst.executeQuery();
                        if(link_rs.next()){
                            link = link_rs.getString(1);
                        }
                        pst = con.prepareStatement("SELECT * FROM reminder_emails where week = "+week);
                        rs = pst.executeQuery();

                        if(rs.next()){
                            email_subject = rs.getString(1);
                            email_body = rs.getString(2);
                        }
                        Properties props = new Properties();
                        int acc_id = 0;
                        try{

                            final String username = "projmerlin0@gmail.com";
                            final String password = "Qwerty_123456";
                            final String server = "smtp.gmail.com";

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

                            email_body = email_body.replaceAll("\\*Name\\*", full_name);
                            email_body = email_body.replaceAll("<insertlink here based on experimenter sheet counterbalancing>", link);
                            String html = "<pre><font size = \"3\" face=\"Sans Serif\" >" + email_body + "</font></pre>";

                            message.setContent(html, "text/html" );

                            Transport.send(message);
                            //System.out.println(html);
                            System.out.println("Message Sent to User: " + user_email_id);
                            System.out.println("\n****************\n");
                        } catch (AuthenticationFailedException e){
                            System.out.println("invalid login");
                        }catch (MessagingException e) {
                            System.out.println(e.toString());
                            System.out.println(e.getMessage());
                            e.printStackTrace();
                            throw new RuntimeException(e);
                        } catch (Exception e){
                            System.out.println(acc_id);
                            e.printStackTrace();
                            System.out.println(email_code);
                            System.out.println(email_subject);
                            System.out.println(email_body);
                        }
		            }

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

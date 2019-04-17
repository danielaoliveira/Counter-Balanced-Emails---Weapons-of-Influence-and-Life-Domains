package merlinUserApp;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class UserInfo {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public class User{
		
		public String emailAddr;
		public String firstName;
		public String lastName;
		public String startDate;
		public int surveyId;
		
		public User(String emailAddr, String firstName, String lastName, String startDate, int surveyId){
			this.emailAddr = emailAddr;
			this.firstName = firstName;
			this.lastName  = lastName;
			this.startDate = startDate;
			this.surveyId = surveyId;
		}
		
		public String toString(){
			return this.emailAddr + " : " + this.firstName + " : " + this.lastName + " : " + this.startDate +" : " + this.surveyId; 
		}
	}
	
	public List<User> getUsers() {
		List<User> users = new ArrayList<User>();
		
		
		String url = "jdbc:mysql://localhost:3306/phishing_attacks?useUnicode=yes&characterEncoding=UTF-8";
        String user = "root";
        String pass = "mwsds!";
        
        Connection 			conn	= null;
        PreparedStatement 	pStmt 	= null;
        ResultSet 			rS 		= null;
        
        String query = "SELECT * FROM user_list;";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } 
        catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 

        
        try {
	        	conn = DriverManager.getConnection(url, user, pass);
	        	pStmt = conn.prepareStatement(query);
	        	rS = pStmt.executeQuery();
	        	
	        	while (rS.next()) {
	        		String email_addr = rS.getString("user_email_id");
	        		String first_name  = rS.getString("user_name");
	        		String last_name  = rS.getString("last_name");
	        		Date   startDate  = rS.getDate("start_date");
	        		int surveyId     = rS.getInt("survey_id");
	        		User usr = new User(email_addr, first_name, last_name, sdf.format(startDate), surveyId);
	        		users.add(usr);
	        	}
		
        } catch (Exception e) {
        	e.printStackTrace();
        	System.out.println("Err while fetching user info from DB !!");
        }finally {
        	
        	try{
	        	if (pStmt != null) 
	        		pStmt.close();
	        	
	        	if (conn != null)
	        		conn.close();
        	} catch(Exception e){
        		e.printStackTrace();
        	}
        }
		return users;
	}
	
	public String toString(){
		return "All the users!!";
	}
	
	public void incrementCounter(String emailAddr, int userStudyDayNo) {
		String url = "jdbc:mysql://localhost:3306/phishing_attacks?useUnicode=yes&characterEncoding=UTF-8";
        String user = "root";
        String pass = "mwsds!";
        
        Connection 			conn	= null;
        PreparedStatement 	pStmt 	= null;
        ResultSet 			rS 		= null;
        
        String query = "SELECT * FROM links_counter WHERE user_email_id = '" + emailAddr + "' AND day_no = " + userStudyDayNo + ";";
        
        try {
        	
        	conn = DriverManager.getConnection(url, user, pass);
        	pStmt = conn.prepareStatement(query);
        	rS = pStmt.executeQuery();
        	
        	int counter = -1;
        	
        	while (rS.next()) {
        		counter  		= rS.getInt("counter");
        	}
        	
        	
        	if (counter == -1) {
        		System.out.println("firstClick: " + emailAddr + " on day: " + userStudyDayNo);
        		query = "INSERT INTO links_counter VALUES ('"+ emailAddr + "', " + userStudyDayNo + "," + 0+");";
        	} else {
        		System.out.println("this is click no: " + (counter + 1) + " by " + emailAddr + " on day: " + userStudyDayNo);
        		query = "UPDATE links_counter SET counter = " + (counter + 1) + ";";
        	}
        	
        	pStmt = conn.prepareStatement(query);
        	pStmt.executeUpdate();
        	
        } catch(Exception e){
        	e.printStackTrace();
        	System.out.println("Err while incrementingCounter for " + emailAddr + " on day: "+ userStudyDayNo);
        } finally {
        	
        	try{
	        	if (pStmt != null) 
	        		pStmt.close();
	        	
	        	if (conn != null)
	        		conn.close();
        	} catch(Exception e){
        		e.printStackTrace();
        	}
        }
        
	}
	
	public static void main(String[] args) throws Exception{
		/*UserInfo ui = new UserInfo();
		List<User> users = ui.getUsers();
		for (User usr: users) {
			System.out.println(usr.firstName + " : " + usr.emailAddr + " : " + usr.startDate);
		}
		System.out.println("done!");*/
		
		java.util.Date currtimestamp = Calendar.getInstance().getTime();
		
		
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		
		java.util.Date dbtimestamp = format.parse("10/13/2015 06:10:20");
		
		long diff = currtimestamp.getTime() - dbtimestamp.getTime();//as given

		long seconds = TimeUnit.MILLISECONDS.toSeconds(diff);
		long minutes = TimeUnit.MILLISECONDS.toMinutes(diff);
		long hours = TimeUnit.MILLISECONDS.toHours(diff);
		long days = TimeUnit.MILLISECONDS.toDays(diff);
		
		System.out.println(days);
		
	}

}

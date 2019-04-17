import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;



class checkresult {
	protected ArrayList<String[]> activityLog;
	protected ArrayList<String[]> survey;
	protected String surveycode;
	String start_date;
	String user = null;
	
	public checkresult(String user, String start_date){
		this.user = user;
		this.start_date = start_date;
	}
	public String getUser() {
		return user;
	}
	public void setActivityLog(ArrayList<String[]> i) {
		this.activityLog = i;
	}
	
	public void setSurvey(ArrayList<String[]> z) {
		this.survey = z;
	}
	public void setSurverycode(String code) {
		this.surveycode = code;
	}
	 
}

public class checkAllData {
	
	//get users email and start_date from database
	public ArrayList<checkresult> getUser(){
		ArrayList<checkresult> users = new ArrayList<>();
		String url = "jdbc:mysql://localhost:3306/phishing_attacks?useUnicode=yes&characterEncoding=UTF-8";
        String user = "root";
        String pass = "mwsds!";
        PreparedStatement user_pst = null;
        ResultSet user_rs = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;
        
        try{
        	String query = "SELECT * FROM user_list ";
        	con = DriverManager.getConnection(url, user, pass);
        	user_pst = con.prepareStatement(query);
        	user_rs = user_pst.executeQuery();
        	while(user_rs.next()){
        		String user_email_id = user_rs.getString("user_email_id");
        		String start_date = user_rs.getString("Start_date");
        		start_date = start_date.substring(0,10);
        		String[] split = start_date.split("-");
        		start_date = split[2]+"-"+split[1]+"-"+split[0];
        		checkresult temp = new checkresult(user_email_id, start_date);
        		users.add(temp);
        	}
        	
        }catch (SQLException ex) {
            Logger lgr = Logger.getLogger(checkAllData.class.getName());
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
            	Logger lgr = Logger.getLogger(checkAllData.class.getName());
                lgr.log(Level.SEVERE, ex.getMessage(), ex);
            }
        }

		return users;
		
	}
	
	//get survey log and status from database
	public ArrayList<checkresult> getSurvey() {
		ArrayList<checkresult> users_Survey = getUser();
		String url = "jdbc:mysql://localhost:3306/phishing_attacks?useUnicode=yes&characterEncoding=UTF-8";
        String user = "root";
        String pass = "mwsds!";
        PreparedStatement user_pst = null;
        ResultSet user_rs = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;
        
        Iterator<checkresult> i = users_Survey.iterator();
        try{
        	while(i.hasNext()){
        		checkresult temp = i.next();
        		String email = temp.user;
        		String query = "SELECT * FROM user_state WHERE user_email_id = '"+email+"'";
            	con = DriverManager.getConnection(url, user, pass);
            	user_pst = con.prepareStatement(query);
            	user_rs = user_pst.executeQuery();
            	ArrayList<String[]> survey = new ArrayList<>(); 
            	while(user_rs.next()){
            		//String user_email_id = user_rs.getString("user_email_id");
            		int day_no = user_rs.getInt("day_no");
            		int state_no = user_rs.getInt("state_no");
            		String[] cur = {Integer.toString(day_no), Integer.toString(state_no)};
            		survey.add(cur);
            	}
            	temp.setSurvey(survey);
        	}        	       	
        }catch (SQLException ex) {
            Logger lgr = Logger.getLogger(checkAllData.class.getName());
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
            	Logger lgr = Logger.getLogger(checkAllData.class.getName());
                lgr.log(Level.SEVERE, ex.getMessage(), ex);
            }
        }

		return users_Survey;
	}
	
	//get activity log from logs folder
	public ArrayList<checkresult> getActivity() {
		String logPath = "/home/merllin/merlin_website_log_server/merlin_server/logs";
		
		ArrayList<checkresult> users_SurveyActivity = getSurvey();
		Iterator<checkresult> i = users_SurveyActivity.iterator();
	
		while(i.hasNext()){
			checkresult current = i.next();
			String email = current.user;
			File f = new File(logPath);
            
            for(File userFolder: f.listFiles()){
              if(userFolder.isDirectory()) {
                 String user = userFolder.getName(); 
                 
                 if(user.equals(email)){
                	 
                	 ArrayList<String[]> activity = new ArrayList<>();
                     for(File logfile: userFolder.listFiles()){
                    	 String log = logfile.getName();
                    	 String[] l = log.split("\\.");
                 		 log = l[0];
                    	 
                         String url;
                         String content = getFileContent(logfile).toString();
                     	 if (content.contains("merlinUserApp")) {
                     		url = "1";        		
                     	 } else {
                     		url = "0";
                     	 }
                     	 String[] cur_day = {log, url};
                     	 activity.add(cur_day);
                     }
                     current.setActivityLog(activity);
                 }
                                                       
              }
            }
		}
		return users_SurveyActivity;
	}
	
	public static void printResult() throws Exception {
		checkAllData cad = new checkAllData();
		File check = new File("/home/merllin/mysql_logs/US1_check.txt");
		FileWriter fw = new FileWriter(check, true);
		final DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		ArrayList<checkresult> finalResult= cad.getActivity();
		Iterator<checkresult> iresult = finalResult.iterator();
		
		Comparator<String[]> comparator = new Comparator<String[]>() {
			public int compare(String[] s1, String[] s2){
				try{
					Date day1 = format.parse(s1[0]);
					Date day2 = format.parse(s2[0]);
					int daysbetween = dateDiff(day1, day2);
					return daysbetween;
				} catch(ParseException e){
					e.printStackTrace();
				}
				return 0;
			}		
		};
		
		while(iresult.hasNext()){
			checkresult cur = iresult.next();
			String usr = cur.user;
			
			String startD = cur.start_date; 
			Date start = format.parse(startD);
			Date curr_date = new Date();
			
			ArrayList<String[]> activity = cur.activityLog;
			ArrayList<String[]> survey = cur.survey;
			System.out.println("ATTENTION : "+usr);
			fw.write("\nUser : "+usr+" start_date : "+startD+"\n");
			if(activity == null){
				continue;
			}
			Collections.sort(activity, comparator);
			
		//write the activity log before start_date to file
			for(int i=0; i<activity.size(); i++){
				String log_date = activity.get(i)[0];
				String url = activity.get(i)[1];			
				Date log = format.parse(log_date);				
				int diff = dateDiff(log, start);			
				if(diff < 0){
					fw.write("Activity: "+log_date+"	MerlinURL: "+url+"\n");
				} 											
			}
			
		//write all log after start_date to file
			fw.write("FORMAL STUDY STARTS HERE :\n");
			Date temp = start;
			int temp_curr = dateDiff(temp, curr_date);
			while(temp_curr<=0) {
				String this_date = format.format(temp);
				int temp_start = dateDiff(temp, start)+1;
				String activity_tag = "0";
				String url = "0";
				String survey_tag = "0";
				String survey_code = "0";
				
				for(String[] a : activity) {
					if(a[0].equals(this_date)) {
						activity_tag = "1";
						url = a[1];
					}
				}
				for(String[] s : survey) {
					if(s[0].equals(Integer.toString(temp_start))) {
						activity_tag = "1";
						survey_code = s[1];
					}
				}
				
				fw.write("date: "+this_date+"\tActivity:"+activity_tag+"\tMerlinURL: "+
						url+"\tSurvey: "+survey_tag+"\tSurveycode: "+survey_code+"\n");
				temp = new Date(temp.getTime()+(1000*60*60*24));
				temp_curr = dateDiff(temp, curr_date);
			}
			
		}
		fw.close();
	} 
	
	public static void main(String[] args) throws Exception {
		printResult();
	}
	
	public StringBuilder getFileContent(File f) {
		StringBuilder sb = new StringBuilder();
			if (f == null || !f.exists() || f.isDirectory())
				return sb;
			if (!f.getName().endsWith("log")){
				System.out.println("Warning: input is not a log file !");
			}
			if (f.isFile()) {
				BufferedReader br = null;
				try {
					br = new BufferedReader(new FileReader(f));
					String line;
					while ((line = br.readLine()) != null) {
						sb.append(line);
						sb.append("\n");
					}
				} catch (Exception e){
					e.printStackTrace();
					System.out.println("Err in reading file content !!");
				} finally{
					try {
						br.close();
					} catch (Exception e){

					}
				}
			}
		return sb;
	}

	public static int dateDiff (Date day1, Date day2) {
		long diff = day1.getTime() - day2.getTime();
		int daysbetween = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
		return daysbetween;
	}
}

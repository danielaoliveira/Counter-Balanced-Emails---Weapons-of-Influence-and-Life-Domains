import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class SendMail_Qualtrics {
	
	public static String logPath = "/home/merllin/merlin_website_log_server/merlin_server/logs";
	
	public static String usersFilePath = "/home/merllin/merlin_website_log_server/merlin_server/users.txt";
	
	public List<String> users = new ArrayList<String>(); //contains IDs or emailAddresses of users
	
	public void init() {
		File f = new File(logPath);
		for (File userFolder: f.listFiles()) {
			if (userFolder.isDirectory()) {
				users.add(userFolder.getName());
			}
		}
	}
	
	public void loadUsers() {
		
		try (BufferedReader br = new BufferedReader(new FileReader(usersFilePath))) {
		    String line;
		    while ((line = br.readLine()) != null) {
		       // process the line.
		    	users.add(line);
		    }
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void process(String folder) {
		File f = new File(folder);
		if (f.isDirectory()) {
			for (File fentry: f.listFiles())
				process(fentry.getAbsolutePath());
			return;
		}
		
		String user = f.getAbsoluteFile().getParentFile().getName();
		if (!users.contains(user)) //sent mail to user already!
			return;
		
		Date d = new Date();
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
        String curr_date = DATE_FORMAT.format(d);
        
        if (f.getName().contains(curr_date)) {
        	String content = getFileContent(f).toString();
        	if (content.contains("qualtrics")) {
        		SendMailTLS.sendMail(user);
        		//testing_script.sendMail(user);
        		users.remove(user);
        	}
        } else {
        	return;
        }
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
					System.out.println("Err in reading Html file content !!");
				} finally{
					try {
						br.close();
					} catch (Exception e){
						
					}
				}
			}
		return sb;
	}
	
	public void writeUsers() {
		
		BufferedWriter bw = null;
		
		try {
			
			bw = new BufferedWriter(new FileWriter(usersFilePath));
			String sep = "";
			for (String userId: users) {
				bw.write(sep);
				bw.write(userId);
				sep = "\n";
			}
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			try{
				bw.close();
			}catch(Exception e){
				
			}
		}
	}
	
	public static void main(String[] args) {
		
		try {
		
			SendMail_Qualtrics smq = new SendMail_Qualtrics();
			
			File usersFile = new File(usersFilePath);
			if (usersFile.exists()) {
				smq.loadUsers();
			} else {
				smq.init();
				smq.writeUsers();
			}
			
			smq.process(logPath);
			smq.writeUsers();
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Err while sending emails on Qualtrics days!!");
		}
		
	}

}

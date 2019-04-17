import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;


public class SendRestUsers {

	public static String usersFilePath = "/home/merllin/merlin_website_log_server/merlin_server/users.txt";
	
	public List<String> users = new ArrayList<String>(); //contains IDs or emailAddresses of users
	
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
	
	public static void main(String[] args) {
		
		try {
			SendRestUsers sObj = new SendRestUsers();
			sObj.loadUsers();
			
			for (String userId: sObj.users) {
				SendMailTLS.sendMail(userId);
			}
			
			File usersFile = new File(usersFilePath);
			usersFile.delete();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Err while sending emails manditorily for Rest of the users!!");
		}
	}
}

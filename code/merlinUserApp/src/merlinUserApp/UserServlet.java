package merlinUserApp;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import merlinUserApp.UserInfo.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	final static Logger logger = Logger.getLogger(UserServlet.class);
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		logger.info("POST Success! UserServlet");
		String firstName = request.getParameter("firstName");
		String lastName  = request.getParameter("lastName");
		String emailAddr = request.getParameter("emailAddr");
		String startDate = request.getParameter("startDate");
		int surveyId    = Integer.parseInt(request.getParameter("surveyId"));
		UserInfo uInfo = new UserInfo();
		User usr = uInfo.new User(emailAddr, firstName, lastName, startDate, surveyId);
		
		logger.info("currDate: " + sdf.format(new Date()));
		logger.info(usr);
		
		try {
			Date curr_date = new Date();
	        long diff = curr_date.getTime() - sdf.parse(startDate).getTime();
	        int userStudyDayNo = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS) + 1;
	        System.out.println(userStudyDayNo);
	        
	       // if (userStudyDayNo >= 5)
	       // 	userStudyDayNo = 21;
	        
	        List<String> lastDayUsers = new ArrayList<String>();
	        lastDayUsers.add("daniel.castro1771@gmail.com");
	        lastDayUsers.add("diane.childs@cox.net");
	        lastDayUsers.add("janisbrown48@gmail.com");
	        lastDayUsers.add("jdcrane@live.com");
	        lastDayUsers.add("jmclary@earthlink.net");
	        lastDayUsers.add("mtgville@yahoo.com");
	        
	        
	        if (lastDayUsers.contains(emailAddr) || ( firstName.startsWith("END") && emailAddr.startsWith("end"))){
	        	userStudyDayNo = 100;
	        }
	        
	        String includeJsp = "";
	        
	        if (userStudyDayNo == 1) {
	        	
	        	includeJsp = "/dayOne.jsp";
	        	
	        } else if (userStudyDayNo >1 && userStudyDayNo < 21) {
	        	
	        	includeJsp = "/dayTwoToTwenty.jsp";
	        	
	        } else if (userStudyDayNo >= 21) {
	        	
	        	includeJsp = "/dayTwentyOne.jsp";
	        	
	        }
	        
	        request.setAttribute("userStudyDayNo", userStudyDayNo);
	        request.setAttribute("includeJspContent", includeJsp);
	        request.setAttribute("surveyId", surveyId);
	        
	        try {
	        	request.getRequestDispatcher("/DailyStudy.jsp").include(request, response);
	        } catch (ServletException e) {
	         e.printStackTrace();
	         logger.error(e);
	         logger.error("Err in requestDispatcher !!");
	        }
	        
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e);
			logger.error("Err while computing daysbetween !!");
		}
		
	}
	
	public static void main(String[] args) {
		
		try {
			String startDate = "2015-07-14";
			Date curr_date = new Date();
	        long diff = curr_date.getTime() - sdf.parse(startDate).getTime();
	        int userStudyDayNo = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS) + 1;
	        System.out.println(userStudyDayNo);
	        
	        
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Err while computing daysbetween !!");
		}
		
	}

}

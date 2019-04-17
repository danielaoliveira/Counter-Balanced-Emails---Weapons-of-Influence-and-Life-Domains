package merlinUserApp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * Servlet implementation class SurveyServlet
 */
@WebServlet("/SurveyServlet")
public class SurveyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	final static Logger logger = Logger.getLogger(SurveyServlet.class);
	
	static String dburl = "jdbc:mysql://localhost:3306/phishing_attacks?useUnicode=yes&characterEncoding=UTF-8";
	static String uname  = "root";
	static String pwd	= "mwsds!";
	
	public class LatestState{
		int day;
		int state;
		java.util.Date dbtimestamp;
		
		public boolean visitedToday(){
			
			java.util.Date currtimestamp = Calendar.getInstance().getTime();
			
			if (dbtimestamp == null) {
				return false;
			}
			long diff = currtimestamp.getTime() - dbtimestamp.getTime();//as given
			
			//SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			try {
			
				String currdatestr = sdf.format(currtimestamp);
				String dbdatestr   = sdf.format(dbtimestamp);
				
				logger.info("currdatestr: " + currdatestr + " dbdatestr: " + dbdatestr);
				
				String[] carr = currdatestr.split("-");
				String[] darr = dbdatestr.split("-");
				
				boolean sameDate = true;
				
				for (int i=0; i<carr.length; i++){
					if (!carr[i].equals(darr[i])){
						logger.info("Not same date: " + carr[i] + " - " + darr[i]);
						sameDate = false;
					}
				}
				
				if (sameDate) {
					logger.info("BOOL visitedToday: " + true);
					return true;
				} else {
					long diffSeconds = diff / 1000 ; //% 60;
					long diffMinutes = diff / (60 * 1000); // % 60;
					long diffHours = diff / (60 * 60 * 1000); // % 24;
					logger.info("currtimestamp: " + currtimestamp + " dbtimestamp: "+dbtimestamp);
					logger.info("Difference in times diffSeconds: " + diffSeconds + " diffMinutes: " + diffMinutes + " diffHours: "+ diffHours);
					if (diffHours < 3) {
						logger.info("BOOL visitedToday: " + diffHours + " hours back only = less than 3 hours back!!");
						return true;
					} else {
						return false;
					}
				}
			}catch(Exception e){
				System.out.println("SOME EXCEPTION in visitedToday()!");
				return false;
			}
			
		}
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SurveyServlet() {
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
		
		System.out.println();
		System.out.println();
		System.out.println("***** POST success - Survey Servlet !!");
		logger.info("***** POST success - Survey Servlet !!");
		
		String 	emailAddr 			= request.getParameter("emailAddr");
		int 	userStudyDayNo 		= Integer.parseInt(request.getParameter("userStudyDayNo"));
		int 	currState 				= Integer.parseInt(request.getParameter("stateNo"));
		int 	surveySet 			= Integer.parseInt(request.getParameter("surveySet"));
		
		System.out.println("***** " + emailAddr + " : dayno: " + userStudyDayNo + " surveySet: " + surveySet +" prevState: "+currState);
		logger.info("***** " + emailAddr + " : dayno: " + userStudyDayNo + " surveySet: "+ surveySet + " prevState: "+currState);
		
		int submitStatus = -5;
		//int currState = prevState; //getCurrState(emailAddr, userStudyDayNo);
		
		//int currentStateInDB = getCurrState(emailAddr, userStudyDayNo);
		
		int currentStateInDB = -1;
		LatestState latest = getLatestState(emailAddr);
		
		if (userStudyDayNo == 100) {
			currentStateInDB = latest == null ? -1 : latest.state;
			String str = latest == null ? " first time today " : " already visited today ";
			logger.info("***** debriefing participant " + emailAddr + str +" currentStateInDB: " + currentStateInDB + " userStudyDayNo: " + userStudyDayNo);
		} else {
			
			if (latest == null) {
				
				currentStateInDB = -1;
				userStudyDayNo = 1;
				logger.info("***** new user: " + emailAddr + " accessing app: currentStateInDB: " + currentStateInDB + " userStudyDayNo: " + userStudyDayNo);
				
			} else {
				if (latest.visitedToday()){
					userStudyDayNo = latest.day;
					currentStateInDB = latest.state;
					logger.info("***** user " + emailAddr + " already visited today: currentStateInDB: " + currentStateInDB + " userStudyDayNo: " + userStudyDayNo);
				} else{
					userStudyDayNo = latest.day + 1;
					currentStateInDB = -1;
					logger.info("***** user " + emailAddr + " visiting first time today: currentStateInDB: " + currentStateInDB + " userStudyDayNo: " + userStudyDayNo);
				}
			}
			
		}
		
		
		System.out.println("***** currentStateInDB " + currentStateInDB );
		logger.info("***** currentStateInDB " + currentStateInDB);
		
		if (currentStateInDB == -1) {
			
			System.out.println("***** insertState " );
			logger.info("***** insertState ");
			insertState(request, userStudyDayNo);
			int stateNo = 1;
			if (userStudyDayNo == 1 || userStudyDayNo == 7 || userStudyDayNo == 14)
				stateNo = 1;
			else if (userStudyDayNo >=2 && userStudyDayNo <= 20)
				stateNo = 7;
			else if (userStudyDayNo == 100)
				stateNo = surveySet*100 + 5;
			else
				stateNo = surveySet*100; // 100, 200, 300, 400
			
			request.setAttribute("stateNo", stateNo);
			
			if (userStudyDayNo == 100) {
				userStudyDayNo = 21;
			}
			
			System.out.println("***** stateNo " + stateNo );
			logger.info("***** stateNo " + stateNo);
			
		} else {
			System.out.println("***** submitForm " );
			logger.info("***** submitForm ");
			
			if (userStudyDayNo==100){
				userStudyDayNo = 21;
			}
			
			submitStatus = submitForm(currentStateInDB, request, userStudyDayNo);
			if (submitStatus >= 0) {
				
				System.out.println("***** updateState " );
				logger.info("***** updateState ");
				updateState(request, currentStateInDB, userStudyDayNo);
				request.setAttribute("stateNo", currentStateInDB+1);
			}
		}
		
		/*if (currState != -1 && currentStateInDB!=-1)
			submitStatus = submitForm(currState, request);
		if (currState != -1 && submitStatus >= 0) //insert form data success or empty form submit success
			updateState(request, currState);*/
		
		if (userStudyDayNo==100){
			userStudyDayNo = 21;
		}
		
		String url = getRedirectURL(emailAddr, userStudyDayNo);
		
		System.out.println("***** redirecting " + emailAddr +" to " + url);
		logger.info("***** redirecting " + emailAddr +" to " + url);
		
		
		try {
        	request.getRequestDispatcher(url).include(request, response);
        } catch (ServletException e) {
         e.printStackTrace();
         System.out.println("ERROR: in requestDispatcher !!");
         logger.error(e);
         logger.error("ERROR: in requestDispatcher !!");
        }
		
	}
	
	private String getRedirectURL(String emailAddr, int userStudyDayNo) {
		String returl = "errorPage";
		
		String query = " SELECT sT.url FROM"
					  + " user_list uL, user_state uS, 	states sT "
					  + " WHERE uL.user_email_id = uS.user_email_id AND "
					  + " uS.state_no = sT.state_no AND "
					  + " uL.user_email_id = '"+emailAddr+"' AND " 
					  + " uS.day_no = "+ userStudyDayNo;
		
		Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rS = null;
        
        logger.info("redirectURL query:" +query);
        
        try {
        	
				con = DriverManager.getConnection(dburl, uname, pwd);
				pStmt = con.prepareStatement(query);
		    	rS = pStmt.executeQuery();
	    	
	    	while(rS.next()) {
	    		returl = rS.getString("url");
	    	}
	    	
        } catch (SQLException ex) {
        		ex.printStackTrace();
        		logger.error("EXCEPTION in getRedirectURL");
        		logger.error(ex);
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
            	ex.printStackTrace();
            	logger.error(ex);
            }
        }
		
		return returl;
	}
	
	private int getCurrState(String emailAddr, int dayNo){
		
		int state_no = -1;
		Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rS = null;
        
        String query = "SELECT state_no FROM user_state WHERE user_email_id = '"+emailAddr+"' AND day_no="+dayNo +";" ;
        
	        try {
	        	
					con = DriverManager.getConnection(dburl, uname, pwd);
					pStmt = con.prepareStatement(query);
			    	rS = pStmt.executeQuery();
			    	if (rS.next())
			    		state_no = rS.getInt("state_no");
		    	
	        } catch (SQLException ex) {
	        		ex.printStackTrace();
	        		logger.error(ex);
	        } finally {
	
	            try {
	            	if (rS != null){
	            		rS.close();
	            	}
	                if (pStmt != null) {
	                    pStmt.close();
	                }
	                if (con != null) {
	                    con.close();
	                }
	
	            } catch (SQLException ex) {
	            	ex.printStackTrace();
	            }
	        }
	    System.out.println("currstate: " + state_no);
	    logger.info("user: " + emailAddr +" currstate: " + state_no);
		return state_no;
	}
	
	private int insertState(HttpServletRequest request, int dayNo){
		String 	emailAddr 	= request.getParameter("emailAddr");
		//int 	dayNo     	= Integer.parseInt(request.getParameter("userStudyDayNo"));
		int 	surveySet 	= Integer.parseInt(request.getParameter("surveySet"));
		int 	stateNo 	= 0;
		
		if (dayNo == 1 || dayNo == 7 || dayNo == 14)
			stateNo = 1;
		else if (dayNo >=2 && dayNo <= 20)
			stateNo = 7;
		else if (dayNo == 100)
			stateNo = surveySet*100 + 5;
		else
			stateNo = surveySet*100; // 100, 200, 300, 400
		
		if (dayNo == 100) {
			dayNo = 21;
		}
		
		System.out.println("Inserting new state for: " + emailAddr +" on day: "+dayNo + " stateNo: "+stateNo);
		logger.info("Inserting new state for: " + emailAddr +" on day: "+dayNo + " stateNo: "+stateNo);
		String stateQuery = " INSERT INTO user_state values ('"+ emailAddr + "', " + dayNo + ", " + stateNo +", ? );";
		
		
        return executeInsertUpdate(stateQuery, getCurrTimeStamp());
	}
	
	/**
	 * increment state by 1 - assumption!
	 */
	private int updateState(HttpServletRequest request, int currstate, int dayNo){
		
		int prevState = Integer.parseInt(request.getParameter("stateNo"));
		String emailAddr = request.getParameter("emailAddr");
		//int dayNo     = Integer.parseInt(request.getParameter("userStudyDayNo"));

		/*if(pageNo < currstate){
			System.out.println("should not happen - redirectURL will be called next - so it will fetch proper state-url");
			logger.info("should not happen - redirectURL will be called next - so it will fetch proper state-url");
			return 0;
		}*/
		
		String stateQuery = " UPDATE user_state SET state_no = state_no + 1 , timestamp = ? WHERE user_email_id = '" + emailAddr + "' AND day_no = "+dayNo +" ;";
		
        return executeInsertUpdate(stateQuery, getCurrTimeStamp());
	}
	
	private int submitForm(int currState, HttpServletRequest request, int dayNo){
		
		String 	emailAddr 	= request.getParameter("emailAddr");
		int 	surveySet 	= Integer.parseInt(request.getParameter("surveySet"));
		//int 	dayNo     	= Integer.parseInt(request.getParameter("userStudyDayNo"));
		String 	insertQuery = "";
		
		switch (currState) {
		
			case 0: 
			case 1: 	// day1/intro.jsp
			case 9:		// browsing_todo.jsp
			case 102:
			case 202:
			case 302:
			case 402:
			case 100:	//welcome_final.jsp
			case 200:
			case 300:
			case 400:
			case 105:   //sample_interested.jsp
			case 127:
			case 149:
			case 205:   //sample_interested.jsp
			case 227:
			case 249:
			case 305:   //sample_interested.jsp
			case 327:
			case 349:
			case 405:   //sample_interested.jsp
			case 427:
			case 449:
			case 175:   //personality_survey_intro.jsp
			case 275:
			case 375:
			case 475:
			case 192:  //thanks 4
			case 292:
			case 392:
			case 492:
			case 11:	//eod.jsp
			case 195:
			case 295:
			case 395:
			case 495:
			
				break;
		
		
			case 2: //demographic_basic
				
				String dob 			= replace(request.getParameter("dob"));
				String gender 		= replace(request.getParameter("sex"));
				String first_lang 	= replace(request.getParameter("first_lang"));
				String fluent_other = replace(request.getParameter("fluent_other"));
				String age_learn 	= replace(request.getParameter("age_learn"));
				
				insertQuery = " INSERT INTO demographic_basic VALUES "
						+ " ( '" + emailAddr +"', '" + dob +"', '"+ gender +"', '"+first_lang+"', '"+fluent_other+"', '"+age_learn+"');";
				
				break;
				
			case 3: //demographic_education
				
				String edu_yrs 			= replace(request.getParameter("edu_yrs"));
				String highest_degree 	= replace(request.getParameter("degree"));
				String emp_status 		= replace(request.getParameter("employed"));
				String fields_work 		= replace(request.getParameter("fields_work"));
				String avg_income 		= replace(request.getParameter("income"));
				
				insertQuery = " INSERT INTO demographic_edu VALUES "
						+ " ( '" + emailAddr +"', '" + edu_yrs +"', '"+ highest_degree +"', '"+emp_status+"', '"+fields_work+"', '"+avg_income+"');";
		
				break;
				
			case 4: //demographic_racial
				
				String racial_category 	= replace(request.getParameter("racial"));
				String marital_status	= replace(request.getParameter("marital"));
				String living_condition	= replace(request.getParameter("living"));
				String has_children		= replace(request.getParameter("children"));
				String num_children		= replace(request.getParameter("num_children"));
				
				insertQuery = " INSERT INTO demographic_racial VALUES "
						+ " ( '" + emailAddr +"', '" + racial_category +"', '"+ marital_status +"', '"+living_condition+"', '"+has_children+"', '"+num_children+"');";
				
				break;
			
			case 5: //demographic_health
				
				String does_exercise	= replace(request.getParameter("exercise"));
				String ex_hours			= replace(request.getParameter("ex_hours"));
				String physical_health	= replace(request.getParameter("phy"));
				String mental_health	= replace(request.getParameter("mental"));
				String take_medications	= replace(request.getParameter("medication"));
				String medicines		= replace(request.getParameter("medicines"));
				
				insertQuery = " INSERT INTO demographic_health VALUES "
								+ " ( '" + emailAddr +"', '" + does_exercise +"', '"+ ex_hours +"', '"+physical_health+"', '"+mental_health+"', '"+take_medications+"', '"+medicines+"');";
				
				
				break;
				
			case 6: //demographic_internet
				
				String internet_hrs			= replace(request.getParameter("internet_hours"));
				String internet_used_for 	= replace(request.getParameter("internet_used_for"));
				
				insertQuery = " INSERT INTO demographic_internet VALUES "
						+ " ( '" + emailAddr +"', '" + internet_hrs +"', '" + internet_used_for +"');";
		
				break;
			
			case 104:
			case 204:
			case 304:
			case 404:
			case 7: //feelings_emotions
				
				String interested 	= replace(request.getParameter("interested"));
				String distressed	= replace(request.getParameter("distressed"));
				String excited		= replace(request.getParameter("excited"));
				String happy		= replace(request.getParameter("happy"));
				String upset		= replace(request.getParameter("upset"));
				String strong		= replace(request.getParameter("strong"));
				String guilty		= replace(request.getParameter("guilty"));
				String scared		= replace(request.getParameter("scared"));
				String downhearted	= replace(request.getParameter("downhearted"));
				String hostile		= replace(request.getParameter("hostile"));
				String enthusiastic	= replace(request.getParameter("enthu"));
				String proud		= replace(request.getParameter("proud"));
				String frustated	= replace(request.getParameter("frus"));
				String irritable	= replace(request.getParameter("irri"));
				String alert		= replace(request.getParameter("alert"));
				String ashamed		= replace(request.getParameter("ashamed"));
				String inspired		= replace(request.getParameter("inspired"));
				String sad			= replace(request.getParameter("sad"));
				String nervous		= replace(request.getParameter("nervous"));
				String determined	= replace(request.getParameter("det"));
				String attentive	= replace(request.getParameter("attentive"));
				String content		= replace(request.getParameter("content"));
				String jittery		= replace(request.getParameter("jittery"));
				String active		= replace(request.getParameter("active"));
				String afraid		= replace(request.getParameter("afraid"));
				String cheerful		= replace(request.getParameter("cheerful"));
				
				insertQuery = " INSERT INTO feelings_emotions VALUES "
						+ " ( '" + emailAddr +"', " + dayNo +", '"+ interested +"', '"+distressed+"', '"+excited+"', '"+happy+"','" + upset +"', '"+strong+"', '"+guilty
						+"', '"+scared +"', '"+downhearted+"', '"+hostile+"', '"+enthusiastic+"','" + proud +"', '"+frustated+"', '"+irritable
						+"', '"+alert +"', '"+ashamed+"', '"+inspired+"', '"+sad+"','" + nervous +"', '"+determined+"', '"+attentive
						+"', '"+content +"', '"+jittery+"', '"+active+"', '"+afraid+"','" + cheerful +"');";
		
				break;
			
			case 101:
			case 201:
			case 301:
			case 401:
			case 8: //internet_browsing_info today
				
				String hours_already_spent		 	 = replace(request.getParameter("hours"));
				String websites_visited_freetime = replace(request.getParameter("websites_visited_freetime"));
				
				insertQuery = " INSERT INTO internet_browsing_info VALUES "
						+ " ( '" + emailAddr +"', " + dayNo +", '"+ hours_already_spent +"', '"+websites_visited_freetime+"');";
				
				break;
				
			//case 9 is browsing_todo it is just info
			
			case 103:
			case 203:
			case 303:
			case 403:
			case 10: // honest_approx
				
				String news_time			= replace(request.getParameter("news"));
				String entertainment_time	= replace(request.getParameter("ent"));
				String free_browsing_time	= replace(request.getParameter("free"));
				String emails_time			= replace(request.getParameter("mails"));
				String comments				= replace(request.getParameter("comments"));
				
				insertQuery = " INSERT INTO honest_approx VALUES "
						+ " ( '" + emailAddr +"', " + dayNo +", '"+ news_time +"', '"+entertainment_time +"', '"+free_browsing_time +"', '"+emails_time + "', '" + comments+"');";
				
				break;
				
			// agree disagree 1
			
			case 171:
			case 271:
			case 371:
			case 471:
				
				String hypo 	= replace(request.getParameter("hypo"));
				String stra		= replace(request.getParameter("stra"));
				String dark		= replace(request.getParameter("dark"));
				String fear		= replace(request.getParameter("fear"));
				String honor		= replace(request.getParameter("honor"));
				String parents		= replace(request.getParameter("parents"));
				String unations		= replace(request.getParameter("unations"));
				String judiciary	= replace(request.getParameter("jud"));
				String horrified	= replace(request.getParameter("horr"));
				String bel			= replace(request.getParameter("bel"));
				String repo			= replace(request.getParameter("repo"));
				String fut			= replace(request.getParameter("fut"));
				String pol			= replace(request.getParameter("pol"));
				String elec			= replace(request.getParameter("elec"));
				String spo			= replace(request.getParameter("spo"));
				String expert		= replace(request.getParameter("expert"));
				String pun			= replace(request.getParameter("pun"));
				String counted		= replace(request.getParameter("counted"));
				String compet		= replace(request.getParameter("compet"));
				String ideal		= replace(request.getParameter("ideal"));
				String sales		= replace(request.getParameter("sales"));
				String sch			= replace(request.getParameter("sch"));
				String repair		= replace(request.getParameter("repair"));
				String insu			= replace(request.getParameter("insu"));
				
				insertQuery = " INSERT INTO agree_disagree1 VALUES "
						+ " ( '" + emailAddr +"', " + surveySet + ", "+ dayNo +", '"+ hypo +"', '"+stra
						+"', '"+dark+"', '"+fear+"','" + honor +"', '"+parents+"', '"+unations
						+"', '"+judiciary +"', '"+horrified+"', '"+bel+"', '"+repo+"','" + fut 
						+"', '"+pol+"', '"+elec
						+"', '"+spo +"', '"+expert+"', '"+pun+"', '"+counted+"','" + compet 
						+"', '"+ideal+"', '"+sales
						+"', '"+sch +"', '"+repair+"','" + insu +"');";
		
				
				break;
				
			// agree disagree 2
			
			case 172:
			case 272:
			case 372:
			case 472:
				
				String part 	= replace(request.getParameter("part"));
				String acce		= replace(request.getParameter("acce"));
				String unco		= replace(request.getParameter("unco"));
				String rela		= replace(request.getParameter("rela"));
				String leav		= replace(request.getParameter("leav"));
				String trus		= replace(request.getParameter("trus"));
				String susp		= replace(request.getParameter("susp"));
				String face		= replace(request.getParameter("face"));
				String scep		= replace(request.getParameter("scep"));
				String worth	= replace(request.getParameter("worth"));
				String beli		= replace(request.getParameter("bel"));
				String betr		= replace(request.getParameter("betr"));
				String bett		= replace(request.getParameter("bett"));
				String frnd		= replace(request.getParameter("frnd"));
				String feel		= replace(request.getParameter("feel"));
				String fool		= replace(request.getParameter("fool"));
				String dbt		= replace(request.getParameter("dbt"));
				String tell		= replace(request.getParameter("tell"));
				String accept	= replace(request.getParameter("accept"));
				String countd	= replace(request.getParameter("counted"));
				String competd	= replace(request.getParameter("compet"));
				String ideald	= replace(request.getParameter("ideal"));
				String salesd	= replace(request.getParameter("sales"));
				String schd		= replace(request.getParameter("sch"));
				String repaird	= replace(request.getParameter("repair"));
				String insud	= replace(request.getParameter("insu"));
				
				insertQuery = " INSERT INTO agree_disagree2 VALUES "
						+ " ( '" + emailAddr +"', " + surveySet + ", "+ dayNo +", '"+ part +"', '"+acce
						+"', '"+unco+"', '"+rela+"','" + leav +"', '"+trus+"', '"+susp
						+"', '"+face +"', '"+scep+"', '"+worth+"', '"+beli+"','" + betr 
						+"', '"+bett+"', '"+frnd
						+"', '"+feel +"', '"+fool+"', '"+dbt+"', '"+tell+"','" + accept 
						+"', '"+countd+"', '"+competd
						+"', '"+ideald +"', '"+salesd+"','" + schd
						+"', '"+repaird+"', '"+insud +"');";
				
				
				break;
				
			// agree disagree 3
			
			case 173:
			case 273:
			case 373:
			case 473:
				
				String calm 	= replace(request.getParameter("calm"));
				String secure	= replace(request.getParameter("secure"));
				String tense	= replace(request.getParameter("tense"));
				String strained	= replace(request.getParameter("strained"));
				String ease		= replace(request.getParameter("ease"));
				String upset4	= replace(request.getParameter("upset"));
				String worry	= replace(request.getParameter("worry"));
				String satisfy	= replace(request.getParameter("satisfy"));
				String fright	= replace(request.getParameter("fright"));
				String comfort	= replace(request.getParameter("comfort"));
				String selfc	= replace(request.getParameter("selfc"));
				String nervous3	= replace(request.getParameter("nervous"));
				String jittery3	= replace(request.getParameter("jittery"));
				String inde		= replace(request.getParameter("inde"));
				String relaxed	= replace(request.getParameter("relaxed"));
				String content3	= replace(request.getParameter("content"));
				String worried	= replace(request.getParameter("worried"));
				String confused	= replace(request.getParameter("confused"));
				String steady	= replace(request.getParameter("steady"));
				String pleasant	= replace(request.getParameter("pleasant"));
				
				insertQuery = " INSERT INTO agree_disagree3 VALUES "
						+ " ( '" + emailAddr +"', " + surveySet + ", "+ dayNo +", '"+ calm +"', '"+secure
						+"', '"+tense+"', '"+strained+"','" + ease +"', '"+upset4+"', '"+worry
						+"', '"+satisfy +"', '"+fright+"', '"+comfort+"', '"+selfc+"','" + nervous3 
						+"', '"+jittery3+"', '"+inde
						+"', '"+relaxed +"', '"+content3+"', '"+worried+"', '"+confused+"','" + steady 
						+"', '"+pleasant +"');";
				
				break;
				
			// agree disagree 4
			
			case 174:
			case 274:
			case 374:
			case 474:
				
				String pleasant4 	= replace(request.getParameter("pleasant"));
				String nervous4		= replace(request.getParameter("nervous"));
				String satisfied	= replace(request.getParameter("satisfied"));
				String happyothers	= replace(request.getParameter("happyothers"));
				String failure		= replace(request.getParameter("failure"));
				String rested		= replace(request.getParameter("rested"));
				String ccc			= replace(request.getParameter("ccc"));
				String difficulties	= replace(request.getParameter("difficulties"));
				String worrytoomuch	= replace(request.getParameter("worrytoomuch"));
				String happy4		= replace(request.getParameter("happy"));
				String disturbing	= replace(request.getParameter("disturbing"));
				String lacking		= replace(request.getParameter("lacking"));
				String secure4		= replace(request.getParameter("secure"));
				String easyd		= replace(request.getParameter("easyd"));
				String inadq		= replace(request.getParameter("inadq"));
				String content4		= replace(request.getParameter("content"));
				String unimp		= replace(request.getParameter("unimp"));
				String disapp		= replace(request.getParameter("disapp"));
				String steady4		= replace(request.getParameter("steady"));
				String tension		= replace(request.getParameter("tension"));
				
				insertQuery = " INSERT INTO agree_disagree4 VALUES "
						+ " ( '" + emailAddr +"', " + surveySet + ", "+ dayNo +", '"+ pleasant4 +"', '"+nervous4
						+"', '"+satisfied+"', '"+happyothers+"','" + failure +"', '"+rested+"', '"+ccc
						+"', '"+difficulties +"', '"+worrytoomuch+"', '"+happy4+"', '"+disturbing+"','" + lacking 
						+"', '"+secure4+"', '"+easyd
						+"', '"+inadq +"', '"+content4+"', '"+unimp+"', '"+disapp+"','" + steady4 
						+"', '"+tension +"');";
				
				break;
			
			// personlaity suvey - set1
			case 176: 
			case 177: 
			case 178: 
			case 179: 
			case 180: 
			case 181: 
			case 182:
			case 183: 
			case 184: 
			case 185: 
			case 186:
			case 187:
			case 188: 
				
				// personlaity suvey - set2	
			case 276: 
			case 277: 
			case 278: 
			case 279: 
			case 280: 
			case 281: 
			case 282:
			case 283: 
			case 284: 
			case 285: 
			case 286:
			case 287:
			case 288: 
				
			case 376: 
			case 377: 
			case 378: 
			case 379: 
			case 380: 
			case 381: 
			case 382:
			case 383: 
			case 384: 
			case 385: 
			case 386:
			case 387:
			case 388: 
				// personlaity suvey - set3
			case 476: 
			case 477: 
			case 478: 
			case 479: 
			case 480: 
			case 481: 
			case 482:
			case 483: 
			case 484: 
			case 485: 
			case 486:
			case 487:
			case 488: 
				// personlaity suvey - set4	
				
				int val = currState%100 - 75;
				int qtype = val;
				String reflect = replace(request.getParameter("reflect"));
				String degree  = replace(request.getParameter("degree"));
				
				
				insertQuery = " INSERT INTO personality_survey VALUES "
						+ " ( '" + emailAddr +"', " + surveySet + ", "+ dayNo + ", " + qtype 
						+", '"+ reflect +"', '"+ degree +"');";
				
				
				break;
				
				//thanks 1
			case 189:
			case 289:
			case 389:
			case 489:
				
				String comments1 = replace(request.getParameter("comments"));
				insertQuery = " INSERT INTO thanks1 VALUES "
						+ " ( '" + emailAddr +"', " + surveySet + ", "+ dayNo + ", '" + comments1 +"');";
				
				break;
				
				//thanks 2
			case 190:
			case 290:
			case 390:
			case 490:
				String comments2 = replace(request.getParameter("comments"));
				insertQuery = " INSERT INTO thanks2 VALUES "
						+ " ( '" + emailAddr +"', " + surveySet + ", "+ dayNo + ", '" + comments2 +"');";
				
				
				break;
				
				//thanks 3
			case 191:
			case 291:
			case 391:
			case 491:
				
				
				String purpose = replace(request.getParameter("purpose"));
				String reasons = replace(request.getParameter("reasons"));
				
				insertQuery = " INSERT INTO thanks3 VALUES "
						+ " ( '" + emailAddr +"', " + surveySet + ", "+ dayNo + ", '" + purpose + "', '"+ reasons +"');";
				
				
				break;
				
				//thanks 5 experience
			case 193:
			case 293:
			case 393:
			case 493:
				
				String clear 				= replace(request.getParameter("clear"));
				String plugin_difficulties 	= replace(request.getParameter("plugin_difficulties"));
				String social_engineering 	= replace(request.getParameter("social_engineering"));
				String cybercrime 			= replace(request.getParameter("cybercrime"));
				String suspicious 			= replace(request.getParameter("suspicious"));
				String reaction1 			= replace(request.getParameter("reaction1"));
				String reaction2 			= replace(request.getParameter("reaction2"));
				String reasons_victims 		= replace(request.getParameter("reasons_victims"));
				String behaviour_change 	= replace(request.getParameter("behaviour_change"));
				
				insertQuery = " INSERT INTO thanks5_experience VALUES "
						+ " ( '" + emailAddr +"', " + surveySet + ", "+ dayNo +", '"+ clear +"', '"+plugin_difficulties
						+"', '"+social_engineering+"', '"+cybercrime+"','" + suspicious +"', '"+reaction1+"', '"+reaction2
						+"', '"+reasons_victims
						+"', '"+behaviour_change +"');";
				
				break;
				
				//thanks 6 suggestions
			case 194:
			case 294:
			case 394:
			case 494:
				
				String suggestions = replace(request.getParameter("suggestions"));
				
				insertQuery = " INSERT INTO thanks6_suggestions VALUES "
						+ " ( '" + emailAddr +"', " + surveySet + ", "+ dayNo + ", '" + suggestions + "');";
				
				
				
				break;
			
				
			default: //survey email question pages only
				
				String response   	 = replace(request.getParameter("interested"));
				int questionType = 1;
				int mailNo = 1;
				
				if (currState >11 && currState <20){
					break;
				}
				
				// ques 1
				if (currState >=106 && currState <=126){
					mailNo = currState - 105;
					questionType = 1;
				}
				
				if (currState >=206 && currState <=226){
					mailNo = currState - 205;
					questionType = 1;
				}
				
				if (currState >=306 && currState <=326){
					mailNo = currState - 305;
					questionType = 1;
				}
				
				if (currState >=406 && currState <=426){
					mailNo = currState - 405;
					questionType = 1;
				}
				
				// ques 2
				if (currState >=128 && currState <=148){
					mailNo = currState - 127;
					questionType = 2;
				}
				
				if (currState >=228 && currState <=248){
					mailNo = currState - 227;
					questionType = 2;
				}
				
				if (currState >=328 && currState <=348){
					mailNo = currState - 327;
					questionType = 2;
				}
				
				if (currState >=428 && currState <=448){
					mailNo = currState - 427;
					questionType = 2;
				}
				
				// ques 3
				if (currState >=150 && currState <=170){
					mailNo = currState - 149;
					questionType = 3;
				}
				
				if (currState >=250 && currState <=270){
					mailNo = currState - 249;
					questionType = 3;
				}
				
				if (currState >=350 && currState <=370){
					mailNo = currState - 349;
					questionType = 3;
				}
				
				if (currState >=450 && currState <=470){
					mailNo = currState - 449;
					questionType = 3;
				}
				
				insertQuery = " INSERT INTO survey_mails VALUES "
						+ " ( '" + emailAddr +"', " + surveySet + ", " + dayNo +", "+ mailNo +", '"+ questionType +"', '"+response +"');";
				
				break;
			
		}
		System.out.println("submitForm ends!!");
		logger.info("submitForm ends!!");
		return executeInsertUpdate(insertQuery, null);
	}
	
	private int executeInsertUpdate(String query, java.sql.Timestamp currTimeStamp) {
		if (query.length() == 0){
			logger.info("Empty Query");
			return 0;
		}
		int status = 0;
		Connection con = null;
        PreparedStatement pStmt = null;
		try {
        		logger.info("Executing the query: ");
        		logger.info(query);
        		logger.info("");
				con = DriverManager.getConnection(dburl, uname, pwd);
				pStmt = con.prepareStatement(query);
				if (currTimeStamp != null) {
					logger.info("THIS SHOULD BE user_state insert/update");
					pStmt.setTimestamp(1, currTimeStamp);
				}
		    	status = pStmt.executeUpdate();
		    	logger.info("updateState success!! - insert/update state done");
	    	
	    } catch (SQLException ex) {
	    		ex.printStackTrace();
	    		logger.error(ex);
	    		status = -1;
	    } finally {
	
		        try {
		            if (pStmt != null) {
		                pStmt.close();
		            }
		            if (con != null) {
		                con.close();
		            }
		
		        } catch (SQLException ex) {
		        	ex.printStackTrace();
		        }
	    	}
		return status;
	}
	
	public String replace(String str) {
		if (str == null) return null;
		try {
			return str.replaceAll("['\"();]", "");
		}catch(Exception e){
			return null;
		}
	}
	
	public LatestState getLatestState(String emailAddr) {
		
		LatestState latest = null;
		
		String query = " SELECT * FROM "
				  + " user_state WHERE "
				  + " user_email_id = '"+emailAddr+"'" 
				  + " ORDER BY day_no DESC, state_no DESC LIMIT 1;";
	
		Connection con = null;
		PreparedStatement pStmt = null;
		ResultSet rS = null;
  
		try {
				
				logger.info("Executing latestState query: ");
	    		logger.info(query);
	    		logger.info("");
	    		
				con = DriverManager.getConnection(dburl, uname, pwd);
				pStmt = con.prepareStatement(query);
		    	rS = pStmt.executeQuery();
	  	
		    	logger.info("getLatestState success!! - insert/update state done");
		    	
			  	while(rS.next()) {
			  		latest = new LatestState();
			  		latest.day 		= rS.getInt("day_no");
			  		latest.state 	= rS.getInt("state_no");
			  		latest.dbtimestamp = rS.getTimestamp("timestamp");
			  		logger.info("fetched dbtimestamp: " + latest.dbtimestamp);
			  	}
	  	
		   } catch (SQLException ex) {
		  		ex.printStackTrace();
		  		logger.error("EXCEPTION in getRedirectURL");
		  		logger.error(ex);
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
		      	ex.printStackTrace();
		      	logger.error(ex);
		      }
		   }
		return latest;
  	}
	
	public java.sql.Timestamp getCurrTimeStamp(){
		return new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
	}
}

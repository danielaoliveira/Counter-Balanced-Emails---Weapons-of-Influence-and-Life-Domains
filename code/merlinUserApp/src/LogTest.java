import org.apache.log4j.Logger;

public class LogTest {
	
	final static Logger logger = Logger.getLogger(LogTest.class);
	
	public static void main(String[] args){
		
		foo();
	}
	
	public static void foo(){
		
		System.out.println("foo start");
		
		if (logger.isDebugEnabled()){
			logger.debug("debug enabled");
		}
		
		if (logger.isInfoEnabled()){
			logger.info("debug enabled");
		}
		
		logger.error("show some error");
		
		System.out.println("foo end");
	}

}

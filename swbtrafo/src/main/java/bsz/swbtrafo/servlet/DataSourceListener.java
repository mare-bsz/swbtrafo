package bsz.swbtrafo.servlet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Stellt ein DataSource-Objekt als Attribut im ServletContext bereit.
 * 
 * Das DataSource-Objekt wird vom Tomcat nach Angaben der META-INF/context.xml oder
 * nach /conf/Catalina/../curator.xml generiert und konfiguriert und unter dem Namen 
 * jdbc/swbdepot im Naming-Kontext zur Verf�gung gestellt. Es wird unter dem Sch�ssel
 * dataSource im Application-Scope der Curator-Webapplikation zur Verf�gung gestellt.
 * 
 * (die contextInitialized Methode eines ServletContextListeners wird immer beim
 * Start einer Applikation ausgef�hrt; contextDestroyed entsprechend, wenn die 
 * Anwendung heruntergefahren wird.)
 */

public class DataSourceListener implements ServletContextListener { 
	
	private Logger log = LogManager.getLogger(DataSourceListener.class); 
		
	/**
     * Ein DataSource-Objekt wird aus dem Naming-Kontext bezogen und in den Applications-Scope gesetzt.
     * 
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	try {
        	Context ini = new InitialContext();
			Context env = (Context) ini.lookup("java:comp/env");
			final DataSource dataSource = (DataSource)env.lookup("jdbc/swbdepot");
			sce.getServletContext().setAttribute("swbdepot", dataSource);
		} catch (NamingException e) {
			log.error("DataSource jdbc/swbdepot couldn't be initialized!");
		}
    }
    
    /**
     * Muss derzeit gar nichts machen. Die DataSource kann man nicht schlie�en.
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
        
    }
    
	
}

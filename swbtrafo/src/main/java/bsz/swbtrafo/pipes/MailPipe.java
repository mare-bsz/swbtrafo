package bsz.swbtrafo.pipes;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.text.StrSubstitutor;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;

public class MailPipe extends TrafoPipe {	
	
	@Override
	public void finit() throws TrafoException {
		try {
			StrSubstitutor sub = new StrSubstitutor(trafoPipeline.getParameters());
			final Properties props = new Properties();
			props.put("mail.smtp.host", trafoPipeline.getTrafoContext().getInitParameter("mail.smtp.host"));
			final Session session = Session.getInstance(props, null);			
			
			final Message msg = new MimeMessage( session );	
			final InternetAddress addressTo = new InternetAddress(getParameter("to"));
			final InternetAddress fromAddress = new InternetAddress(getParameter("from"));
			final String body = sub.replace(getParameter("message")) != null ? sub.replace(getParameter("message")) : "message nicht gefunden"; 
			msg.setFrom(fromAddress);
			msg.setRecipient( Message.RecipientType.TO, addressTo );	
			msg.setSubject(getParameter("subject"));
			msg.setContent(body, "text/plain" );
			Transport.send( msg );
		} catch (MessagingException e) {
			throw new TrafoException(e);
		}
		super.finit();
	}		
}
package bsz.swbtrafo.pipes;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoTicket;
import nu.xom.Nodes;

/**
 * Eine XPathPipe extrahiert XPath-Ausdrücke aus dem Xom-Document und legt ihn im Ticket ab.
 * <p>
 * Die XPath-Ausdrücke müssen dabei als Parameter übergeben sein, deren ANmen mit "xpath" beginnt.  
 * 
 * @author Christof Mainberger (christof.mainberger@bsz-bw.de) 
 */
public class XPathPipe extends TrafoPipe {	
	
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {
		
		for (String key : getParameterNames()) {
			if (key.startsWith("xpath")) {
				Nodes results = ticket.getDocument().query(getParameter(key));
				if (results.size() > 0) {				
					ticket.put(key, ticket.getDocument().query(getParameter(key)).get(0).getValue());
				}
			}
		}
		super.process(ticket);
	}

}

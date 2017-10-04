package bsz.swbtrafo.pipes.bildimport;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoTicket;

public class AnalyseFilenamePipe extends TrafoPipe {
	
	Pattern kuenstlerInvnr = Pattern.compile("^([a-z\\-]+?)_(.+)\\.\\w{3}$");
	
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {
				
		final String bildDateiName = ticket.getPath().getFileName().toString();
		final Matcher m = kuenstlerInvnr.matcher(bildDateiName);
		if (m.matches()) {
			ticket.put("kuenstler", m.group(1));
			ticket.put("invnr", m.group(2));
			super.process(ticket);
		} else {
			getTrafoPipeline().addMessage(bildDateiName, bildDateiName + " wird nicht analysiert");
		}
	}
	
}

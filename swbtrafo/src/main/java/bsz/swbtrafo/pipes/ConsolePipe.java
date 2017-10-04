package bsz.swbtrafo.pipes;

import java.io.IOException;
import java.io.PrintStream;
import java.util.Map.Entry;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoTicket;
import nu.xom.Serializer;

/**
 * ConsolePipe ist eine {@link TrafoPipe}, die ein {@link TrafoTicket} auf die Console oder in eine Textdatei ausgibt.
 * <p>
 * Ggf. wird der absolute Pfad der Textdatei dazu unter dem Schlüssel "outFile" in der Konfiguration festgelegt. 
 * 
 * @author Christof Mainberger (christof.mainberger@bsz-bw.de) *
 */
public class ConsolePipe extends TrafoPipe {
	
	Serializer serializer;
	PrintStream out = null;
	
	@Override
	public void init() throws TrafoException {		
		try {
			if (getParameter("outFile") != null) {
				out = new PrintStream(getParameter("outFile"), "UTF-8");
			} else {
				out = System.out;
			}
			serializer = new Serializer(out, "ISO-8859-1");
			serializer.setIndent(4);
			serializer.setMaxLength(64);
		} catch (Exception e) {
			throw new TrafoException(e);
		}
		super.init();
	}
	
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {
		if (ticket.getDocument() != null) {
			try {				
				serializer.write(ticket.getDocument());
				serializer.flush();
			} catch (IOException e) {
				throw new TrafoException(e);
			}			
		}
		out.println(ticket);		
		super.process(ticket);
	}	
	
	@Override
	public void finit() throws TrafoException {		
		for (String msg : trafoPipeline.getMessages()) {
			out.println(msg);
		}
		out.close();
		super.finit();
	}
}

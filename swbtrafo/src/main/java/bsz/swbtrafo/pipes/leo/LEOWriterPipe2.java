package bsz.swbtrafo.pipes.leo;

import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoTicket;
import nu.xom.Serializer;

/** 
 * @author Christof Mainberger (christof.mainberger@bsz-bw.de) *
 */
public class LEOWriterPipe2 extends TrafoPipe {
	
	ZipOutputStream zipOutputStream = null;	
	
	@Override
	public void init() throws TrafoException {		
		zipOutputStream = (ZipOutputStream) trafoPipeline.getAttribute("zipoutputstream");	
		super.init();
	}
		
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {	
		try {
			zipOutputStream.putNextEntry(new ZipEntry(getParameter("dateiname") + ".xml"));
			final Serializer serializer = new Serializer(zipOutputStream, "UTF-8");
			serializer.setIndent(0); // kein Indent
			serializer.setMaxLength(0); // beliebige Länge
			serializer.write(ticket.getDocument());
			serializer.flush();
			zipOutputStream.closeEntry();
		} catch (IOException e) {
			throw new TrafoException(e);
		}
		super.process(ticket);
	}		
}

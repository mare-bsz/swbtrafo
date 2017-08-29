package bsz.swbtrafo.pipes.leo;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.zip.ZipInputStream;

import javax.servlet.http.Part;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoTicket;
import nu.xom.Builder;
import nu.xom.Document;

/**
 * Eine XmlReaderPipe liest ein XML-File und splittet es in einzelne Datensätze.
 * <p> 
 * Der Name der zu verarbeitenden Datei wird als TrafoTicket-Attribut "dataFile" erwartet. Die mit
 * Slashs getrennte Liste der Elemente, die von der Wurzel ausgehend ignoriert werden sollen, 
 * werden im Parameter "records" festgelegt. Für jeden Record, der so erreicht wird, wird ein 
 * eigenes Ticket an die nächste Pipe emittiert.  
 *  
 * @author Christof Mainberger (christof.mainberger@bsz-bw.de)
 */
public class ZipXmlReaderPipe extends TrafoPipe {
	
	final ByteArrayOutputStream xmlDoc = new ByteArrayOutputStream();	
    final byte[] buf = new byte[2048];   
    final Builder parser = new Builder();
	
	@Override
	public void process(TrafoTicket trafoTicket) throws TrafoException {		
		try {
			final ZipInputStream zipInputStream = new ZipInputStream(((Part) trafoTicket.get("xmlsource")).getInputStream());
			while (zipInputStream.getNextEntry() != null) {				
				int length;
	            while ((length = zipInputStream.read(buf, 0, buf.length)) >= 0) {
	            	xmlDoc.write(buf, 0, length);
	            }
	            final TrafoTicket ticket = new TrafoTicket();	                
                final Document doc = parser.build(new ByteArrayInputStream(xmlDoc.toByteArray()));                
				ticket.setDocument(doc);
	            xmlDoc.reset();
				super.process(ticket);
				zipInputStream.closeEntry();
			}			
		} catch (Exception e) {
			e.printStackTrace();
			throw new TrafoException(e);
		} 
	}
	
}

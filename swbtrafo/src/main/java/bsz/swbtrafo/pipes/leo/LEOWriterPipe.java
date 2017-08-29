package bsz.swbtrafo.pipes.leo;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoResult;
import bsz.swbtrafo.TrafoTicket;
import nu.xom.Serializer;

/** 
 * @author Christof Mainberger (christof.mainberger@bsz-bw.de) *
 */
public class LEOWriterPipe extends TrafoPipe {
	
	ZipOutputStream out = null;	
	
	@Override
	public void init() throws TrafoException {
		
		final String filename = determineFilename();
			
		final TrafoResult result = new TrafoResult();
		result.setName(filename  + ".zip");
		result.setPath(Paths.get(trafoPipeline.getTempPath(filename + ".zip")));
		result.setMime("application/zip");
		result.setEncoding("UTF-8");
		trafoPipeline.addResult(result);
		try {			
			out = new ZipOutputStream(new FileOutputStream(trafoPipeline.getTempPath(filename + ".zip")));	
			out.putNextEntry(new ZipEntry(filename + ".xml"));
		} catch (IOException e) {
			throw new TrafoException("Erzeugen des Zip-Files: " + trafoPipeline.getTempPath(filename + ".zip"), e);
		}
		super.init();
	}
		
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {	
		try {			
			final Serializer serializer = new Serializer(out, "UTF-8");
			serializer.setIndent(0); // kein Indent
			serializer.setMaxLength(0); // beliebige Länge
			serializer.write(ticket.getDocument());
			serializer.flush();
		} catch (IOException e) {
			throw new TrafoException(e);
		}
		super.process(ticket);
	}
	
	@Override
	public void finit() throws TrafoException {
		try {
			out.closeEntry();
			out.flush();
			out.close();
		} catch (IOException e) {
			throw new TrafoException(e);
		}
		super.finit();
	}
	
	private String determineFilename() {
		return (getParameter("filename") != null)? getParameter("filename").replace("%d", getCurrentDate()) : "download.zip";		
	}
	
	private String getCurrentDate() {
		GregorianCalendar now = new GregorianCalendar();
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DAY_OF_MONTH);
		return "" + now.get(Calendar.YEAR) + (month < 10?"0":"")+ month + (day < 10?"0":"") + day;
	}	
}

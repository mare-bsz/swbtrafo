package bsz.swbtrafo.pipes.leo;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.zip.ZipOutputStream;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoResult;

/** 
 * @author Christof Mainberger (christof.mainberger@bsz-bw.de) *
 */
public class ZipInitPipe extends TrafoPipe {
	
	ZipOutputStream zipOutputStream = null;
	
	@Override
	public void init() throws TrafoException {
		
		zipOutputStream = (ZipOutputStream) trafoPipeline.getAttribute("zipoutputstream");
		
		if (zipOutputStream == null) {
		
			final String filename = determineFilename();
			
			trafoPipeline.addParameter("dateiname", filename);
				
			final TrafoResult result = new TrafoResult();
			result.setName(filename  + ".zip");
			result.setPath(Paths.get(trafoPipeline.getTempPath(filename + ".zip")));
			result.setMime("application/zip");
			result.setEncoding("UTF-8");
			trafoPipeline.addResult(result);
			try {			
				zipOutputStream = new ZipOutputStream(new FileOutputStream(trafoPipeline.getTempPath(filename + ".zip")));
				trafoPipeline.setAttribute("zipoutputstream", zipOutputStream);
			} catch (IOException e) {
				throw new TrafoException("Erzeugen des Zip-Files: " + trafoPipeline.getTempPath(filename + ".zip"), e);
			}
		}
		super.init();
	}	
	
	@Override
	public void finit() throws TrafoException {
		super.finit();
		if (zipOutputStream != null) {
			try {
				zipOutputStream.flush();
				zipOutputStream.close();
				zipOutputStream = null;
			} catch (IOException e) {
				throw new TrafoException("Fehler beim Schließen des ZipOutputStreams", e);
			}
		}
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

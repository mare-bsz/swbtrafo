package bsz.swbtrafo.pipes;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.GregorianCalendar;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoResult;

public class DownloadPipe  extends TrafoPipe {	
	
	protected Writer wrt;
	
	protected String mimetype;
	protected void setMimetype(String mimetype) { this.mimetype = mimetype; }
		
	protected String filename;
	protected void setFilename(String filename) { this.filename = filename; }
			
	@Override
	public void init() throws TrafoException {
		TrafoResult result = new TrafoResult();
		result.setName(filename);
		result.setPath(Paths.get(trafoPipeline.getTempPath(filename)));
		result.setMime(mimetype);
		result.setEncoding("UTF-8");
		trafoPipeline.addResult(result);
		try {
			wrt = new FileWriter(trafoPipeline.getTempPath(filename));
		} catch (IOException e) {
			throw new TrafoException(e);
		}		
		super.init();
	}
	
	protected String getCurrentDate() {
		GregorianCalendar now = new GregorianCalendar();
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DAY_OF_MONTH);
		return "" + now.get(Calendar.YEAR) + (month < 10?"0":"")+ month + (day < 10?"0":"") + day;
	}
	
	

}

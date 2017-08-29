package bsz.swbtrafo.pipes;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoResult;
import bsz.swbtrafo.TrafoTicket;
import nu.xom.Document;
import nu.xom.Serializer;

public class KenomWriterPipe extends TrafoPipe {
	
	String currentType;	
	ZipOutputStream out;
	Serializer serializer;
	
	@Override
	public void init() throws TrafoException {
		
		final String filename = determineFilename();
			
		final TrafoResult result = new TrafoResult();
		result.setName(filename);
		result.setPath(Paths.get(trafoPipeline.getTempPath(filename)));
		result.setMime("application/zip");
		result.setEncoding("UTF-8");
		trafoPipeline.addResult(result);
		try {			
			out = new ZipOutputStream(new FileOutputStream(trafoPipeline.getTempPath(filename)));	
			serializer = new Serializer(out, "UTF-8");
			serializer.setIndent(0);
			serializer.setMaxLength(0);
		} catch (IOException e) {
			throw new TrafoException("Erzeugen des Zip-Files: " + trafoPipeline.getTempPath(filename), e);
		}
		super.init();
	}
		
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {
		try {
			final String recid = ticket.getString("xpath.recid");
			copyImage(recid, ticket.getString("xpath.front"));
			copyImage(recid, ticket.getString("xpath.back"));
			out.putNextEntry(new ZipEntry(recid + ".xml"));
			serializer.write((Document)ticket.getDocument());
			out.closeEntry();
		} catch (IOException e) {
			throw new TrafoException(e);
		}
		super.process(ticket);
	}
	
	@Override
	public void finit() throws TrafoException {
		try {
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
	
	private void copyImage(final String recid, final String pfad) throws IOException {
		if (pfad != null && ! pfad.isEmpty()) {
			final File image = new File(getParameter("imagepath") + pfad.replace('\\', '/'));
			if (image.exists()) {
				try {
					out.putNextEntry(new ZipEntry(recid + "_media/" + image.getName().replaceAll(" ","_")));				
					writeToZip(image);						
					out.closeEntry();
				} catch (Exception e) {
					trafoPipeline.addMessage(getParameter("imagepath") + pfad.replace('\\', '/') + " verursacht einen Fehler");
				}
			}
		}
	}

	private void writeToZip(final File image) throws FileNotFoundException, IOException {
		final FileInputStream fis = new FileInputStream(image);
		final FileChannel channel = fis.getChannel();
		byte[] buffer = new byte[256 * 1024];
		final ByteBuffer byteBuffer = ByteBuffer.wrap(buffer);
		try {
		    for (int length = 0; (length = channel.read(byteBuffer)) != -1;) {
		       out.write(buffer, 0, length);
		       byteBuffer.clear();
		    }
		} finally {
		    fis.close();
		}
	}
}

package bsz.swbtrafo.pipes.leo;

import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoTicket;
import nu.xom.Document;
import nu.xom.Element;
import nu.xom.Nodes;

/** 
 * @author Christof Mainberger (christof.mainberger@bsz-bw.de) *
 */
public class LEOIncludeImgPipe extends TrafoPipe {
	
	ZipOutputStream zipOutputStream = null;	
	
	@Override
	public void init() throws TrafoException {		
		zipOutputStream = (ZipOutputStream) trafoPipeline.getAttribute("zipoutputstream");		
		super.init();
	}
			
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {	
		
		Document xom = ticket.getDocument();
		Nodes imgNodes = xom.query(getParameter("imgPath"));
		if (imgNodes.size() > 0) {		
			Element img = (Element) imgNodes.get(0);
			Path imgFile = Paths.get(getParameter("imagePath") + img.getValue().substring(3).replace('\\', '/'));
			if (Files.exists(imgFile)) {
				try {					
					zipOutputStream.putNextEntry(new ZipEntry(imgFile.getFileName().toString()));
					Files.copy(imgFile, zipOutputStream);
					zipOutputStream.closeEntry();
				} catch (IOException e) {
					throw new TrafoException(imgFile + ": " + e.getMessage());
				}
			} else {
				throw new TrafoException(imgFile + " exisitiert nicht");
			}
		} else {
			System.out.println(getParameter("imgPath") + ": Knoten nicht gefunden");
		}
		super.process(ticket);
	}
		
}

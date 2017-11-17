package bsz.swbtrafo.pipes.leo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.Set;
import java.util.zip.ZipEntry;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoTicket;
import nu.xom.Document;
import nu.xom.Element;
import nu.xom.Nodes;
import nu.xom.XPathContext;

/** 
 * @author Christof Mainberger (christof.mainberger@bsz-bw.de) *
 */
public class LEOIncludeImgPipe extends ZipInitPipe {
	
	XPathContext context;
	Set<String> bilder = new HashSet<String>();
	
	@Override
	public void init() throws TrafoException {
		super.init();
		context = new XPathContext("leo", "http://www.leo-bw.de/xsd/leobw-1.0.0");
		try {
			zipOutputStream.putNextEntry(new ZipEntry("Bilder/"));
		} catch (IOException e) {
			throw new TrafoException("Ordner Bilder laesst sich nicht anlegen: " + e.getMessage());
		}		
	}
			
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {	
		
		Document xom = ticket.getDocument();		
		Nodes imgNodes = xom.query(getParameter("imgPath"), context);
		for (int i = 0; i < imgNodes.size(); i++) {			
			Element img = (Element) imgNodes.get(i);
			Path imgFile = Paths.get(getParameter("imagePath") + img.getValue().substring(3).replace('\\', '/'));
			if (Files.exists(imgFile)) {
				if (! bilder.contains(img.getValue())) {
					try {					
						zipOutputStream.putNextEntry(new ZipEntry("Bilder/"+ imgFile.getFileName().toString()));
						Files.copy(imgFile, zipOutputStream);
						zipOutputStream.closeEntry();
					} catch (IOException e) {
						throw new TrafoException(imgFile + ": " + e.getMessage());
					}
					bilder.add(img.getValue());
				}
			} else {
				trafoPipeline.addMessage("BLM-Leo-Pipeline: Bild-Pfad: " + img.getValue() + " existiert nicht");
			}
			img.getParent().removeChild(img);
		} 
		super.process(ticket);
	}
		
}

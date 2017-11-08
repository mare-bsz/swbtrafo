package bsz.swbtrafo.pipes.leo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoTicket;
import nu.xom.Document;
import nu.xom.Element;
import nu.xom.Nodes;
import nu.xom.XPathContext;

/** 
 * @author Christof Mainberger (christof.mainberger@bsz-bw.de) *
 */
public class LEOIncludeImgPipe extends TrafoPipe {
	
	ZipOutputStream zipOutputStream = null;	
	XPathContext context;
	Set<String> bilder = new HashSet<String>();
	
	@Override
	public void init() throws TrafoException {
		context = new XPathContext("leo", "http://www.leo-bw.de/xsd/leobw-1.0.0");
		zipOutputStream = (ZipOutputStream) trafoPipeline.getAttribute("zipoutputstream");		
		super.init();
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

package bsz.swbtrafo.pipes.leo;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;

import javax.swing.JEditorPane;
import javax.swing.text.BadLocationException;
import javax.swing.text.EditorKit;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoTicket;
import nu.xom.Document;
import nu.xom.Element;
import nu.xom.Nodes;

/** 
 * @author Christof Mainberger (christof.mainberger@bsz-bw.de) *
 */
public class RtfImportPipe extends TrafoPipe {
			
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {	
		
		Document xom = ticket.getDocument();
		Nodes rtfNodes = xom.query(getParameter("rtfPath"));
		if (rtfNodes.size() > 0) {		
			Element rtf = (Element) rtfNodes.get(0);
						
			File rtfFile = new File(getParameter("imagePath") + rtf.getValue().substring(3).replace('\\', '/'));
			if (rtfFile.exists()) {
				try {
					String htmlText = rtfToHtml(new FileReader(rtfFile));
					rtf.removeChildren();
					rtf.appendChild(htmlText);
				} catch (IOException e) {
					throw new TrafoException(rtfFile.getAbsolutePath() + ": " + e.getMessage());
				}
			} else {
				throw new TrafoException(rtfFile.getAbsolutePath() + " exisitiert nicht");
			}
		}
		super.process(ticket);
	}
		
	private static String rtfToHtml(Reader rtf) throws IOException {
		JEditorPane p = new JEditorPane();
		p.setContentType("text/rtf");
		EditorKit kitRtf = p.getEditorKitForContentType("text/rtf");
		try {
			kitRtf.read(rtf, p.getDocument(), 0);
			kitRtf = null;
			EditorKit kitHtml = p.getEditorKitForContentType("text/plain");
			Writer writer = new StringWriter();
			kitHtml.write(writer, p.getDocument(), 0, p.getDocument().getLength());
			return writer.toString();
		} catch (BadLocationException e) {
			e.printStackTrace();
		}
		return null;
	}
	
		
}

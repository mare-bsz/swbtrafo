package bsz.swbtrafo.pipes.bildimport;

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoTicket;
import bsz.swbtrafo.pipes.DownloadPipe;

public class ImdasImportWriterPipe extends DownloadPipe {
	
	char separator;
	char delimiter;	
	List<String> rems;
	Map<String,BigDecimal> kostenstellen;
	
	public void init() throws TrafoException {
		
		try {
			setMimetype("text/csv");
					
			if (getParameter("filename") != null) {
				setFilename(getParameter("filename").replace("%d", getCurrentDate()));
			} else {
				setFilename("download.txt");
			}		
			super.init();			
			if (getParameter("separator") != null) {
				if ("tab".equals(getParameter("separator"))) {
					separator = '\t';
				} else {
					separator = getParameter("separator").charAt(0);
				}
			} else {
				separator = ',';
			}
			if (getParameter("delimiter") != null) {
				if ("quote".equals(getParameter("delimiter"))) {
					delimiter = '\"';
				} else {
					delimiter = getParameter("delimiter").charAt(0);
				}
			} else {
				delimiter = '\"';
			}
			if ("true".equals(getParameter("headerline"))) {	
				wrt.write('\ufeff');
				wrt.write("Inv.Nr." + separator);
				wrt.write("Dateinamen" + separator);
				wrt.write("Objektbezeichnung" + separator);
				wrt.write("Medientyp" + separator);
				wrt.write("Sammlung" + separator);
				wrt.write("Eing.Nr." + separator);
				wrt.write("Status" + separator);
				wrt.write("Atelier" + separator);				
				wrt.write("Fotograf" + separator);
				wrt.write("Aufnahmeort" + separator);
				wrt.write("Aufnahmedat." + separator);
				wrt.write("Nutzungsrechte" + separator);
				wrt.write("Auflösung" + separator);
				wrt.write("Techn. Beschr. Negativ" + "\n");
			}
		} catch (IOException e) {
			throw new TrafoException(e);
		}		
		
	}
	
	
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {
		try {					
			Path target = ticket.getPath();
			wrt.write(ticket.getString("invnr") + separator);
			wrt.write("Z:\\\\" + toZPath(target.toString()) + separator);
			wrt.write(toProperCase(ticket.getString("kuenstler")) + ": " + ticket.getString("invnr") + separator);
			wrt.write(prepareCSV(trafoPipeline.getParameters().get("medientyp"), "string") + separator);
			wrt.write(prepareCSV(ticket.getString("sammlung"), "string") + separator);
			wrt.write(prepareCSV(trafoPipeline.getParameters().get("eingnr"), "string") + separator);
			wrt.write(prepareCSV(trafoPipeline.getParameters().get("status"), "string") + separator);
			wrt.write(prepareCSV(trafoPipeline.getParameters().get("atelier"), "string") + separator);			
			wrt.write(prepareCSV(ticket.getString("fotograf"), "string") + separator);			
			wrt.write(prepareCSV(trafoPipeline.getParameters().get("aufnahmeort"), "string") + separator);
			wrt.write(ticket.getString("aufnahmedat") + separator);
			wrt.write(prepareCSV(trafoPipeline.getParameters().get("rechte"), "string") + separator);
			wrt.write(prepareCSV(trafoPipeline.getParameters().get("aufloesung"), "string") + separator);
			wrt.write(prepareCSV(trafoPipeline.getParameters().get("technikbeschreibung"), "string") + "\n");			
		} catch (IOException e) {
			throw new TrafoException(e);
		}
		super.process(ticket);
	}
	
	private String toZPath(String src) {
		return src.replaceFirst(getParameter("pathprefix"), "").replace('/', '\\');
	}
	
	private String toProperCase(String src) {
		return src.substring(0, 1).toUpperCase() + src.substring(1);
	}
	
	@Override
	public void finit() throws TrafoException {
		try {
			wrt.flush();
			wrt.close();
		} catch (IOException e) {
			throw new TrafoException(e);
		}
		super.finit();
	}
	
	private String prepareCSV(String value, String type) {
		try {
			value = value.replaceAll("&quot;", "\"");
			value = value.replaceAll("&apos;", "'");
			value = value.replaceAll("&gt;",">");
			value = value.replaceAll("&lt;", "<");
			value = value.replaceAll("&amp;", "&");
			if ("string".equals(type)) {
				StringBuilder result = new StringBuilder();
				result.append(delimiter);
				for (char c : value.toCharArray()) {
					if (c == delimiter) { 
						result.append(" ");
					} else if (c == separator) {
						result.append(" ");
					} else {
						switch (c) {
						case '\'':
							result.append(' ');
							break;
						case '\n':
							result.append(' ');
							break;
						case '\r':
							result.append(' ');
						default:
							result.append(c);
						}
					}
				}
				return result.append(delimiter).toString();
			} else {
				return value.trim();
			}
		} catch (Exception e) {
			System.out.println(value + " :: " + e.getMessage());
		}
		return "";
	}
	
}

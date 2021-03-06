package bsz.swbtrafo.pipes.lzaladefiles;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.sql.DataSource;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoTicket;
import bsz.swbtrafo.pipes.DownloadPipe;

public class CreateLadeFilePipe extends DownloadPipe {
	
	private final DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	private final Pattern aufnahmedatum = Pattern.compile("^(\\d{4})-(\\d{2})-(\\d{2})T.*$");	
	
	@Override
	public void init() throws TrafoException {
		
		setMimetype("text/plain; charset=UTF-8");
		setEncoding("UTF-8");
		
		if (getParameter("filename") != null) {
			setFilename(getParameter("filename").replace("%d", getCurrentDate()));
		} else {
			setFilename("download.txt");
		}
		super.init();
	}
	
	@Override
	public void process(TrafoTicket ticket) throws TrafoException { 
		
		try {	
			
			final DataSource datasource = (DataSource) trafoPipeline.getTrafoContext().getAttribute("swbdepot");
	    			
			/* Eine Connection wird bereitgestellt. */				
			try (Connection connection = datasource.getConnection()) {
						
				/* Die Kopfzeile wird geschrieben */
				//out.write('\ufeff'); // BOM - wird vermutlich nciht gebraucht.
				wrt.write("Dateinamen\t");
				wrt.write("Vorschlag Merkmal (LZA)\t");
				wrt.write("Vorschlag Inv.Nr. (LZA)\t");
				wrt.write("Vorschlag Aufnahmekennung (LZA)\t");
				wrt.write("Aufnahmeort\t");
				wrt.write("Fotograf\t");
				wrt.write("Atelier\t");
				wrt.write("Nutzungsrechte\t");
				wrt.write("Aufnahmedat.\t");
				wrt.write("Notiz\t");
				wrt.write("Auflösung X\t");
				wrt.write("Auflösung Y\t");
				wrt.write("Pixel X\t");
				wrt.write("Pixel Y\t");				
				wrt.write("URL für Submaster\t");
				wrt.write("URL für Derivat r\t");
				wrt.write("UUID für Submaster (LZA)\t");
				wrt.write("IMDAS-Importdatum (LZA)\n");		
								
				/* Das SQL-Statement zur Auswertung der Datenbank wird erzeugt */
				PreparedStatement pstmt = connection.prepareStatement(
					"SELECT f.uuid AS uuid, "
					+ "o.merkmal AS merkmal, o.invnr AS invnr, o.kennung AS kennung, "
					+ "o.aufnahmeort AS ort, o.fotograf AS fotograf, o.atelier AS atelier, "
					+ "o.rechte AS rechte, o.aufnahmedatum AS aufnahmedatum, o.notiz AS notiz, "
					+ "o.aufloesungx AS aufloesungx, o.aufloesungy AS aufloesungy, "
					+ "o.pixelx AS pixelx, o.pixely AS pixely, d.pfad AS pfad "
					+ "FROM supplier s, aggregation a, file f, objektbild o, derivat d "
					+ "WHERE s.id = a.supplier AND a.id = f.aggregation AND o.version = 's' "
					+ "AND d.file = f.id AND o.file = f.id AND s.kuerzel = ? "
					+ "AND a.kuerzel = ? AND f.lieferdatum >= ? AND f.lieferdatum <= ?");
				pstmt.setString(1,  getParameter("supplier"));
				pstmt.setString(2, ticket.getString("aggregation"));
				pstmt.setDate(3, toSQLDate(ticket.getString("anfangsdatum")));
				pstmt.setDate(4, toSQLDate(ticket.getString("enddatum")));
				ResultSet rs = pstmt.executeQuery();
				int i = 1;
				/* Die Ergebnisse werden ausgewertet und in den Servlet-OutputWriter geschrieben */
				while (rs.next()) {	
					if (Integer.parseInt(ticket.getString("von")) <= i && i <= Integer.parseInt(ticket.getString("bis"))) {				
						wrt.write("Y:" + rs.getString("pfad").trim().replace('/', '\\') +"\t");
						wrt.write(rs.getString("merkmal").trim()+"\t");
						wrt.write(rs.getString("invnr").trim()+"\t");
						wrt.write(rs.getString("kennung").trim()+"\t");
						wrt.write(rs.getString("ort").trim() +"\t");
						wrt.write(rs.getString("fotograf").trim() +"\t");
						wrt.write(rs.getString("atelier").trim() +"\t");
						wrt.write(rs.getString("rechte").trim() +"\t");						
						wrt.write(prepareAufnahmedatum(rs.getString("aufnahmedatum").trim())+"\t");
						wrt.write(rs.getString("notiz").trim()+"\t");
						wrt.write(rs.getString("aufloesungx").trim()+"\t");
						wrt.write(rs.getString("aufloesungy").trim()+"\t");
						wrt.write(rs.getString("pixelx").trim()+"\t");
						wrt.write(rs.getString("pixely").trim()+"\t");
						wrt.write("https://swbdepot.bsz-bw.de/image?type=s&id="+rs.getString("uuid").trim()+"\t");
						wrt.write("https://swbdepot.bsz-bw.de/image?type=r&id="+rs.getString("uuid").trim()+"\t");
						wrt.write(rs.getString("uuid").trim()+"\t");			
						wrt.write("\n");	
					}
					i++;					
				}			
				wrt.flush();
				wrt.close();
			} catch (SQLException e) {
				System.out.println("SQL-Fehler: " + e);
			} 
		} catch (Exception e) {
			System.out.println("Fehler: " + e.getMessage());
		}
	}

	private Date toSQLDate(String datumAsString) throws ParseException {
		return new java.sql.Date(formatter.parse(datumAsString).getTime());
	}

	private String prepareAufnahmedatum(String src) {
		Matcher matcher = aufnahmedatum.matcher(src);
		return matcher.matches() ? matcher.group(3) + "." + matcher.group(2) + "." + matcher.group(1) : src;		
	}
}

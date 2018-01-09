package bsz.swbtrafo.pipes.lzaladefiles;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.sql.DataSource;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoTicket;
import bsz.swbtrafo.pipes.DownloadPipe;

public class CreateBildladeFilePipe extends DownloadPipe {
	
	private final DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	
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
				wrt.write("Objektbezeichnung\t");	
				wrt.write("Medientyp\t");
				wrt.write("Eing.Nr.\t");
				wrt.write("Sammlung\t");
				wrt.write("Status\t");
				wrt.write("Inv.Nr.\t");
				wrt.write("Dateinamen\n");	
								
				/* Das SQL-Statement zur Auswertung der Datenbank wird erzeugt */
				PreparedStatement pstmt = connection.prepareStatement(
					"SELECT f.name AS objektbezeichnung, "
					+ "o.invnr AS invnr, "
					+ "d.pfad AS pfad "
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
						wrt.write(rs.getString("objektbezeichnung") +"\t");
						wrt.write("LZA\t");
						wrt.write("\t");
						wrt.write(ticket.getString("aggregation") + "\t");
						wrt.write("Mat. zum Objekt\t");
						wrt.write(rs.getString("invnr") +"\t");
						wrt.write("Y:" + rs.getString("pfad").trim().replace('/', '\\'));
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

	
}

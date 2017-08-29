package bsz.swbtrafo.pipes.bildimport;

import java.util.ArrayList;
import java.util.List;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoPipeline;
import bsz.swbtrafo.TrafoTicket;
import nu.xom.Builder;
import nu.xom.Document;

public class FindExpoRecordPipeSolr extends TrafoPipe {
	
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {		
		try {
			
			final SolrServer solrServer = new HttpSolrServer(getParameter("solrCore"));
			Builder parser = new Builder();
			
			try {
				final SolrQuery solrQuery = new SolrQuery();		
				solrQuery.setQuery("invnr_reduziert:" + ticket.getString("invnr").toLowerCase());
				solrQuery.setRows(1);
				solrQuery.setStart(0);
							
				final QueryResponse res = solrServer.query(solrQuery);
				final SolrDocumentList solrDocumentList = res.getResults();
				if (! solrDocumentList.isEmpty()) {
					final SolrDocument solrDoc = solrDocumentList.get(0);
					String payload = (String) solrDoc.getFieldValue("payload");
					Document doc = parser.build(payload, null);
					ticket.put("id", (String) solrDoc.getFieldValue("id"));
			        ticket.put("invnr", doc.query("//inventarnummer").get(0).getValue()); 
			        ticket.put("sammlung", doc.query("//kollektion/sammlung").get(0).getValue());
			        super.process(ticket);
				} else {
					getTrafoPipeline().addMessage("Der Datensatz zu " + ticket.getString("invnr") + " konnte nicht identifiziert werden.");
				}
			} catch (SolrServerException e) {
				getTrafoPipeline().addMessage("Der Datensatz zu " + ticket.getString("invnr") + " konnte nicht identifiziert werden.");
			} 
			
			
		} catch (Exception e) {
			throw new TrafoException(e);
		} 		
	}
	
	public static void main(String... args) throws TrafoException {
		
		List<String> invs = new ArrayList<>();
		invs.add("PKI12-680");
		invs.add("PKI237-191");
		invs.add("PKI325-94-1");
		invs.add("PKI325-94-2");
		invs.add("PKI325-94-3");
		invs.add("PKI471-69");
		invs.add("PKI665-52-1");
		invs.add("PKI665-52-2");
		invs.add("PKI665-52-3");
		invs.add("PKI665-52-4");
		invs.add("X1455");
		invs.add("X1457");
		invs.add("X1474");
		invs.add("X1478a");
		invs.add("X1478b");
		invs.add("X1478c");
		invs.add("X1478d");
		invs.add("X1478e");
		invs.add("X1478f");
		invs.add("X1478");
		invs.add("X1479a");
		invs.add("X1479b");
		invs.add("X1479c");
		invs.add("X1479d");
		invs.add("X1479e");
		invs.add("X1479f");
		invs.add("X1479");
		invs.add("X1480");
		invs.add("X1482");
		invs.add("X1483");
		invs.add("PKI441-7");
		invs.add("X1481a");
		invs.add("X1481b");
		invs.add("X1481c");
		invs.add("X1481d");
		invs.add("X1481e");
		invs.add("X1481f");
		invs.add("X1481g");
		invs.add("X1481h");
		invs.add("X1481i");
		invs.add("X1481j");
		invs.add("X1481");
		invs.add("X1481k");
		invs.add("X1481l");
		invs.add("X1481m");
		invs.add("X1481n");
		invs.add("X1481o");
		invs.add("X1481p");
		invs.add("X1481q");
		invs.add("PKI683-47");
		invs.add("X1458a");
		invs.add("X1458b");
		invs.add("X1458c");
		invs.add("X1458d");
		invs.add("X1458");
		invs.add("1936-154");
		invs.add("1936-155");
		invs.add("1947-100");
		invs.add("1947-1091");
		invs.add("1947-111");
		invs.add("1947-112");
		invs.add("1947-113");
		invs.add("1947-114");
		invs.add("1947-115");
		invs.add("1947-116");
		invs.add("1947-117");
		invs.add("1947-118");
		invs.add("1947-119");
		invs.add("1947-120");
		invs.add("1947-121");
		invs.add("1947-123");
		invs.add("1947-124");
		invs.add("1947-125");
		invs.add("1947-126");
		invs.add("1947-127");
		invs.add("1947-128");
		invs.add("1947-129");
		invs.add("1947-130");
		invs.add("1947-131");
		invs.add("1947-132");
		invs.add("1947-133");
		invs.add("1947-134");
		invs.add("1947-135");
		invs.add("1947-136");
		invs.add("1947-137");
		invs.add("1947-138");
		invs.add("1947-139");
		invs.add("1947-140");
		invs.add("1947-141");
		invs.add("1947-142");
		invs.add("1947-143");
		invs.add("1947-144");
		invs.add("1947-145");
		invs.add("1947-146");
		invs.add("1947-147");
		invs.add("1947-148");
		invs.add("1947-149");
		invs.add("1947-150");
		invs.add("1947-151");
		invs.add("1947-152");
		invs.add("1947-153");
		invs.add("1947-154");
		invs.add("1947-155");
		invs.add("1947-156");
		invs.add("1947-158");
		invs.add("1947-159");
		invs.add("1947-160");
		invs.add("1947-161");
		invs.add("1947-162");
		invs.add("1947-163");
		invs.add("1947-164");
		invs.add("1947-165");
		invs.add("1947-166");
		invs.add("1947-167");
		invs.add("1947-168");
		invs.add("1947-170");
		invs.add("1947-171");
		invs.add("1947-172");
		invs.add("1947-173");
		invs.add("1947-174");
		invs.add("1947-175");
		invs.add("1947-176");
		invs.add("1947-177");
		invs.add("1947-178");
		invs.add("1947-179");
		invs.add("1947-180");
		invs.add("1947-181");
		invs.add("1947-182");
		invs.add("1947-183");
		invs.add("1947-184");
		invs.add("1947-186");
		invs.add("1947-187");
		invs.add("1947-188");
		invs.add("1947-189");
		invs.add("1947-190");
		invs.add("1947-191");
		invs.add("1947-192");
		invs.add("1947-194");
		invs.add("1947-195");
		invs.add("1947-196");
		invs.add("1947-197");
		invs.add("1947-198");
		invs.add("1947-199");
		invs.add("1947-200");
		invs.add("1947-201");
		invs.add("1947-202");
		invs.add("1947-204");
		invs.add("1947-205");
		invs.add("1947-206");
		invs.add("1947-207");
		invs.add("1947-209");
		invs.add("1947-97");
		invs.add("1947-98");
		invs.add("1947-99");
		invs.add("1951-300");
		invs.add("1963-57");
		invs.add("II890-10");
		invs.add("II890-18");
		invs.add("II890-1");
		invs.add("II890-2");
		invs.add("II890-3");
		invs.add("II890-4");
		invs.add("II890-5");
		invs.add("II890-6");
		invs.add("II890-7");
		invs.add("II890-8");
		invs.add("II890-9");
		invs.add("X1469");
		invs.add("PKI230-32");
		invs.add("PKI685-51");
		invs.add("X1461");
		invs.add("X1462");
		invs.add("II3139");
		invs.add("X1463a");
		invs.add("X1463b");
		invs.add("X1463c");
		invs.add("X1463d");
		invs.add("X1463");
		invs.add("PKI256-41");
		invs.add("PKI698-117");
		invs.add("X1456");
		invs.add("X1460a");
		invs.add("X1460b");
		invs.add("X1460c");
		invs.add("X1460d");
		invs.add("X1460e");
		invs.add("X1460f");
		invs.add("X1460g");
		invs.add("X1460h");
		invs.add("X1460i");
		invs.add("X1460j");
		invs.add("X1460");
		invs.add("PKI7-151");
		invs.add("X1466");
		invs.add("X1467");
		invs.add("X1468");
		invs.add("VII223");
		invs.add("X1465");
		invs.add("X1454");
		invs.add("X1464");
		invs.add("PKI696-33");
		invs.add("PKI9-483");
		invs.add("X1470");
		invs.add("PKI229-3");
		invs.add("X1453");
		invs.add("X1472");
		invs.add("X1473");
		invs.add("PKI573-15");
		invs.add("X1471");
		invs.add("X1475");
		invs.add("X1476");
		invs.add("X1477");
		invs.add("VII221a");
		invs.add("X1459");

		
		for (String inv : invs) {
		
			FindExpoRecordPipeSolr ferps = new FindExpoRecordPipeSolr();
			TrafoPipeline tp = new TrafoPipeline();
			ferps.setTrafoPipeline(tp);
			TrafoTicket ticket = new TrafoTicket();
			ticket.put("invnr", inv);
			ferps.process(ticket);	
//			if (ticket.getString("sammlung") != null) {
//				System.out.println(inv + ": " + ticket.getString("sammlung"));
//			}
			for (String msg : tp.getMessages()) {
				System.out.println(msg);
			}
		}
		
	}
	
	
		
	
	
}

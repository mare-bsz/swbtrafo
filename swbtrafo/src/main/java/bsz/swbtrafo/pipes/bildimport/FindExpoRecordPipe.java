package bsz.swbtrafo.pipes.bildimport;

import java.net.URLEncoder;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoTicket;

public class FindExpoRecordPipe extends TrafoPipe {
	
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {		
		try {
			final String url = getParameter("basex") + "check?cll=" + getParameter("collection") + "&inv=" + URLEncoder.encode(ticket.getString("invnr"), "UTF-8");
			JSONParser parser = new JSONParser();
			final CloseableHttpClient httpclient = HttpClients.createDefault();	
			final HttpGet httpget = new HttpGet(url);
			final CloseableHttpResponse response = httpclient.execute(httpget);
			try {
				final HttpEntity entity = response.getEntity();
			    if (entity != null) {
			        String result = EntityUtils.toString(entity);	
			        Object obj = parser.parse(result);
			        JSONObject jsonObject = (JSONObject) obj;
			        JSONArray data = (JSONArray) jsonObject.get("data");
			        if (! data.isEmpty()) {
				        JSONObject record = (JSONObject) data.get(0);			        
				        ticket.put("id", record.get("id"));
				        ticket.put("invnr", record.get("inventarnummer")); 
				        ticket.put("sammlung", record.get("sammlung"));
				        super.process(ticket);
			        } else {
			        	getTrafoPipeline().addMessage(ticket.getString("invnr"), "Der Datensatz zu " + ticket.getString("invnr") + " konnte nicht identifiziert werden.");
			        }
			    } 
			} finally {
				response.close();
			}	
			httpclient.close();
		} catch (Exception e) {
			throw new TrafoException(e);
		} 		
	}
}

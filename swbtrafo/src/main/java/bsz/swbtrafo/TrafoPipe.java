package bsz.swbtrafo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Die abstrakte Klasse TrafoPipe bildet den Rahmen für die zentralen Funktionalität einer Pipeline.
 * <p>
 * TrafoPipes müssen in Unterklassen implementiert werden, die dann die eigentlichen Funktionalität
 * in den ggf. überschriebenen Methoden process(TrafoTicket) realisieren. Dazu kann ggf. die Methode
 * init überschrieben werden, um die TrafoPipe zu initialisieren, sowie ggf. die Methode tidy, 
 * um Ressourcen, wie z.B. geöffnete Dateien oder Datenbankverbindungen wieder zu schließen.  
 * <p>
 * TrafoPipes werden bei der Konfiguration zu einer {@link TrafoPipeline} verkettet. Die vorliegenden Implementierungen
 * von init, process und destroy propagieren den Aufruf immer an die nächste Pipe; sie sollten mit super. 
 * auch in den Unterklassen aufgerufen werden, um die Abarbeitung in der gesamten Pipeline zu ermöglichen.
 * <p>
 * TrafoPipes verfügen über eine Parameter-Map, die während der Konstruktion gefüllt wird, sowie über 
 * die Eigenschaft pipeline, die auf die {@link TrafoPipeline} verweist, zu der die TrafoPipe gehört. 
 * Parameter werden zunächst in der TrafoPipe gesucht und dann in der Pipeline.
 * <p>
 * Insbesondere sind auch Pipelines TrafoPipes, so dass sie ebenfalls als Pipes in Pipelines eingebettet 
 * werden können. 
 * 
 * @author Christof Mainberger
 */

public abstract class TrafoPipe {
		
	protected TrafoPipeline trafoPipeline = null;		
	/** @param trafoPipeline setzt die {@link TrafoPipeline}, zu der die Pipe gehört. */
	public void setTrafoPipeline(TrafoPipeline trafoPipeline) { this.trafoPipeline = trafoPipeline; }
	/** @return TrafoPipeline, zu der das Objekt gehört. */
	public TrafoPipeline getTrafoPipeline() { return trafoPipeline; }

	private TrafoPipe next;
	void setNext(final TrafoPipe next) { this.next = next; }
	
	private Map<String, String> parameters = new HashMap<String, String>();
	/** @return gibt die Parameter der Pipe zurueck*/
	public Map<String, String> getParameters() { return parameters; }
	/** @param name der Schlüssel, unter dem eine Parameter registriert wird.
	 * @param value der Wert, unter dem ein Parameter registriert wird. */
	public void addParameter(String name, String value) { parameters.put(name, value); }
	/** Gibt einen Parameter zur Pipe oder, sofort dort nicht vorhanden, ggf. zur Pipeline zurück. 
	 * @param key der Name des gesuchten Parameters
	 * @return der Parameter, falls in der Pipe oder der Pipeline registriert, sonst null */
	protected String getParameter(String key) {
		String result = null;
		result = parameters.get(key);
		if (result == null && trafoPipeline != null) {
			result = trafoPipeline.getParameter(key);
		}
		return result;
	}
	/** @return die Namen aller in der Pipe oder der Pipeline registrierten Parameter */
	protected Set<String> getParameterNames() {
		final Set<String> parameternames = parameters.keySet();
		parameternames.addAll(trafoPipeline.getParameters().keySet());
		return parameternames;
	}
	
	private List<TrafoListener> listeners = new ArrayList<TrafoListener>();
	/** Registriert einen {@link TrafoListener} während der Pipeline-Konstruktion. 
	 * 
	 * @param listener der TrafoListener
	 * */
	void addListener(TrafoListener listener) {
		this.listeners.add(listener); 
	}
	
	/** init initialisiert die TrafoPipe zunächst alle registrierten Listener und dann ggf. die nachfolgende Pipe.
	 * <p>
	 * Führt zunächst {@link TrafoListener#init} auf allen registrierten {@link TrafoListener} aus und dann
	 * ggf. auf der nachfolgenden Pipe.
	 * <p> 
	 * Kann bei Bedarf in Unterklassen überschrieben werden und sollte mit super.init dann dort aufgerufen werden. 
	 * 
	 * @throws TrafoException wenn eine Exception während der Initialisierung auftritt
	 * */	
	public void init() throws TrafoException {
		for (TrafoListener listener : listeners) {
			listener.init(this, trafoPipeline);
		}
		if (next != null) {
			this.next.init();
		}
	}
	
	/** process führt die eigentliche Aufgabe der Pipe aus.
	 * <p>
	 * Führt zunächst {@link TrafoListener#process} für alle registrierten {@link TrafoListener} mit dem 
	 * übergebenen {@link TrafoTicket} aus und dann process der nächsten Pipe. Sollte
	 * in Unterklassen überschrieben werden und sollte mit super.process ausgeführt werden. 
	 * 
	 * @param ticket das TrafoTiket, das gerade bearbeitet wird. 	  
	 * @throws TrafoException wenn eine Exception während der Ausführung auftritt
	 * */
	public void process(TrafoTicket ticket)  throws TrafoException {
		for (TrafoListener listener : listeners) {
			listener.process(ticket);
		}
		if (next != null) {
			this.next.process(ticket);
		}
	}
	
	/** finit schliesst alle Ressourcen.
	 * <p>
	 * führt zunächst {@link TrafoListener#tidy} auf allen registrierten {@link TrafoListener}-Objekten aus 
	 * und dann tidy der nächsten Pipe. Sollte bei Bedarf in Unterklassen überschrieben und mit super.tidy 
	 * dort ausgeführt werden. 
	 * 
	 * @throws TrafoException wenn eine Exception während des Aufräumens auftritt
	 * */
	public void finit() throws TrafoException {
		for (TrafoListener listener : listeners) {
			listener.finit();
		}
		if (next != null) {
			this.next.finit();
		}
	}	
}
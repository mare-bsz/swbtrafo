package bsz.swbtrafo.servlet;

import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import bsz.swbtrafo.TrafoResult;

public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent event) {		
		
	}

	@Override @SuppressWarnings("unchecked")
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		for (TrafoResult result : (List<TrafoResult>) session.getAttribute("results")) {
			try {
				Files.deleteIfExists(result.getPath());
			} catch (IOException e) {
				System.out.println("Exception beim Löschen von " + result.getPath() + ": " + e);
			}
		}
		
	}
}

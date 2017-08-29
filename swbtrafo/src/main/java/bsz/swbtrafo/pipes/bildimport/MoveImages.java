package bsz.swbtrafo.pipes.bildimport;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoTicket;

public class MoveImages extends TrafoPipe {
	
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {
		try {
			final Path image = ticket.getPath();
			final String kuenstler = ticket.getString("kuenstler");
			final Path target = Paths.get(getParameter("targetDir"),kuenstler.substring(0,1),image.getFileName().toString());
			Files.move(image, target, StandardCopyOption.REPLACE_EXISTING);	
			ticket.setPath(target);
			super.process(ticket);
		} catch (IOException e) {
			throw new TrafoException(e);
		}
	}
	
}

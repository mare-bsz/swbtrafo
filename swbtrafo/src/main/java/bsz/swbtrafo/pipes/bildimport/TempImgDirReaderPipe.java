package bsz.swbtrafo.pipes.bildimport;

import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.commons.io.FilenameUtils;

import bsz.swbtrafo.TrafoException;
import bsz.swbtrafo.TrafoPipe;
import bsz.swbtrafo.TrafoTicket;

public class TempImgDirReaderPipe extends TrafoPipe {
	
	@Override
	public void process(TrafoTicket ticket) throws TrafoException {	
		
		final Path tempImgDir = Paths.get(getParameter("tempImgDir"));
		
		try (DirectoryStream<Path> directoryStream = Files.newDirectoryStream(tempImgDir, new DirectoryStream.Filter<Path>() {
			@Override
			public boolean accept(Path entry) throws IOException {				
				return "jpg|JPG|tif|TIF".contains(FilenameUtils.getExtension(entry.getFileName().toString()));
			}
		})) {
            for (Path path : directoryStream) {
                TrafoTicket imgTicket = new TrafoTicket(ticket);
                imgTicket.setPath(path);
                super.process(imgTicket);
            }
        } catch (IOException ex) {}		
	}
}

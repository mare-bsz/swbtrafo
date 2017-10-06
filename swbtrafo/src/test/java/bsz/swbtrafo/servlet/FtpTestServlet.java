package bsz.swbtrafo.servlet;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

@WebServlet("/ftptest")
public class FtpTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Writer out = resp.getWriter();
		
		JSch jsch = new JSch();
        Session session = null;
        try {
            session = jsch.getSession("imdastest", "bszftp", 22);
            session.setConfig("StrictHostKeyChecking", "no");
            session.setPassword("7h7Mo!q");
            session.connect();

            Channel channel = session.openChannel("sftp");
            channel.connect();
            ChannelSftp sftpChannel = (ChannelSftp) channel;
            out.write("OK");
//            sftpChannel.get("remotefile.txt", "localfile.txt");
            sftpChannel.exit();
            session.disconnect();
        } catch (JSchException e) {
        	out.write(e.getMessage());
            e.printStackTrace();  
//        } catch (SftpException e) {
//            e.printStackTrace();
        }	
	}
}

package commodity;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MessageDao;

/**
 * Servlet implementation class AddMessageServlet
 */
@WebServlet("/AddMessageServlet")
public class AddMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sender = request.getParameter("sender");
		String accepter = request.getParameter("accepter");
		String recordId = request.getParameter("recordId");
		String type = request.getParameter("type");
		String content = request.getParameter("content");
		String if_private = request.getParameter("if_private");
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String nowString = dateFormat.format( now ); 
		MessageDao messageDao = new MessageDao();
		boolean flag = messageDao.addMessage(Integer.parseInt(sender),Integer.parseInt(recordId),Integer.parseInt(type),Integer.parseInt(accepter),content,nowString,Integer.parseInt(if_private));
		if(type.equals("0")) type="buy";
		else type="sell";
		if(flag) request.getRequestDispatcher("ShowBookServlet?type="+type+"&id="+recordId).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

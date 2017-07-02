package servlet.collection;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CollectionDao;

/**
 * Servlet implementation class ChangeCollectStateServlet
 */
@WebServlet("/ChangeCollectStateServlet")
public class ChangeCollectStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeCollectStateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/xml;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String bookId = request.getParameter("bookId");
		String userId = request.getParameter("userId");
		String type = request.getParameter("type");
		String collectState = request.getParameter("collectState");
		collectState = new String(collectState.getBytes("iso-8859-1"),"UTF-8");
		CollectionDao collectionDao = new CollectionDao();
		out.println("<response>");
		if(collectState.equals("收藏")){
			collectionDao.addCollection(Integer.parseInt(userId),Integer.parseInt(bookId),Integer.parseInt(type));
			out.print("<message>取消收藏</message>");
		}else if(collectState.equals("取消收藏")){
			collectionDao.deleteCollection(Integer.parseInt(userId),Integer.parseInt(bookId),Integer.parseInt(type));
			out.print("<message>收藏</message>");
		}
		out.println("</response>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

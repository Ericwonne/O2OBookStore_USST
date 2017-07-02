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
 * Servlet implementation class CheckCollectStateServlet
 */
@WebServlet("/CheckCollectStateServlet")
public class CheckCollectStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckCollectStateServlet() {
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
		CollectionDao collectionDao = new CollectionDao();
		boolean flag = collectionDao.checkCollectStateServlet(Integer.parseInt(userId),Integer.parseInt(bookId),Integer.parseInt(type));
		out.println("<response>");
		if(flag){
			out.println("<message>取消收藏</message>");
		}else{
			out.println("<message>收藏</message>");
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

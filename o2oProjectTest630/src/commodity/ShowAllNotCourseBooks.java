package commodity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyBook;
import model.BuyBookDao;
import model.SellBook;
import model.SellBookDao;
import model.Value;

/**
 * Servlet implementation class ShowAllNotCourseBooks
 */
@WebServlet("/ShowAllNotCourseBooks")
public class ShowAllNotCourseBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowAllNotCourseBooks() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		type = new String(type.getBytes("iso-8859-1"), "UTF-8");
		// 定义四个分页会用到的变量
		int pageSize = Value.pageSize;
		int pageNow = 1;// 默认显示第一页
		int rowCount = 0;// 该值从数据库中查询
		int pageCount = 0;// 该值是通过pageSize和rowCount
		// 接受用户希望显示的页数（pageNow）
		String s_pageNow = request.getParameter("pageNow");
		if (s_pageNow != null) {
			// 接收到了pageNow
			pageNow = Integer.parseInt(s_pageNow);
		}
		if (type.equals("买书记录")) {
			BuyBookDao buyBookDao = new BuyBookDao();
			rowCount = buyBookDao.calNotCourseBuyBooks();
			if(rowCount % pageSize == 0){
				pageCount = rowCount/pageSize;
			}else{
				pageCount = rowCount/pageSize+1;
			}
			ArrayList<BuyBook> buyBooks = buyBookDao.getNotCourseBuyBook(pageNow,pageSize);
			request.setAttribute("buyBooks", buyBooks);
			request.setAttribute("pageCount", pageCount);
			request.getRequestDispatcher("commodity/showAllNotCourseBuyBooks.jsp").forward(request, response);;
		} else if (type.equals("卖书记录")) {
			SellBookDao sellBookDao = new SellBookDao();
			rowCount = sellBookDao.calNotCourseBuyBooks();
			if(rowCount % pageSize ==0){
				pageCount = rowCount/pageSize;
			}else{
				pageCount = rowCount/pageSize+1;
			}
			ArrayList<SellBook> sellBooks = sellBookDao.getNotCourseSellBook(pageNow,pageSize);
			request.setAttribute("sellBooks", sellBooks);
			request.setAttribute("pageCount", pageCount);
			request.getRequestDispatcher("commodity/showAllNotCourseSellBooks.jsp").forward(request, response);;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

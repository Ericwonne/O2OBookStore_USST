package servlet.search;

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

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 定义四个分页会用到的变量
		int pageSize = 3;
		int pageNow = 1;// 默认显示第一页
		int rowCount = 0;// 该值从数据库中查询
		int pageCount = 0;// 该值是通过pageSize和rowCount
		// 接受用户希望显示的页数（pageNow）
		String s_pageNow = request.getParameter("pageNow");
		if (s_pageNow != null) {
			// 接收到了pageNow
			pageNow = Integer.parseInt(s_pageNow);
		}
		String searchType = request.getParameter("searchType");
		String searchContent = request.getParameter("searchContent");
		searchContent = new String(searchContent.getBytes("iso-8859-1"), "UTF-8");
		String bookType = request.getParameter("bookType");
		request.setAttribute("searchType", searchType);
		request.setAttribute("searchContent", searchContent);
		request.setAttribute("bookType",bookType);
		if (bookType.equals("buy")) {
			BuyBookDao buyBookDao = new BuyBookDao();
			rowCount = buyBookDao.calRowCount(searchType, searchContent);
			//计算页数
			if(rowCount%pageSize==0)
				pageCount = rowCount/pageSize;	
			else pageCount = rowCount/pageSize+1;
			request.setAttribute("pageCount", pageCount);
			ArrayList<BuyBook> books = buyBookDao.findBooks(searchType, searchContent,pageNow,pageSize);
			request.setAttribute("books", books);
			request.getRequestDispatcher("search/buyBookSearchResult.jsp").forward(request, response);
		} else if (bookType.equals("sale")) {
			SellBookDao sellBookDao = new SellBookDao();
			rowCount = sellBookDao.calRowCount(searchType, searchContent);
			//计算页数
			if(rowCount%pageSize==0)
				pageCount = rowCount/pageSize;	
			else pageCount = rowCount/pageSize+1;
			request.setAttribute("pageCount", pageCount);
			ArrayList<SellBook> books = sellBookDao.findBooks(searchType, searchContent,pageNow,pageSize);
			request.setAttribute("books", books);
			request.getRequestDispatcher("search/sellBookSearchResult.jsp").forward(request, response);
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

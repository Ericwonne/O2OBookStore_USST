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
		response.setContentType("text/html;charset=UTF-8");
		// 瀹氫箟鍥涗釜鍒嗛〉浼氱敤鍒扮殑鍙橀噺
		int pageSize = 3;
		int pageNow = 1;// 榛樿鏄剧ず绗竴椤�
		int rowCount = 0;// 璇ュ�间粠鏁版嵁搴撲腑鏌ヨ
		int pageCount = 0;// 璇ュ�兼槸閫氳繃pageSize鍜宺owCount
		// 鎺ュ彈鐢ㄦ埛甯屾湜鏄剧ず鐨勯〉鏁帮紙pageNow锛�
		String s_pageNow = request.getParameter("pageNow");
		if (s_pageNow != null) {
			// 鎺ユ敹鍒颁簡pageNow
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
			System.out.println("rowcount"+rowCount);
			//璁＄畻椤垫暟
			if(rowCount%pageSize==0)
				pageCount = rowCount/pageSize;	
			else pageCount = rowCount/pageSize+1;
			request.setAttribute("pageCount", pageCount);
			ArrayList<BuyBook> books = buyBookDao.findBooks(searchType, searchContent,pageNow,pageSize);
			System.out.println("lenbooks"+books.size());
			request.setAttribute("books", books);
			request.getRequestDispatcher("search/buyBookSearchResult.jsp").forward(request, response);
		} else if (bookType.equals("sale")) {
			SellBookDao sellBookDao = new SellBookDao();
			rowCount = sellBookDao.calRowCount(searchType, searchContent);
			//璁＄畻椤垫暟
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

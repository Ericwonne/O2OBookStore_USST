package commodity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyBook;
import model.BuyBookDao;
import model.SellBook;
import model.SellBookDao;
import model.User;

/**
 * Servlet implementation class MainPageRecommendServlet
 */
@WebServlet("/MainPageRecommendServlet")
public class MainPageRecommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageRecommendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		SellBookDao sellBookDao = new SellBookDao();
		BuyBookDao buyBookDao = new BuyBookDao();
		ArrayList<BuyBook> relatedBuyBooks = new ArrayList<>();
		ArrayList<SellBook> relatedSellBooks = new ArrayList<>();
		ArrayList<BuyBook> hotBuyBooks = new ArrayList<>();
		ArrayList<SellBook> hotSellBooks = new ArrayList<>();
		relatedBuyBooks = buyBookDao.recommendRelatedBuyBooks(Integer.parseInt(user.getGrade()),user.getSchool(),user.getMajor());
		relatedSellBooks = sellBookDao.recommendRelatedSellBooks(Integer.parseInt(user.getGrade()),user.getSchool(),user.getMajor());
		hotBuyBooks = buyBookDao.recommendHotBuyBook(Integer.parseInt(user.getGrade()),user.getSchool(),user.getMajor());
		hotSellBooks = sellBookDao.recommendHotSellsBook(Integer.parseInt(user.getGrade()),user.getSchool(),user.getMajor());
		request.setAttribute("relatedBuyBooks", relatedBuyBooks);
		request.setAttribute("relatedSellBooks", relatedSellBooks);
		request.setAttribute("hotBuyBooks", hotBuyBooks);
		request.setAttribute("hotSellBooks", hotSellBooks);
		request.getRequestDispatcher("mainPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

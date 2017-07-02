package servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyBook;
import model.BuyBookDao;
import model.SellBook;
import model.SellBookDao;
import model.User;
import model.UserDao;

/**
 * Servlet implementation class ShowUserInfoServlet
 */
@WebServlet("/ShowUserInfoServlet")
public class ShowUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowUserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String st_num = request.getParameter("st_num");
		String type = request.getParameter("type");
		String bookId = request.getParameter("bookId");
		UserDao userDao = new UserDao();
		if(type.equals("0")){
			BuyBookDao bookDao = new BuyBookDao();
			BuyBook book = bookDao.getBuyBookById(Integer.parseInt(bookId));
			request.setAttribute("book", book);
		}else{
			SellBookDao bookDao = new SellBookDao();
			SellBook book = bookDao.getSellBookById(Integer.parseInt(bookId));
			request.setAttribute("book", book);
		}
		User user = userDao.getUserByStNum(st_num);
		request.setAttribute("user", user);
		request.getRequestDispatcher("user/showUserInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

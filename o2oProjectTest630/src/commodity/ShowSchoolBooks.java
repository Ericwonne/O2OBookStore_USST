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
 * Servlet implementation class ShowSchoolBooks
 */
@WebServlet("/ShowSchoolBooks")
public class ShowSchoolBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowSchoolBooks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String school = request.getParameter("school");
		school = new String(school.getBytes("iso-8859-1"),"UTF-8");
		if(!school.equals("非教材类书籍")){
			BuyBookDao buyBookDao = new BuyBookDao();
			ArrayList<BuyBook> buyBook1s = buyBookDao.getBuyBookBySchoolAndGrade(school,2016,1,Value.schoolClassBooksNum);
			ArrayList<BuyBook> buyBook2s = buyBookDao.getBuyBookBySchoolAndGrade(school,2015,1,Value.schoolClassBooksNum);
			ArrayList<BuyBook> buyBook3s = buyBookDao.getBuyBookBySchoolAndGrade(school,2014,1,Value.schoolClassBooksNum);
			SellBookDao sellBookDao = new SellBookDao();
			ArrayList<SellBook> sellBook1s = sellBookDao.getSellBookBySchoolAndGrade(school,2016,1,Value.schoolClassBooksNum);
			ArrayList<SellBook> sellBook2s = sellBookDao.getSellBookBySchoolAndGrade(school,2015,1,Value.schoolClassBooksNum);
			ArrayList<SellBook> sellBook3s = sellBookDao.getSellBookBySchoolAndGrade(school,2014,1,Value.schoolClassBooksNum);
			request.setAttribute("buyBook1s", buyBook1s);
			request.setAttribute("buyBook2s", buyBook2s);
			request.setAttribute("buyBook3s", buyBook3s);
			request.setAttribute("sellBook1s", sellBook1s);
			request.setAttribute("sellBook2s", sellBook2s);
			request.setAttribute("sellBook3s", sellBook3s);
			request.setAttribute("school", school);
			request.getRequestDispatcher("commodity/showBooksBySchool.jsp").forward(request, response);
		}else{
			BuyBookDao buyBookDao = new BuyBookDao();
			ArrayList<BuyBook> notCourseBuyBooks = buyBookDao.getNotCourseBuyBook(1,Value.notCouresBooksNum);
			SellBookDao sellBookDao = new SellBookDao();
			ArrayList<SellBook> notCourseSellBooks = sellBookDao.getNotCourseSellBook(1,Value.notCouresBooksNum);
			request.setAttribute("notCourseBuyBooks", notCourseBuyBooks);
			request.setAttribute("notCourseSellBooks", notCourseSellBooks);
			request.getRequestDispatcher("commodity/showNotCourseBooks.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

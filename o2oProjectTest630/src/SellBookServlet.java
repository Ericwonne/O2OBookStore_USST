

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDao;
import model.BuyBook;
import model.SellBook;

/**
 * Servlet implementation class SellBookServlet
 */
@WebServlet("/SellBookServlet")
public class SellBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String message;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	
		
		//String user_id1=(String) request.getSession().getAttribute("user_id");
		
		//int user_id=Integer.parseInt(user_id1);
		
		int user_id=7;
		
		String bookname=request.getParameter("bookname");
		String isbn=request.getParameter("isbn");
		String author=request.getParameter("author");
		String version1=request.getParameter("version");
		int version=Integer.parseInt(version1);
		
		String publish=request.getParameter("publish");
		String tag=request.getParameter("tag");
		String discount1=request.getParameter("discount");
		
		float discount=Float.valueOf(discount1);
		
		
		String if1=request.getParameter("if");
		
		int if0=Integer.parseInt(if1);
		
		String grade=request.getParameter("grade");
		String course_name=request.getParameter("course_name");
		
		String age1=request.getParameter("age");
		float age=Float.valueOf(age1);
		String major=request.getParameter("major");
		String school=request.getParameter("school");
		String describe=request.getParameter("describe");
		String pircture=request.getParameter("filename");
		String price1=request.getParameter("price");
		int price=Integer.parseInt(price1);
		
		SellBook sellbook=new SellBook();
		sellbook.setName(bookname);
		sellbook.setIsbn(isbn);
		sellbook.setAuthor(author);
		sellbook.setVersion(version);
		sellbook.setPublish(publish);
		sellbook.setTag(tag);
		sellbook.setDiscount(discount);
	
		sellbook.setIf_course(if0);
		sellbook.setGrade(grade);
		sellbook.setCourse_name(course_name);
		sellbook.setMajor(major);
		sellbook.setSchool(school);
		sellbook.setDescribe(describe);
		sellbook.setGlances(0);
		sellbook.setStatus(1);
		sellbook.setAge(age);
		sellbook.setUser_id(user_id);
		sellbook.setPrice(price);
		
		BookDao bookdao=new BookDao();
        boolean success=bookdao.SellBook(sellbook);
        if(success)
		{
			message="发布成功";
			request.setAttribute("message", message);
			request.getRequestDispatcher("main.jsp").forward(request, response);
		}
		else 
		{ message="发布失败";
		 request.setAttribute("message", message);
		    request.getRequestDispatcher("main.jsp").forward(request, response);
		}
			
		
	}

}

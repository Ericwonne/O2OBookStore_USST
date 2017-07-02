

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDao;
import model.BuyBook;



/**
 * Servlet implementation class BuyBookServlet
 */
@WebServlet("/BuyBookServlet")
public class BuyBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyBookServlet() {
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
		String expect_discount1=request.getParameter("expect_discount");
		
		float expect_discount=Float.valueOf(expect_discount1);
		
		String if1=request.getParameter("if");
		
		int if0=Integer.parseInt(if1);
		
		String grade=request.getParameter("grade");
		String course_name=request.getParameter("course_name");
		
		String expect_age1=request.getParameter("expect_age");
		float expect_age=Float.valueOf(expect_age1);
		String major=request.getParameter("major");
		String school=request.getParameter("school");
		String describe=request.getParameter("describe");
		
		
		BuyBook buybook =new BuyBook();
		buybook.setName(bookname);
		buybook.setIsbn(isbn);
		buybook.setAuthor(author);
		buybook.setVersion(version);
		buybook.setPublish(publish);
		buybook.setTag(tag);
		buybook.setExpect_discount(expect_discount);
	
		buybook.setIf_course(if0+"");
		buybook.setGrade(grade);
		buybook.setCourse_name(course_name);
		buybook.setMajor(major);
		buybook.setSchool(school);
		buybook.setDescribe(describe);
		buybook.setGlances(0);
		buybook.setStatus(1);
		buybook.setExpect_age(expect_age);
		buybook.setUser_id(user_id);
		
		BookDao bookdao=new BookDao();
        boolean success=bookdao.BuyBook(buybook);
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



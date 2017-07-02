package servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDao;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("userName");
		String password = request.getParameter("password");
		
		String name = request.getParameter("name");
		name = new String(name.getBytes("iso-8859-1"),"UTF-8");
		
		String gender = request.getParameter("gender");
		gender = new String(gender.getBytes("iso-8859-1"),"UTF-8");
		
		String grade = request.getParameter("grade");
		grade = new String(grade.getBytes("iso-8859-1"),"UTF-8");
		
		String department = request.getParameter("department");
		department = new String(department.getBytes("iso-8859-1"),"UTF-8");
		
		String major =request.getParameter("major");
		major = new String(major.getBytes("iso-8859-1"),"UTF-8");
		
		String email = request.getParameter("email");
		
		String valid_ques = request.getParameter("valid_ques");
		valid_ques = new String(valid_ques.getBytes("iso-8859-1"),"UTF-8");
		
		String valid_ans = request.getParameter("valid_ans");
		valid_ans = new String(valid_ans.getBytes("iso-8859-1"),"UTF-8");
		
		String qq = request.getParameter("qq");
		String wechat =request.getParameter("wechat");
		String phone = request.getParameter("phone");
		UserDao userDao = new UserDao();
		
		boolean flag = userDao.addUser(userName,password,name,gender,grade,department,major,email,
				valid_ques,valid_ans,qq,wechat,phone);
		if(flag){
			response.sendRedirect("user/login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}

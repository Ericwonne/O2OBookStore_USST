

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import model.UserChangeDao;

/**
 * Servlet implementation class UserChangeServlet1
 */
@WebServlet("/UserChangeServlet1")
public class UserChangeServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserChangeServlet1() {
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
		
		//String st_num=(String) request.getSession().getAttribute("st_num");
		String st_num="1412120106";
		
		String name=request.getParameter("name");
		String passwd=request.getParameter("passwd");
		String grade=request.getParameter("grade");
		String school=request.getParameter("school");		
		String major=request.getParameter("major");
		String email=request.getParameter("email");
		String qq=request.getParameter("qq");		
		String wechat=request.getParameter("wechat");	
		String phone=request.getParameter("phone");
		String valid_ques=request.getParameter("valid_ques");
		String valid_ans=request.getParameter("valid_ans");
		
		User user=new User();
		user.setName(name);
		user.setPasswd(passwd);
		user.setGrade(grade);
		user.setSchool(school);
		user.setMajor(major);
		user.setEmail(email);
		user.setQq(qq);
		user.setWechat(wechat);
		user.setPhone(phone);
		user.setValid_ques(valid_ques);
		user.setValid_ans(valid_ans);
		
		UserChangeDao userchangedao=new UserChangeDao();
		boolean success=userchangedao.UserChangeDao(st_num,user);
		
		 if(success)
			{
				message="±à¼­³É¹¦";
				request.setAttribute("message", message);
				request.getRequestDispatcher("main.jsp").forward(request, response);
			}
			else 
			{ message="±à¼­Ê§°Ü";
			 request.setAttribute("message", message);
			    request.getRequestDispatcher("main.jsp").forward(request, response);
			}
		
		
		
	}

}

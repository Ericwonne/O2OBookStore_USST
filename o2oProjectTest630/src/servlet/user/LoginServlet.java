package servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import model.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String[] remember = request.getParameterValues("remember");
		if(remember!=null && remember[0].equals("1")){
			Cookie usernameCookie = new Cookie("username",username);
			Cookie passwordCookie = new Cookie("password",password);
			usernameCookie.setMaxAge(60*60*24*3);
			passwordCookie.setMaxAge(60*60*24*3);
			response.addCookie(passwordCookie);
			response.addCookie(usernameCookie);
		}
		UserDao userDao = new UserDao();
		boolean isLogin = userDao.validate(username, password);
		HttpSession session = request.getSession();
		if(isLogin) {
			User user = userDao.getUserByStNum(username);
			session.setAttribute("loginUser", user);
			session.setAttribute("isLogin", true);
			request.getRequestDispatcher("mainPage.jsp").forward(request, response);
		}
		
	}

}

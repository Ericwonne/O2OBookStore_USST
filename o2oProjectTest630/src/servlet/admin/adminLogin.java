package servlet.admin;

import java.io.IOException;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.jasper.tagplugins.jstl.core.Out;



import model.Admin;
import model.AdminDao;

/**
 * Servlet implementation class Welcome
 */
@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String s1=request.getParameter("account").trim();
		String s2=request.getParameter("passwd").trim();
		AdminDao a=new AdminDao();
		if(a.isAccountExisted(s1)){
			if(a.validatePasswd(s1, s2))
			{
				
				request.getSession().setAttribute("account", s1);
		    	request.getSession().setAttribute("passwd", s2);
		    	request.getRequestDispatcher("admin/welcome.jsp").forward(request,response);
			}else{
				PrintWriter out=response.getWriter();
		        out.print("<script language='javascript'>alert('密码错误!');window.location.href='admin/login.jsp';</script>");
			}
			
		}
	    else{
	        PrintWriter out=response.getWriter();
	        out.print("<script language='javascript'>alert('账号不存在!');window.location.href='admin/login.jsp';</script>");
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

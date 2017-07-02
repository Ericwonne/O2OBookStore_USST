package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.User;
import model.UserDao;

/**
 * Servlet implementation class searchUser
 */
@WebServlet("/searchUser")
public class searchUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public searchUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		// 创建响应XML
		String ID = "联系方式不空";
		String grade = request.getParameter("grade");
		String school = request.getParameter("school");
		String st_num = request.getParameter("st_num");
		String name = request.getParameter("name");
		String contacts = request.getParameter("contacts");
		String contact = request.getParameter("contact");
		String sql = createSql(grade, school, st_num, name, contacts, contact);
		System.out.println(sql);
		UserDao userDao = new UserDao();
		ArrayList<User> list = userDao.getUserList(sql);
		StringBuffer xml = new StringBuffer("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		if (!list.isEmpty()) {
			xml.append("<Result>");
			xml.append("<status>1</status>");
			xml.append("<total>" + list.size() + "</total>");
			for (int i = 0; i < list.size(); i++) {
				User u = list.get(i);
				xml.append("<user id =\"" + u.getId() + "\" st_num=\"" + u.getSt_num() + "\" name=\"" + u.getName()
						+ "\" school=\"" + u.getSchool() + "\" major=\"" + u.getMajor() + "\">");
				xml.append("</user>");
			}
			xml.append("</Result>");
		} else {
			xml.append("<Result>");
			xml.append("<status>0</status>");
			
			xml.append("</Result>");

		}
		sendResponse(response, xml.toString());

	}

	private void sendResponse(HttpServletResponse response, String responseText) throws IOException {
		response.setContentType("text/xml");
		response.getWriter().println(responseText);
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

	
	private String createSql(String grade, String school, String st_num, String name, String contacts, String contact) {
		String sql = "select * from user ";
        String myschool="";
		if (school.equals("1"))
			myschool = "能源动力与工程学院";
		if (school.equals("2"))
			myschool = "光电信息与计算机工程学院";
		if (school.equals("3"))
			myschool = "管理学院";
		if (school.equals("4"))
			myschool = "机械工程学院";
		if (school.equals("5"))
			myschool = "外语学院";
		if (school.equals("6"))
			myschool = "环境与建筑学院";
		if (school.equals("7"))
			myschool = "医疗器械与食品学院";
		if (school.equals("8"))
			myschool = "出版印刷与艺术设计学院";
		if (school.equals("9"))
			myschool = "理学院";
		if (school.equals("10"))
			myschool = "材料科学与工程学院";

		if (!grade.equals("0") && !school.equals("0")) {

			sql = sql + " where grade='" + grade + "'and school='" + myschool + "'";
		} else {
			if (grade.equals("0") && !school.equals("0")) {
				sql = sql + " where grade is not null && school='" + myschool + "'";
			}
			if (!grade.equals("0") && school.equals("0")) {
				sql = sql + " where grade='" + grade + "' && school is not null ";
			}
			if(grade.equals("0") && school.equals("0")) {
				sql = sql + " where grade is not null && school is not null ";
			}

		}
		if (!st_num.equals(""))
			sql = sql + " && st_num=\"" + st_num + "\"";
		if (!name.equals(""))
			sql = sql + " && name=\"" + name + "\"";
		if (contacts.equals("1"))
			contacts = "email";
		if (contacts.equals("2"))
			contacts = "phone";
		if (contacts.equals("3"))
			contacts = "wechat";
		if (contacts.equals("4"))
			contacts = "qq";
		if (!contact.equals(""))
			sql = sql + " && " + contacts + "=\"" + contact + "\"";
		return sql;
	}

}

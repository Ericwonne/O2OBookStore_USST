package servlet.admin;

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
import model.User;
import model.UserDao;

/**
 * Servlet implementation class searchRecord
 */
@WebServlet("/searchRecord")
public class searchRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public searchRecord() {
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

		String st_num = request.getParameter("st_num");
		String name = request.getParameter("name");

		String bookname = request.getParameter("bookname");
		String tag = request.getParameter("tag");

		String type = request.getParameter("type");
		String state = request.getParameter("state");
		String isTextbook = request.getParameter("isTextbook");

		String grade = request.getParameter("grade");
		String school = request.getParameter("school");
		String major = request.getParameter("major");

		String sql = createSql(type, st_num, name, bookname, tag, state, isTextbook, grade, school, major);
		System.out.println(sql);
		StringBuffer xml = new StringBuffer("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		if (type.equals("2")) {
			BuyBookDao buyDao = new BuyBookDao();
			ArrayList<BuyBook> list = buyDao.getBookList(sql);

			if (!list.isEmpty()) {
				xml.append("<Result>");
				xml.append("<status>1</status>");
				xml.append("<total>" + list.size() + "</total>");
				for (int i = 0; i < list.size(); i++) {
					BuyBook u = list.get(i);
					UserDao userDao = new UserDao();
					User user = userDao.getUserById(String.valueOf(u.getUserId()));
					float expAge = u.getExpect_age();
					xml.append("<buybook id =\"" + u.getId() + "\" isbn=\"" + u.getIsbn() + "\" name=\"" + u.getName()
							+ "\" version=\"" + u.getVersion() + "\" publish=\"" + u.getPublish() + "\" author=\""
							+ u.getAuthor() + "\" expectAge=\"" + expAge + "\" if_course=\"" + u.getIf_course()
							+ "\" grade=\"" + u.getGrade() + "\" school=\"" + u.getSchool() + "\" major=\""
							+ u.getMajor() + "\" expectDiscount=\"" + u.getExpect_discount() + "\" tag=\"" + u.getTag()
							+ "\" releasetime=\"" + u.getRelease_time() + "\" glances=\"" + u.getGlances()
							+ "\" state=\"" + u.getStatus() + "\" user_id=\"" + u.getUserId() + "\" username=\""
							+ user.getName() + "\" st_num=\"" + user.getSt_num() + "\">");
					xml.append("</buybook>");
				}
				xml.append("</Result>");
			} else {
				xml.append("<Result>");
				xml.append("<status>0</status>");
				xml.append("</Result>");
			}
		}
		if (type.equals("1")) {
			SellBookDao SellDao = new SellBookDao();
			ArrayList<SellBook> list = SellDao.getBookList(sql);

			if (!list.isEmpty()) {
				xml.append("<Result>");
				xml.append("<status>1</status>");
				xml.append("<total>" + list.size() + "</total>");
				for (int i = 0; i < list.size(); i++) {
					SellBook u = list.get(i);
					UserDao userDao = new UserDao();
					User user = userDao.getUserById(String.valueOf(u.getUserId()));
					int expAge = (int)(u.getAge()*10);
					xml.append("<salebook id =\"" + u.getId() + "\" isbn=\"" + u.getIsbn() + "\" name=\"" + u.getName()
							+ "\" version=\"" + u.getVersion() + "\" publish=\"" + u.getPublish() + "\" author=\""
							+ u.getAuthor() + "\" age=\"" + expAge + "\" if_course=\"" + u.getIf_course()
							+ "\" grade=\"" + u.getGrade() + "\" school=\"" + u.getSchool() + "\" major=\""
							+ u.getMajor() + "\" discount=\"" + u.getDiscount() + "\" price=\"" + u.getPrice()
							+ "\" tag=\"" + u.getTag() + "\" releasetime=\"" + u.getRelease_time() + "\" glances=\""
							+ u.getGlances() + "\" state=\"" + u.getStatus() + "\" imageurl=\"" + u.getImageurl()
							+ "\" user_id=\"" + u.getUserId() + "\" username=\"" + user.getName() + "\" st_num=\""
							+ user.getSt_num() + "\">");
					xml.append("</salebook>");
				}
				xml.append("</Result>");
			} else {
				xml.append("<Result>");
				xml.append("<status>0</status>");
				xml.append("</Result>");
			}
		}
		sendResponse(response, xml.toString());
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

	private void sendResponse(HttpServletResponse response, String responseText) throws IOException {
		response.setContentType("text/xml");
		response.getWriter().println(responseText);
	}

	private String createSql(String type, String st_num, String name, String bookname, String tag, String state,
			String isTextbook, String grade, String school, String major) {
		String sql = "";

		if (type.equals("2"))
			sql = sql + "select * from buy_record where status=" + state;
		if (type.equals("1"))
			sql = sql + "select * from sale_record where status=" + state;

		if (!st_num.equals("") && !name.equals(""))
			sql = sql + " && user_id= (select id from user where st_num=\"" + st_num + "\" &&name=\"" + name + "\") ";
		if (!st_num.equals("") && name.equals(""))
			sql = sql + " && user_id= (select id from user where st_num=\"" + st_num + "\") ";
		if (st_num.equals("") && !name.equals(""))
			sql = sql + " && user_id= (select id from user where name=\"" + name + "\") ";

		if (!bookname.equals(""))
			sql = sql + " && name like \"%" + bookname.trim() + "%\"";
		if (!tag.equals("0")) {
			String mytag = "";
			if (tag.equals("1"))
				mytag = "工业技术类";
			if (tag.equals("2"))
				mytag = "数理科学类";
			if (tag.equals("3"))
				mytag = "文化科教类";
			if (tag.equals("4"))
				mytag = "航空航天类";
			if (tag.equals("5"))
				mytag = "语言文字类";
			if (tag.equals("6"))
				mytag = "艺术文学类";
			sql = sql + " && tag=\"" + mytag + "\"";
		}

		if (isTextbook.equals("0")) {
			sql = sql + " && if_course=0 ";
		}
		if (isTextbook.equals("1")) {
			sql = sql + " && if_course=1";
			if (!grade.equals(""))
				sql = sql + " && grade=\"" + grade + "\"";
			if (!school.equals("")) {
				String myschool = "";
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
				sql = sql + " && school=\"" + myschool + "\"";
				if (!major.equals("")) {
					sql = sql + " && major=\"" + major + "\"";

				}
			}

		}

		return sql;
	}
	

}

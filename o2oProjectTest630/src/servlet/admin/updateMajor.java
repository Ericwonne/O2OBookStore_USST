package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateMajor
 */
@WebServlet("/updateMajor")
public class updateMajor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateMajor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String department = request.getParameter("department");
		department = new String(department.getBytes("iso-8859-1"),"UTF-8");
		response.setContentType("text/xml;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<response>");
		switch(department){
		case "1":
			out.println("<message>能源与动力工程</message>");
			out.println("<message>过程装备与控制工程</message>");
			out.println("<message>新能源科学与工程</message>");
			break;
		case "2":
			out.println("<message>光学工程</message>");
			out.println("<message>计算机科学与技术</message>");
		
			break;
		case "机械学院"://机械学院
			out.println("<message>机械设计制造及其自动化</message>");
			out.println("<message>车辆工程</message>");
			out.println("<message>机械设计制造及其自动化（中德）</message>");
			break;
		case "外语学院"://外语学院
			out.println("<message>英语</message>");
			out.println("<message>德语</message>");
			out.println("<message>日语</message>");
			break;
		case "管理学院"://管理学院
			out.println("<message>金融学</message>");
			out.println("<message>管理科学</message>");
			out.println("<message>会计学</message>");
			break;
		case "理学院"://理学院
			out.println("<message>数学</message>");
			out.println("<message>物理</message>");
			out.println("<message>化学</message>");
			break;
		
		}
		out.println("</response>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

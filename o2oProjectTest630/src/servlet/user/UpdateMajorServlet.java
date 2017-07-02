package servlet.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateMajorServlet
 */
@WebServlet("/UpdateMajorServlet")
public class UpdateMajorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMajorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String department = request.getParameter("department");
		department = new String(department.getBytes("iso-8859-1"),"UTF-8");
		response.setContentType("text/xml;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<response>");
		switch(department){
		case "光电信息与计算机工程学院"://光电学院
			out.println("<message>智能科学与技术</message>");		
			out.println("<message>光学工程</message>");
			out.println("<message>软件工程</message>");
			out.println("<message>电子科学与技术</message>");
			break;
		case "能源与动力工程学院"://能源与动力工程学院
			out.println("<message>过程装备与控制工程</message>");
			out.println("<message>新能源科学与工程</message>");
			out.println("<message>制冷及低温工程</message>");
			out.println("<message>能源动力工程</message>");
			break;
		case "机械工程学院"://机械工程学院
			out.println("<message>机械设计及理论</message>");
			out.println("<message>车辆工程</message>");
			out.println("<message>机械电子工程</message>");
			out.println("<message>机械设计制造及其自动化</message>");
			break;
		case "外语学院"://外语学院
			out.println("<message>英语翻译</message>");
			out.println("<message>英美文学</message>");
			out.println("<message>德语</message>");
			out.println("<message>日语</message>");
			break;
		case "管理学院"://管理学院
			out.println("<message>管理科学与工程</message>");
			out.println("<message>工商管理</message>");
			out.println("<message>公共管理</message>");
			out.println("<message>应用经济</message>");
			break;
		case "理学院"://理学院
			out.println("<message>数学与应用数学</message>");
			out.println("<message>应用化学</message>");
			out.println("<message>应用物理学</message>");
			break;
		case "出版印刷与艺术设计学院"://出版印刷与艺术设计学院
			out.println("<message>工业设计</message>");
			out.println("<message>印刷工程</message>");
			out.println("<message>包装工程</message>");
			out.println("<message>广告学</message>");
			break;
		case "材料科学与工程学院"://材料科学与工程学院
			out.println("<message>新能源材料</message>");
			out.println("<message>机电功能材料</message>");
			out.println("<message>材料科学与工程</message>");
			out.println("<message>材料成型与控制</message>");
			break;
		case "医疗器械与食品学院"://医疗器械与食品学院
			out.println("<message>医疗器械工程</message>");
			out.println("<message>药物制剂</message>");
			out.println("<message>食品科学与工程</message>");
			out.println("<message>食品质量与安全</message>");
			break;
		case "环境与建筑学院"://环境与建筑学院
			out.println("<message>环境工程</message>");
			out.println("<message>土木工程</message>");
			out.println("<message>建筑工程</message>");
			out.println("<message>交通工程</message>");
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

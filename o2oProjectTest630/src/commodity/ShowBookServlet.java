package commodity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyBook;
import model.BuyBookDao;
import model.Message;
import model.MessageDao;
import model.SellBook;
import model.SellBookDao;

/**
 * Servlet implementation class ShowBookServlet
 */
@WebServlet("/ShowBookServlet")
public class ShowBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		if(type.equals("buy")){
			BuyBookDao buyBookDao = new BuyBookDao();
			BuyBook buyBook = buyBookDao.getBuyBookById(Integer.parseInt(id));
			buyBookDao.addGlances(Integer.parseInt(id));
			MessageDao messageDao = new MessageDao();
			ArrayList<Message> messages = messageDao.getMessageByBookId(Integer.parseInt(id),0);
			request.setAttribute("book",buyBook);
			request.setAttribute("messages", messages);
			request.getRequestDispatcher("commodity/showBuyBook.jsp").forward(request, response);;
		}else if(type.equals("sell")){
			SellBookDao sellBookDao = new SellBookDao();
			SellBook sellBook = sellBookDao.getSellBookById(Integer.parseInt(id));
			sellBookDao.addGlances(Integer.parseInt(id));
			MessageDao messageDao = new MessageDao();
			ArrayList<Message> messages = messageDao.getMessageByBookId(Integer.parseInt(id),1);
			request.setAttribute("messages", messages);
			request.setAttribute("book", sellBook);
			request.getRequestDispatcher("commodity/showSellBook.jsp").forward(request, response);
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

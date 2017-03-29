package bookstore;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OrderSerlvet
 */
@WebServlet("/OrderSerlvet")
public class OrderSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url ="/show-order.jsp";
		HttpSession session =request.getSession(false);
		if (session==null){
			System.out.println("Forward to SearchBook.html");
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("SearchBook.html");
			dispatcher.forward(request, response);
		}
		ShoppingCart cart=(ShoppingCart)session.getAttribute("bookstore.cart");
		if (cart==null){
			cart=new ShoppingCart();
			session.setAttribute("bookstore.cart", cart);
		}
		ArrayList<Book> books=(ArrayList<Book>)session.getAttribute("foundBooks");
		int i =Integer.parseInt(request.getParameter("selectedBook"));
		cart.addBook(books.get(i));
		session.setAttribute("bookstore.cart", cart);
		ServletContext context=getServletContext();
		RequestDispatcher dispatcher=context.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

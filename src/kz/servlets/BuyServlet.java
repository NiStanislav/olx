package kz.servlets;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kz.beans.MailEvent;
import kz.rest.MailService;
import kz.rest.PostService;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/buy/")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	@Inject 
    MailService mailService;
	
	
    public BuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String seller = request.getParameter("seller");
		String customer = request.getParameter("customer");
		String title = request.getParameter("title");
		System.out.println(seller + " " + customer);
		mailService.sendMail(new MailEvent(seller,customer + " wanted to buy your item "+ title +". Contact him " + customer,"OLX.KZ"));
		request.getRequestDispatcher("/buy.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

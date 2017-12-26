package kz.servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kz.beans.MailEvent;
import kz.rest.MailService;
import kz.rest.PostService;

@WebServlet("/buy/")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	@EJB
    MailService mailService;
	
	
    public BuyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String seller = request.getParameter("seller");
		String customer = request.getParameter("customer");
		String text = request.getParameter("text");
		String title = request.getParameter("title");
		mailService.sendMail(new MailEvent(seller,customer + " wanted to buy your item "+ title +". His message: " + text,"OLX.KZ"));
		request.getRequestDispatcher("/buy.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

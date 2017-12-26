package kz.servlets;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kz.beans.PostBean;
import kz.beans.UserBean;
import kz.rest.PostService;
import kz.rest.UserService;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB 
    PostService postService;
	
	@EJB 
    UserBean userBean;
	
    public UserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getSession().getAttribute("email").toString();
		try {
			String email1 = request.getParameter("email1");
			if(email1 == null)
			{
				request.setAttribute("user", userBean.getUser(email));
				request.setAttribute("posts", postService.getUsersPosts(email));
			}
			else
			{
				request.setAttribute("user", userBean.getUser(email1));
				request.setAttribute("posts", postService.getUsersPosts(email1));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/user.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

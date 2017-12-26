package kz.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kz.dto.PostDTO;
import kz.rest.PostService;


@WebServlet("/post")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
    PostService postService;
    
    
    public PostServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();
		if(id == null)
		{
			out.println("Sorry, this post doesnt exist.");
			return;
		}
		try {
			request.setAttribute("post", postService.getPost(id));
			postService.increaseViews(Long.parseLong(id));
		}
		catch(Exception e)
		{
			out.println("Sorry, this post doesnt exist.");
			return;
		}
		request.getRequestDispatcher("/post.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

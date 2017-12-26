package kz.servlets;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kz.rest.PostService;



@WebServlet("/search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
      	
	@EJB 
	PostService postService;

    public Search() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		String order = request.getParameter("order");
		String category = request.getParameter("category");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String query = "";
		if(!category.equals("All")) { query = "and category = '"+category +"'";}
		if(!from.isEmpty()) { query+=" and price > "+from;}
		if(!to.isEmpty()) { query+=" and price < "+to;}
		request.setAttribute("posts", postService.getSearch(search, order, query));
		request.getRequestDispatcher("/home.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package kz.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kz.beans.PostBean;
import kz.beans.UserBean;
import kz.dto.PostDTO;

@WebServlet("/NewPostServlet")
public class NewPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public NewPostServlet() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		long id = Long.parseLong(req.getSession().getAttribute("postId").toString());
		response.sendRedirect("/rest/post?id="+id);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

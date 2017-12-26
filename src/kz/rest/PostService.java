package kz.rest;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityNotFoundException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import kz.beans.MailEvent;
import kz.beans.PostBean;
import kz.dto.PostDTO;
import kz.entities.PostEntity;

@Stateless
@Path("/post")
public class PostService {
	
	@EJB
	PostBean postBean;
	
	
	@POST
	@Path("/create")
	@Produces(MediaType.TEXT_PLAIN)
	public Response create(@FormParam("title") String title, @FormParam("city") String city, 
	@FormParam("state") String state,@FormParam("price") int price,@FormParam("desc") String description,@FormParam("image") String image,@FormParam("category") String category,@Context HttpServletRequest req) throws NoSuchAlgorithmException, EntityNotFoundException{
        long id = postBean.newPost(new PostEntity(title,category,city,state, image, req.getSession().getAttribute("email").toString(), price, description,req.getSession().getAttribute("phone").toString()));
        HttpSession session = req.getSession();
		session.setAttribute("postId",id);
		return Response.ok().build();
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public PostDTO getPost(@QueryParam("id")String id)
	{
		return postBean.post(Long.parseLong(id));
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<PostDTO> getPosts()
	{
		return postBean.getTop();
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public void increaseViews(long id)
	{
		postBean.increaseViews(id);
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<PostDTO> getSearch(String search,String order,String query)
	{
		return postBean.getResults(order, search, query);
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<PostDTO> getUsersPosts(String email)
	{
		return postBean.postByUser(email);
	}
	
}

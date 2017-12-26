package kz.rest;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityNotFoundException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import kz.beans.UserBean;
import kz.dto.PostDTO;
import kz.dto.UserDTO;



@Stateless
@Path("/auth")
public class UserService{
	
	@EJB
	UserBean userBean;
	
	
	@POST
	@Path("/signIn")
	@Produces(MediaType.TEXT_PLAIN)
	public Response signIn(@FormParam("email") String email, @FormParam("password") String password, @Context HttpServletRequest req) throws NoSuchAlgorithmException, ServletException {
		if(!userBean.getPasswordHash(email, password))
		{
			return Response.serverError().build();
		}
		HttpSession session = req.getSession();
		session.setAttribute("email",email);
		session.setAttribute("phone",userBean.getUser(email).getPhone());
		return Response.ok().build();
	}
	
	@POST
	@Path("/signUp")
	@Produces(MediaType.TEXT_PLAIN)
	public Response signUp(@FormParam("name") String name, @FormParam("surname") String surname, 
			@FormParam("email") String email, @FormParam("password") String password,@FormParam("phone") String phone, @Context HttpServletRequest req) throws NoSuchAlgorithmException, EntityNotFoundException{
		userBean.signUp(name, surname, email, password, phone);
		HttpSession session = req.getSession();
		session.setAttribute("email",email);
		session.setAttribute("phone",phone);
		session.setAttribute("name",name+" "+surname);
		return Response.ok().build();
	}
	
	
}

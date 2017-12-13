package kz.rest;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import kz.helpers.HashText;
@Path("/RestService")
@ApplicationPath("/resources")
public class RestService extends Application {
	
	@GET
	@Path("/hello")
	public String sayHello() throws NoSuchAlgorithmException 
	{
		return HashText.sha1("4352" + "cb92306e-be2a-4f41-823a-88a3491c3622");
	}

}

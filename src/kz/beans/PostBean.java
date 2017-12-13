package kz.beans;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import kz.dto.PostDTO;
import kz.entities.PostEntity;

/**
 * Session Bean implementation class PostBean
 */
@Stateless
@LocalBean
public class PostBean {

	@PersistenceContext(unitName = "entityManager")
	private EntityManager entityManager;
	
	public PostDTO post(long id) {
		 List<PostEntity> posts = (List<PostEntity>) entityManager.createNativeQuery("SELECT * FROM posts where id="+id, PostEntity.class).getResultList();
			ArrayList<PostDTO> results = new ArrayList<PostDTO>();
			for (PostEntity a : posts) {
				results.add(a.toDTO());
			}
			return results.get(0);
	 }
	
	public ArrayList<PostDTO> postByUser(String email) {
		 List<PostEntity> posts = (List<PostEntity>) entityManager.createNativeQuery("SELECT * FROM posts where email='"+email+"'", PostEntity.class).getResultList();
			ArrayList<PostDTO> results = new ArrayList<PostDTO>();
			for (PostEntity a : posts) {
				results.add(a.toDTO());
			}
			return results;
	 }

	 public void increaseViews(long postId) {
	    entityManager.createNativeQuery("update posts set views = views + 1 where id="+ postId).executeUpdate();
	 }

	 public ArrayList<PostDTO> getTop() { 
		 List<PostEntity> posts = (List<PostEntity>) entityManager.createNativeQuery("SELECT * FROM posts order by views limit 10", PostEntity.class).getResultList();
			ArrayList<PostDTO> results = new ArrayList<PostDTO>();
			for (PostEntity a : posts) {
				results.add(a.toDTO());
			}
			return results;
	 }

	 public ArrayList<PostDTO> getResults(String order,String searchText) {
		 List<PostEntity> posts = (List<PostEntity>) entityManager
					.createNativeQuery("SELECT * FROM posts where title like '%" + searchText + "%' order by " + order +" desc", PostEntity.class).getResultList();
			ArrayList<PostDTO> results = new ArrayList<PostDTO>();
			for (PostEntity a : posts) {
				results.add(a.toDTO());
			}
			return results;
	 }

	 public long newPost(PostEntity a) {
		a.setDate(new Date().toString());
		a.setViews(1);
		entityManager.persist(a);
		return a.getId();
	 }

}

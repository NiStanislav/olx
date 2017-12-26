package kz.beans;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import kz.dto.PostDTO;
import kz.entities.PostEntity;


@Stateless
@LocalBean
public class PostBean {

	@PersistenceContext(unitName = "entityManager")
	private EntityManager entityManager;
	
	public PostDTO post(Long id) {
	
		try {
			PostEntity post = (PostEntity) entityManager.createQuery("FROM PostEntity p WHERE p.id=?1").setParameter(1, id).getSingleResult();
			return post != null ? post.toDTO() : null;
		} catch (NoResultException e) {
			return null;
		}
	}	
	public ArrayList<PostDTO> postByUser(String email) {
		 List<PostEntity> posts = (List<PostEntity>) entityManager.createQuery("FROM PostEntity p where p.author=?1").setParameter(1, email).getResultList();
			ArrayList<PostDTO> results = new ArrayList<PostDTO>();
			for (PostEntity a : posts) {
				results.add(a.toDTO());
			}
			return results;
	 }

	 public void increaseViews(Long postId) {
	    int rowsUpdated = entityManager.createQuery("update PostEntity p set p.views = p.views + 1 where p.id=?1").setParameter(1, postId).executeUpdate();
	    
	 }

	 public ArrayList<PostDTO> getTop() { 
		 List<PostEntity> posts = (List<PostEntity>) entityManager.createQuery("FROM PostEntity p order by views limit 10").getResultList();
			ArrayList<PostDTO> results = new ArrayList<PostDTO>();
			for (PostEntity a : posts) {
				results.add(a.toDTO());
			}
			return results;
	 }

	 public ArrayList<PostDTO> getResults(String order,String searchText,String query) {
		 List<PostEntity> posts = (List<PostEntity>) entityManager
					.createNativeQuery("FROM PostEntity p where lower(p.title) like '% ?1 %' ?2 order by ?3 desc").setParameter(1, searchText).setParameter(2, query).setParameter(3, order).getResultList();
			ArrayList<PostDTO> results = new ArrayList<PostDTO>();
			for (PostEntity a : posts) {
				results.add(a.toDTO());
			}
			return results;
	 }

	 public Long newPost(PostEntity a) {
		a.setDate(new Date().toString());
		a.setViews(1);
		entityManager.persist(a);
		return a.getId();
	 }

}

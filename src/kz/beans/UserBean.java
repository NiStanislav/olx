package kz.beans;

import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import kz.dto.UserDTO;
import kz.entities.UserEntity;
import kz.helpers.HashText;


@Stateless
@LocalBean
public class UserBean {
	
	@PersistenceContext(unitName="entityManager")
	private EntityManager entityManager;
     
	
	public void signUp(String name, String surname, String email, String password,String phone) throws NoSuchAlgorithmException, EntityNotFoundException {
		String salt = UUID.randomUUID().toString();
		String hash = HashText.sha1(password + salt);
		UserEntity u = new UserEntity();
		u.setEmail(email);
		u.setName(name);
		u.setSurname(surname);
		u.setPasswordHash(hash);
		u.setPasswordSalt(salt);
		u.setPhone(phone);
		u.setRole(1);
		entityManager.persist(u);
	}
	
    public boolean getPasswordHash(String email, String password) throws NoSuchAlgorithmException {
		Query q = entityManager.createQuery("SELECT z FROM UserEntity z WHERE z.email=:email");
		q.setParameter("email", email);
		UserEntity u = (UserEntity)q.getSingleResult();
		String userHash = HashText.sha1(password + u.getPasswordSalt());
		if(userHash.equals(u.getPasswordHash()))
		{
			return true;
		}
		return false;
    }
    
    public UserDTO getUser(String email) throws NoSuchAlgorithmException {
 		Query q = entityManager.createQuery("SELECT z FROM UserEntity z WHERE z.email=:email");
 		q.setParameter("email", email);
 		UserEntity u = (UserEntity)q.getSingleResult();
 		return u.toDTO();
     }

}

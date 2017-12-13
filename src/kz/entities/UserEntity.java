package kz.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import kz.dto.*;

@Entity
@Table(name = "users")
public class UserEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@Column(name = "name", nullable = false)
    private String name;
	
	@Column(name = "surname", nullable = false)
    private String surname;
    
	@Column(name = "email", unique = true, nullable = false)
    private String email;
    
    @Column(name = "password_hash", nullable = false)
    private String passwordHash;
    
	@Column(name = "password_salt", nullable = false)
    private String passwordSalt;
	
	@Column(name = "role", nullable = false)
    private int role;
	
	@Column(name = "phone", nullable = false)
    private String phone;
	
	public UserDTO toDTO() {
		UserDTO u = new UserDTO();
		u.setEmail(email);
		u.setId(id);
		u.setPhone(phone);
		u.setName(name);
		u.setSurname(surname);
		u.setRole(role);
		return u;
	}
	
	public String getPhone() {
        return name;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
	
	public int getRole() {
	   return role;
	}
	
	public void setRole(int role) {
	   this.role = role;
    }
	
	public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPasswordHash() {
		return passwordHash;
	}
	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
	}
	public String getPasswordSalt() {
		return passwordSalt;
	}
	public void setPasswordSalt(String passwordSalt) {
		this.passwordSalt = passwordSalt;
	}

}

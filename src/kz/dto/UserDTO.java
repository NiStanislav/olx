package kz.dto;


public class UserDTO {
	
	private Long id;
	
	private String name;
	
	private String surname;
    
    private String email;
    
    private String phone;
    
    private int role;
    
    public String getPhone() {
        return phone;
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

}

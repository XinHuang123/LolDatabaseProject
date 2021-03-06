package edu.neu.cs5200.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@JsonIgnoreProperties(ignoreUnknown=true)// ignore unknown
public class User {
	@Id	
	private String username;//primary key
	private String password;
	private String role;
	private String firstname;
	private String lastname;
	private String dateofbirth;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="championid")  // point to user table in database(cloumn: championid)
	private Champion championid;	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="userid") 
	private User userid;
	
	@OneToMany(mappedBy="userid")  //point to user class(private String champion)
	private List<User> users; //navigate to user
	
	
	
	
	public User getUserid() {
		return userid;
	}

	public void setUserid(User userid) {
		this.userid = userid;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public String getRole() {
		return role;
	}
	
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public void setRole(String role) {
		this.role = role;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Champion getChampionid() {
		return championid;
	}
	public void setChampionid(Champion championid) {
		this.championid = championid;
	}
	
	public User(String username, String password, String role, Champion championid, String firstname, String lastname, String dateofbirth,User userid) {
		super();
		this.username=username;
		this.password=password;
		this.role=role;
		this.championid=championid;
		//this.champion=champion;
		this.firstname=firstname;
		this.lastname=lastname;
		this.dateofbirth=dateofbirth;
		this.userid=userid;
	}
	
	public User() {
		super();
	}
	
	

}

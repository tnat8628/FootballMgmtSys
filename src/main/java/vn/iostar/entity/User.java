package vn.iostar.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "users")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name = "UserID")
	private int userId;

	@Column(name = "Username")
	private String username;

	@Column(name = "Password")
	private String password;

	@Column(name = "Fullname")
	private String fullname;

	@Column(name = "Email")
	private String email;

	@Column(name = "Phone")
	private String phone;

	@Column(name = "Avatar")
	private String avatar;

	@Column(name = "Role")
	private boolean role;

	@Column(name = "CreateDate")
	private Date createDate;

	@OneToMany(mappedBy = "user")
	private List<Booking> bookings;
	
	@OneToMany(mappedBy = "user")
	private List<Review> reviews;

}
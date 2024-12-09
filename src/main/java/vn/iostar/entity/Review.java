package vn.iostar.entity;

import java.io.Serializable;
import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "reviews")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name = "ReviewID")
    private int reviewId;

	@OneToOne
    @JoinColumn(name = "BookingID")
    private Booking booking;

	@ManyToOne
	@JoinColumn(name = "UserID")
	private User user;
	
    @Column(name = "Rating")
    private int rating;

    @Column(name = "Comment")
    private String comment;

    @Column(name = "CreateAt")
    private Date createAt;
	
	

}

package vn.iostar.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
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
@Table(name = "bookings")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Booking implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BookingID")
	private int bookingId;
	
	@ManyToOne
    @JoinColumn(name = "FieldID")
    private Field field;
	
	@ManyToOne
    @JoinColumn(name = "UserID")
    private User user;

	@Column(name = "BookingDate")
	private Date bookingDate;

	@Column(name = "StartTime")
	private Time startTime;

	@Column(name = "EndTime")
	private Time endTime;

	@Column(name = "TotalPrice")
	private BigDecimal totalPrice;

	@Column(name = "Status")
	private String status;

	@Column(name = "CreateAt")
	private Date createAt;
	
	@OneToOne(mappedBy = "booking", cascade = CascadeType.ALL)
    private Review review;	

}
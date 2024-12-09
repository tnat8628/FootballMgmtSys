package vn.iostar.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "fields")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Field implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "FieldID")
	private int fieldId;

	@Column(name = "FieldName")
	private String fieldName;

	@ManyToOne
	@JoinColumn(name = "CategoryID")
	private Category category;
	
	@Column(name = "IsActive")
	private Boolean isActive;
	
	@OneToMany(mappedBy = "field")
    private List<Booking> bookings;
	
	@OneToMany(mappedBy = "field")
    private List<PricingRule> rules;

}
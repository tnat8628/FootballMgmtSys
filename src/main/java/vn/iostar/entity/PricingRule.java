package vn.iostar.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Time;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "pricingrules")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PricingRule implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name = "PricingRuleID")
	private int pricingruleId;

	@ManyToOne
	@JoinColumn(name = "FieldID")
	private Field field;

	@Column(name = "StartTime")
	private Time startTime;

	@Column(name = "EndTime")
	private Time endTime;

	@Column(name = "PricePerHour")
	private BigDecimal pricePerHour;

}
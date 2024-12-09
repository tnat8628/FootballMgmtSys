package vn.iostar.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.iostar.entity.Category;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FieldModel implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private int fieldId;

	@Column(name = "FieldName")
	private String fieldName;

	@ManyToOne
	@JoinColumn(name = "CategoryID")
	private Category category;
	
	@Column(name = "IsActive")
	private Boolean isActive;
	
	private Boolean isEdit = false;
}

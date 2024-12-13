package vn.iostar.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.iostar.entity.Field;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PricingRuleModel implements Serializable{

    private static final long serialVersionUID = 1L;
	@Id
	private int pricingruleId;

	@ManyToOne
	@JoinColumn(name = "FieldID")
	private Field field;

	private String startTime;

	private String endTime;

	@Column(name = "PricePerHour")
	private BigDecimal pricePerHour;

    private Boolean isEdit = false;

    // Phương thức chuyển đổi String thành Time
    public Time convertStringToTime(String timeString) {
        try {
            SimpleDateFormat format = new SimpleDateFormat("HH:mm");
            Date parsedDate = format.parse(timeString);
            return new Time(parsedDate.getTime());
        } catch (Exception e) {
            return null;
        }
    }

    // Phương thức chuyển đổi Time thành String
    public String convertTimeToString(Time time) {
        SimpleDateFormat format = new SimpleDateFormat("HH:mm");
        return format.format(time);
    }
}

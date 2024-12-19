package vn.iostar.model;

import java.math.BigDecimal;
import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.iostar.entity.Field;
import vn.iostar.entity.User;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookingModel {
    @ManyToOne
    @JoinColumn(name = "FieldID")
    private Field field;

    @ManyToOne
    @JoinColumn(name = "UserID")
    private User user;

    @Column(name = "BookingDate")
    private Date bookingDate;

    @NotNull(message = "Start time is required")
    private String startTime;

    @NotNull(message = "End time is required")
    private String endTime;
    
    @Column(name = "TotalPrice")
	private BigDecimal totalPrice;

    private String status;

    private Date createAt;
}

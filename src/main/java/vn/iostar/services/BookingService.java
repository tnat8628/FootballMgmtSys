package vn.iostar.services;

import java.math.BigDecimal;
import java.sql.Time;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import vn.iostar.entity.Field;
import vn.iostar.entity.PricingRule;
import vn.iostar.repository.FieldRepository;

public interface BookingService {

    Field getFieldDetails(int fieldId);

    BigDecimal getPriceAtTime(int fieldId, Time bookingStartTime);
}

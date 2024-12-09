package vn.iostar.services;

import java.math.BigDecimal;
import java.sql.Time;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.iostar.entity.Field;
import vn.iostar.entity.PricingRule;
import vn.iostar.repository.FieldRepository;
import vn.iostar.repository.PricingRuleRepository;

@Service
public class BookingServiceImpl implements BookingService {

    @Autowired
    private FieldRepository fieldRepository;

    @Autowired
    private PricingRuleRepository pricingRuleRepository;

    public Field getFieldDetails(int fieldId) {
        // Lấy thông tin của sân dựa trên fieldId
        return fieldRepository.findById(fieldId)
                .orElseThrow(() -> new IllegalArgumentException("Field not found"));
    }

    public BigDecimal getPriceAtTime(int fieldId, Time bookingStartTime) {
        // Tìm pricing rule dựa trên thời gian đặt
        return pricingRuleRepository.findPricingRuleByFieldAndTime(fieldId, bookingStartTime)
                .map(PricingRule::getPricePerHour)
                .orElse(BigDecimal.ZERO); // Giá mặc định là 0 nếu không có
    }
}


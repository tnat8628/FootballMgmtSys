package vn.iostar.repository;

import java.sql.Time;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import vn.iostar.entity.PricingRule;

@Repository
public interface PricingRuleRepository extends JpaRepository<PricingRule, Integer> {

       @Query("SELECT pr FROM PricingRule pr WHERE pr.field.fieldId = :fieldId " +
           "AND :bookingStartTime BETWEEN pr.startTime AND pr.endTime")
       Optional<PricingRule> findPricingRuleByFieldAndTime(int fieldId,
                                                        Time bookingStartTime);


    List<PricingRule> findByField_FieldId(int fieldId);
}

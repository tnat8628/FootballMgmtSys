package vn.iostar.services;

import java.sql.Time;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;

import vn.iostar.entity.PricingRule;

public interface PricingRuleService {

	void deleteById(Integer id);

	long count();

	<S extends PricingRule> boolean exists(Example<S> example);

	Optional<PricingRule> findById(Integer id);

	List<PricingRule> findAll();

	<S extends PricingRule> S save(S entity);

	Optional<PricingRule> findPricingRuleByFieldAndTime(int fieldId, Time bookingStartTime);
	
	List<PricingRule> findByFieldId(int fieldId);
}

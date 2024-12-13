package vn.iostar.services;

import java.sql.Time;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import vn.iostar.entity.PricingRule;
import vn.iostar.repository.PricingRuleRepository;

@Service
public class PricingRuleServiceImpl implements PricingRuleService{
	
	@Autowired
	PricingRuleRepository pricingRuleRepository;

	@Override
	public Optional<PricingRule> findPricingRuleByFieldAndTime(int fieldId, Time bookingStartTime) {
		return pricingRuleRepository.findPricingRuleByFieldAndTime(fieldId, bookingStartTime);
	}

	@Override
	public <S extends PricingRule> S save(S entity) {
		return pricingRuleRepository.save(entity);
	}

	@Override
	public List<PricingRule> findAll() {
		return pricingRuleRepository.findAll();
	}

	@Override
	public Optional<PricingRule> findById(Integer id) {
		return pricingRuleRepository.findById(id);
	}

	@Override
	public <S extends PricingRule> boolean exists(Example<S> example) {
		return pricingRuleRepository.exists(example);
	}

	@Override
	public long count() {
		return pricingRuleRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		pricingRuleRepository.deleteById(id);
	}
	
	
}

package vn.iostar.repository;

import java.sql.Time;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.iostar.entity.Booking;
import vn.iostar.entity.PricingRule;

public interface BookingRepository extends JpaRepository<Booking, Integer> {

}

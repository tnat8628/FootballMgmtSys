package vn.iostar.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.iostar.entity.Booking;
import vn.iostar.entity.Field;

public interface BookingRepository extends JpaRepository<Booking, Integer> {

    List<Booking> findByField(Field field);
}

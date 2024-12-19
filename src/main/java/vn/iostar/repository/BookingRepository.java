package vn.iostar.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import vn.iostar.entity.Booking;
import vn.iostar.entity.Field;
import vn.iostar.entity.User;

public interface BookingRepository extends JpaRepository<Booking, Integer> {

    List<Booking> findByField(Field field);

    List<Booking> findByUser(User user);

    @Query(value = "SELECT COUNT(*) FROM bookings WHERE DATE(booking_date) = CURDATE()", nativeQuery = true)
    long countBookingsToday();

}

package vn.iostar.services;

import java.util.List;

import vn.iostar.entity.Booking;
import vn.iostar.entity.Field;
import vn.iostar.entity.User;

public interface BookingService {

    List<Booking> findAll();

    <S extends Booking> S save(S entity);

    List<Booking> findBookingsByField(Field field);

    List<Booking> findBookingsByUser(User user);
    
    long countBookingsToday();
}

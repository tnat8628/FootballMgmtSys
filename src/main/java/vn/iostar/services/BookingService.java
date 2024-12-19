package vn.iostar.services;

import java.sql.Date;
import java.util.List;

import vn.iostar.entity.Booking;
import vn.iostar.entity.Field;

public interface BookingService {

    <S extends Booking> S save(S entity);

    List<Booking> findBookingsByField(Field field);
}

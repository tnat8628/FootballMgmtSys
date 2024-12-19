package vn.iostar.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.iostar.entity.Booking;
import vn.iostar.entity.Field;
import vn.iostar.entity.User;
import vn.iostar.repository.BookingRepository;

@Service
public class BookingServiceImpl implements BookingService {

    @Autowired
    BookingRepository bookingRepository;

    @Override
    public <S extends Booking> S save(S entity) {
        return bookingRepository.save(entity);
    }

    @Override
    public List<Booking> findBookingsByField(Field field) {
        return bookingRepository.findByField(field);
    }

    @Override
    public List<Booking> findBookingsByUser(User user) {
        return bookingRepository.findByUser(user);
    }

    @Override
    public List<Booking> findAll() {
        return bookingRepository.findAll();
    }

    @Override
    public long countBookingsToday() {
        return bookingRepository.countBookingsToday();
    }

    

}


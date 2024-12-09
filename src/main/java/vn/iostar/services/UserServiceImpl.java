package vn.iostar.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.iostar.entity.User;
import vn.iostar.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public User authenticate(String username, String password) {
		User user = userRepository.findByUsernameAndPassword(username, password);
		return user;
	}

}

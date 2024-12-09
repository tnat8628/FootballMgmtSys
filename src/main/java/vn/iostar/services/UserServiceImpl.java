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

	@Override
	public boolean checkExistEmail(String email) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkExistUsername(String username) {
		if (userRepository.findByUsername(username) == null)
			return true;
		return false;
	}

	@Override
	public boolean checkExistPhone(String phone) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public <S extends User> S save(S entity) {
		return userRepository.save(entity);
	}

	@Override
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	@Override
	public User findByPhone(String phone) {
		return userRepository.findByPhone(phone);
	}

	@Override
	public boolean register(User newUser) {
		if (newUser != null) {
			return true;
		}
		return false;
	}

	@Override
	public User getUserById(int userId) {
		return userRepository.findById(userId).orElse(null);
	}

	@Override
	public User updateUser(User user) {
		return userRepository.save(user);
	}

	@Override
	public void uploadAvatar(int userId, String avatarUrl) {
		User user = userRepository.findById(userId).orElse(null);
		if (user != null) {
			user.setAvatar(avatarUrl);
			userRepository.save(user);
		}
	}

	@Override
	public void updatePassword(int userId, String newPassword) {
		User user = getUserById(userId);
        if (user != null) {
            user.setPassword(newPassword); // Cập nhật mật khẩu trực tiếp
            userRepository.save(user);
        }
		
	}

}

package vn.iostar.services;

import vn.iostar.entity.User;

public interface UserService {
	// Xac thuc nguoi dung
    User authenticate(String username, String password);

	boolean checkExistEmail(String email);

	boolean checkExistUsername(String username);

	boolean checkExistPhone(String phone);

	boolean register(User newUser);

	<S extends User> S save(S entity);

	User findByUsername(String username);
	

	User findByPhone(String phone);

	User findByEmail(String email);
}

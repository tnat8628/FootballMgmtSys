package vn.iostar.services;

import vn.iostar.entity.User;

public interface UserService {
	// Xac thuc nguoi dung
    User authenticate(String username, String password);

}

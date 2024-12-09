package vn.iostar.services;

import java.util.List;

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

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ca88fae96335ac26d22a4f591ecd3aa6f9fc7b1d
	User getUserById(int userId);

	User updateUser(User user);

	void uploadAvatar(int userId, String avatarUrl);
	void updatePassword(int userId, String newPassword);
<<<<<<< HEAD
=======
	List<User> findAll();

	long count();
>>>>>>> 3aab240b3ab10932f9f1c60cfe82b9147fe33c91
=======
>>>>>>> ca88fae96335ac26d22a4f591ecd3aa6f9fc7b1d
}

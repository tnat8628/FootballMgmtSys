package vn.iostar.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import vn.iostar.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByUsernameAndPassword(String username, String password);

	User findByUsername(String username);

	User findByEmail(String email);

	User findByPhone(String phone);
	
	@Modifying
    @Query("UPDATE User u SET u.avatar = :avatarPath WHERE u.userId = :userId")
    void updateAvatar(int userId, String avatarPath);
}

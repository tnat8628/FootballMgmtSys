package vn.iostar.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender javaMailSender;

	@Override
	public void sendOtp(String email, String otp) {

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject("Using this verify code to reset your password: ");
		message.setText("Your OTP code is: " + otp);

		// send mail
		javaMailSender.send(message);
	}

}

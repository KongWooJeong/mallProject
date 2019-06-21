package egovframework.example.cmmn.service.impl;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import egovframework.example.cmmn.service.MailService;

@Service
public class MailServiceImpl implements MailService {
	
	@Resource
	private JavaMailSender javaMailSender;

	@Override
	public void mailSendService(String email, String title, String text) {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
			
			mimeMessage.setContent(text, "text/html;charset=utf-8");
			
			helper.setTo(email);
			helper.setSubject(title);
			
			javaMailSender.send(mimeMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}

}

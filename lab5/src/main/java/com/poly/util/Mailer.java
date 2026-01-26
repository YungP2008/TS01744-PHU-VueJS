package com.poly.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * Lớp tiện ích để gửi email qua Gmail SMTP
 */
public class Mailer {

    /**
     * Gửi email
     * 
     * @param from    Email người gửi
     * @param to      Email người nhận
     * @param subject Tiêu đề mail
     * @param body    Nội dung mail (hỗ trợ HTML)
     */
    public static void send(String from, String to, String subject, String body) {
        // Cấu hình SMTP cho Gmail
        Properties props = new Properties();
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        // Đăng nhập Gmail
        // ⚠️ CHÚ Ý: Phải thay đổi email và App Password của bạn
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // Thay đổi 2 dòng này
                String username = "phamphu11102008@gmail.com"; // Email của bạn
                String password = "qdnm hghk hahe nzdr";
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo email message
            MimeMessage mail = new MimeMessage(session);
            mail.setFrom(new InternetAddress(from));
            mail.setRecipients(Message.RecipientType.TO, to);
            mail.setSubject(subject, "utf-8");
            mail.setText(body, "utf-8", "html");
            mail.setReplyTo(mail.getFrom());

            // Gửi email
            Transport.send(mail);
            System.out.println("✅ Email sent successfully!");

        } catch (Exception e) {
            System.err.println("❌ Error sending email: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Test gửi email
     */
    public static void main(String[] args) {
        String from = "sender@gmail.com";
        String to = "recipient@gmail.com";
        String subject = "Test Email from Lab 5";
        String body = "<h1>Hello!</h1><p>This is a test email from Lab 5.</p>";

        send(from, to, subject, body);
    }
}
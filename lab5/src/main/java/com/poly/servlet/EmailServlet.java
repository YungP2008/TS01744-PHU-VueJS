package com.poly.servlet;

import com.poly.util.Mailer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet xử lý gửi email
 * Sử dụng JavaMail API và Gmail SMTP
 */
@WebServlet("/send-email")
public class EmailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Hiển thị form gửi email
        req.getRequestDispatcher("/email-form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Set encoding UTF-8
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // Lấy thông tin từ form
        // String from = req.getParameter("from");
        String from = "Phu";

        String to = req.getParameter("to"); // mail
        String subject = req.getParameter("subject");
        String body = req.getParameter("body");

        try {
            // Gửi email qua Mailer utility
            Mailer.send(from, to, subject, body);

            // Thông báo thành công
            req.setAttribute("message", "✅ Email sent successfully!");
            req.setAttribute("messageType", "success");

            // Log thông tin
            System.out.println("=== EMAIL SENT ===");
            System.out.println("From: " + from);
            System.out.println("To: " + to);
            System.out.println("Subject: " + subject);
            System.out.println("==================");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("message", "❌ Error sending email: " + e.getMessage());
            req.setAttribute("messageType", "error");
        }

        // Giữ lại dữ liệu đã nhập trên form
        req.setAttribute("from", from);
        req.setAttribute("to", to);
        req.setAttribute("subject", subject);
        req.setAttribute("body", body);

        // Quay lại trang form
        req.getRequestDispatcher("/email-form.jsp").forward(req, resp);
    }
}
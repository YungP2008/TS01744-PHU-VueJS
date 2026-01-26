package com.poly.servlet;

import org.apache.commons.codec.binary.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet xử lý đăng nhập
 * Sử dụng Cookie để ghi nhớ và Session để lưu thông tin đăng nhập
 */
// Sửa tạm để test nếu không chỉnh được server
@WebServlet({ "/login", "/lab5/login" })
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Đọc cookie từ trình duyệt
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user")) {
                    try {
                        // Giải mã Base64
                        String encoded = cookie.getValue();
                        byte[] bytes = Base64.decodeBase64(encoded);
                        String[] userInfo = new String(bytes).split(",");

                        // Hiển thị thông tin lên form
                        req.setAttribute("username", userInfo[0]);
                        req.setAttribute("password", userInfo[1]);

                        System.out.println("🍪 Cookie found - Username: " + userInfo[0]);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        // Chuyển sang trang JSP
        req.getRequestDispatcher("/login-form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Set encoding UTF-8
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // Lấy thông tin từ form
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember-me");

        // Kiểm tra đăng nhập (username: FPT, password: poly)
        if (username.equalsIgnoreCase("FPT") && password.equals("poly")) {
            req.setAttribute("message", "✅ Login successfully!");
            req.setAttribute("messageType", "success");

            // Lưu username vào session
            req.getSession().setAttribute("username", username);

            // Nếu tích "Remember me", lưu cookie
            if (remember != null) {
                try {
                    // Mã hóa thông tin bằng Base64
                    byte[] bytes = (username + "," + password).getBytes();
                    String userInfo = Base64.encodeBase64String(bytes);

                    // Tạo cookie
                    Cookie cookie = new Cookie("user", userInfo);
                    cookie.setMaxAge(30 * 24 * 60 * 60); // Hiệu lực 30 ngày
                    cookie.setPath("/"); // Hiệu lực toàn ứng dụng

                    // Gửi cookie về trình duyệt
                    resp.addCookie(cookie);

                    System.out.println("🍪 Cookie saved for user: " + username);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                // Xóa cookie nếu không tích "Remember me"
                Cookie cookie = new Cookie("user", "");
                cookie.setMaxAge(0);
                cookie.setPath("/");
                resp.addCookie(cookie);
            }

            // Log thông tin
            System.out.println("=== LOGIN SUCCESS ===");
            System.out.println("Username: " + username);
            System.out.println("Remember: " + (remember != null ? "Yes" : "No"));
            System.out.println("====================");

        } else {
            // Đăng nhập thất bại
            req.setAttribute("message", "❌ Invalid login info!");
            req.setAttribute("messageType", "error");
            req.setAttribute("username", username);

            System.out.println("❌ Login failed for username: " + username);
        }

        // Quay lại trang login
        req.getRequestDispatcher("/login-form.jsp").forward(req, resp);
    }
}
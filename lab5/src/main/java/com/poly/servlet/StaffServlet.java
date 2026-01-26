package com.poly.servlet;

import com.poly.model.Staff;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Servlet xử lý form nhập thông tin nhân viên
 * Sử dụng BeanUtils để đọc tham số tự động
 */
@WebServlet("/save")
public class StaffServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Chuyển sang trang JSP để hiển thị form
        req.getRequestDispatcher("/staff-form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Set encoding UTF-8
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // Tạo đối tượng Staff để chứa dữ liệu form
        Staff bean = new Staff();

        try {
            // Khai báo định dạng ngày cho BeanUtils
            DateTimeConverter dtc = new DateConverter(new Date());
            dtc.setPattern("yyyy-MM-dd"); // Format HTML5 date input
            ConvertUtils.register(dtc, Date.class);

            // Đọc và chuyển đổi tham số vào bean tự động
            BeanUtils.populate(bean, req.getParameterMap());

            // In ra console để kiểm tra
            System.out.println("=== STAFF INFORMATION ===");
            System.out.println("Fullname: " + bean.getFullname());
            System.out.println("Birthday: " + bean.getBirthday());
            System.out.println("Gender: " + (bean.isGender() ? "Male" : "Female"));
            System.out.println("Hobbies: " + java.util.Arrays.toString(bean.getHobbies()));
            System.out.println("Country: " + bean.getCountry());
            System.out.println("Salary: " + bean.getSalary());
            System.out.println("========================");

            // Gửi thông báo thành công
            req.setAttribute("message", "✅ Form submitted successfully!");
            req.setAttribute("messageType", "success");
            req.setAttribute("staff", bean);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("message", "❌ Error: " + e.getMessage());
            req.setAttribute("messageType", "error");
        }

        // Quay lại trang form với thông báo
        req.getRequestDispatcher("/staff-form.jsp").forward(req, resp);
    }
}
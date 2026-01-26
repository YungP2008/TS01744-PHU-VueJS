<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Bài 2: Send Email</title>

        </head>

        <body>
            <div class="container">
                <div class="card">
                    <div class="header">
                        <h1>📧 Send Email</h1>
                        <p>Bài 2: Gửi Email bằng JavaMail API</p>
                    </div>

                    <c:if test="${not empty message}">
                        <div class="alert ${messageType == 'error' ? 'alert-error' : 'alert-success'}">
                            ${message}
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/send-email" method="post">
                        <!-- <div class="form-group">
                            <label>📤 From (Your Email)</label>
                            <input type="email" name="from" placeholder="@gmail.com" value="${from}" required>
                        </div> -->

                        <div class="form-group">
                            <label>📥 To (Recipient Email)</label>
                            <input type="email" name="to" placeholder="@gmail.com" value="${to}" required>
                        </div>

                        <div class="form-group">
                            <label>📝 Subject</label>
                            <input type="text" name="subject" placeholder="Email subject" value="${subject}" required>
                        </div>

                        <div class="form-group">
                            <label>✉️ Body (HTML supported)</label>
                            <textarea name="body" placeholder="Email content (HTML supported)..."
                                required>${body}</textarea>
                        </div>

                        <button type="submit" class="btn">✈️ Send Email</button>
                    </form>
                </div>

                <a href="${pageContext.request.contextPath}/" class="back-link">← Back to Home</a>
            </div>
        </body>

        </html>
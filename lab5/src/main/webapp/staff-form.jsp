<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Bài 1: Staff Form - BeanUtils</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    min-height: 100vh;
                    padding: 20px;
                }

                .container {
                    max-width: 800px;
                    margin: 0 auto;
                }

                .card {
                    background: white;
                    border-radius: 20px;
                    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
                    padding: 40px;
                    margin-bottom: 20px;
                }

                .header {
                    text-align: center;
                    margin-bottom: 30px;
                }

                .header h1 {
                    color: #667eea;
                    font-size: 2.5em;
                    margin-bottom: 10px;
                }

                .header p {
                    color: #666;
                    font-size: 1.1em;
                }

                .form-group {
                    margin-bottom: 25px;
                }

                label {
                    display: block;
                    font-weight: 600;
                    color: #333;
                    margin-bottom: 8px;
                    font-size: 0.95em;
                }

                input[type="text"],
                input[type="date"],
                input[type="number"],
                select {
                    width: 100%;
                    padding: 12px 15px;
                    border: 2px solid #e0e0e0;
                    border-radius: 10px;
                    font-size: 1em;
                    transition: all 0.3s;
                }

                input:focus,
                select:focus {
                    outline: none;
                    border-color: #667eea;
                    box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
                }

                .radio-group,
                .checkbox-group {
                    display: flex;
                    gap: 20px;
                    flex-wrap: wrap;
                }

                .radio-item,
                .checkbox-item {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                input[type="radio"],
                input[type="checkbox"] {
                    width: 20px;
                    height: 20px;
                    cursor: pointer;
                }

                .btn {
                    width: 100%;
                    padding: 15px;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    color: white;
                    border: none;
                    border-radius: 10px;
                    font-size: 1.1em;
                    font-weight: 600;
                    cursor: pointer;
                    transition: transform 0.2s, box-shadow 0.2s;
                }

                .btn:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
                }

                .alert {
                    padding: 15px 20px;
                    border-radius: 10px;
                    margin-bottom: 20px;
                    font-weight: 500;
                }

                .alert-success {
                    background: #d4edda;
                    color: #155724;
                    border: 2px solid #c3e6cb;
                }

                .alert-error {
                    background: #f8d7da;
                    color: #721c24;
                    border: 2px solid #f5c6cb;
                }

                .result-box {
                    background: #f8f9fa;
                    border: 2px solid #667eea;
                    border-radius: 10px;
                    padding: 20px;
                    margin-top: 20px;
                }

                .result-box h3 {
                    color: #667eea;
                    margin-bottom: 15px;
                }

                .result-item {
                    display: flex;
                    padding: 10px 0;
                    border-bottom: 1px solid #e0e0e0;
                }

                .result-item:last-child {
                    border-bottom: none;
                }

                .result-label {
                    font-weight: 600;
                    color: #555;
                    min-width: 120px;
                }

                .result-value {
                    color: #333;
                }

                .back-link {
                    display: inline-block;
                    margin-top: 20px;
                    color: white;
                    text-decoration: none;
                    font-weight: 600;
                    text-align: center;
                    display: block;
                }

                .back-link:hover {
                    text-decoration: underline;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="card">
                    <div class="header">
                        <h1>📋 Staff Information</h1>
                        <p>Bài 1: Sử dụng BeanUtils để đọc tham số</p>
                    </div>

                    <c:if test="${not empty message}">
                        <div class="alert ${messageType == 'error' ? 'alert-error' : 'alert-success'}">
                            ${message}
                        </div>
                    </c:if>

                    <c:url value="/save" var="url" />
                    <form action="${url}" method="post">
                        <div class="form-group">
                            <label>👤 Full Name</label>
                            <input type="text" name="fullname" placeholder="Enter full name" required>
                        </div>

                        <div class="form-group">
                            <label>📅 Birthday</label>
                            <input type="date" name="birthday" required>
                        </div>

                        <div class="form-group">
                            <label>⚧ Gender</label>
                            <div class="radio-group">
                                <div class="radio-item">
                                    <input type="radio" id="male" name="gender" value="true" checked>
                                    <label for="male" style="margin: 0;">Male</label>
                                </div>
                                <div class="radio-item">
                                    <input type="radio" id="female" name="gender" value="false">
                                    <label for="female" style="margin: 0;">Female</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>❤️ Hobbies</label>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="reading" name="hobbies" value="R">
                                    <label for="reading" style="margin: 0;">Reading</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="traveling" name="hobbies" value="Traveling">
                                    <label for="traveling" style="margin: 0;">Traveling</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="music" name="hobbies" value="M">
                                    <label for="music" style="margin: 0;">Music</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>🌍 Country</label>
                            <select name="country">
                                <option value="VN">Việt Nam</option>
                                <option value="US" selected>United States</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>💰 Salary</label>
                            <input type="number" name="salary" placeholder="Enter salary" step="0.01" required>
                        </div>

                        <button type="submit" class="btn">Submit</button>
                    </form>

                    <c:if test="${not empty staff}">
                        <div class="result-box">
                            <h3>✅ Submitted Information</h3>
                            <div class="result-item">
                                <span class="result-label">Full Name:</span>
                                <span class="result-value">${staff.fullname}</span>
                            </div>
                            <div class="result-item">
                                <span class="result-label">Birthday:</span>
                                <span class="result-value">${staff.birthday}</span>
                            </div>
                            <div class="result-item">
                                <span class="result-label">Gender:</span>
                                <span class="result-value">${staff.gender ? 'Male' : 'Female'}</span>
                            </div>
                            <div class="result-item">
                                <span class="result-label">Hobbies:</span>
                                <span class="result-value">
                                    <c:forEach var="hobby" items="${staff.hobbies}" varStatus="status">
                                        ${hobby}<c:if test="${!status.last}">, </c:if>
                                    </c:forEach>
                                </span>
                            </div>
                            <div class="result-item">
                                <span class="result-label">Country:</span>
                                <span class="result-value">${staff.country}</span>
                            </div>
                            <div class="result-item">
                                <span class="result-label">Salary:</span>
                                <span class="result-value">$${staff.salary}</span>
                            </div>
                        </div>
                    </c:if>
                </div>

                <a href="${pageContext.request.contextPath}/" class="back-link">← Back to Home</a>
            </div>
        </body>

        </html>
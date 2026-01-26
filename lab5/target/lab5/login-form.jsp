<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Bài 3: Login - Cookie & Session</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 20px;
                }

                .container {
                    width: 100%;
                    max-width: 450px;
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
                    margin-bottom: 35px;
                }

                .lock-icon {
                    width: 80px;
                    height: 80px;
                    background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 20px;
                    font-size: 40px;
                }

                .header h1 {
                    color: #38f9d7;
                    font-size: 2em;
                    margin-bottom: 5px;
                }

                .header p {
                    color: #666;
                    font-size: 0.95em;
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
                input[type="password"] {
                    width: 100%;
                    padding: 12px 15px;
                    border: 2px solid #e0e0e0;
                    border-radius: 10px;
                    font-size: 1em;
                    transition: all 0.3s;
                }

                input:focus {
                    outline: none;
                    border-color: #38f9d7;
                    box-shadow: 0 0 0 3px rgba(56, 249, 215, 0.1);
                }

                .remember-me {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    margin-bottom: 25px;
                }

                .remember-me input[type="checkbox"] {
                    width: 20px;
                    height: 20px;
                    cursor: pointer;
                }

                .remember-me label {
                    margin: 0;
                    cursor: pointer;
                    font-weight: 500;
                }

                .btn {
                    width: 100%;
                    padding: 15px;
                    background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
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
                    box-shadow: 0 10px 25px rgba(56, 249, 215, 0.4);
                }

                .alert {
                    padding: 15px 20px;
                    border-radius: 10px;
                    margin-bottom: 20px;
                    font-weight: 500;
                    text-align: center;
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

                .info-box {
                    background: #e7f3ff;
                    border: 2px solid #2196F3;
                    border-radius: 10px;
                    padding: 15px;
                    margin-top: 20px;
                    text-align: center;
                }

                .info-box h4 {
                    color: #1976D2;
                    margin-bottom: 10px;
                    font-size: 0.95em;
                }

                .info-box p {
                    color: #1976D2;
                    font-size: 0.85em;
                    line-height: 1.6;
                }

                .info-box code {
                    background: #bbdefb;
                    padding: 2px 6px;
                    border-radius: 4px;
                    font-family: 'Courier New', monospace;
                }

                .back-link {
                    display: block;
                    text-align: center;
                    margin-top: 15px;
                    color: white;
                    text-decoration: none;
                    font-weight: 600;
                    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                }

                .back-link:hover {
                    text-decoration: underline;
                }

                .session-info {
                    background: #f0f8ff;
                    border-left: 4px solid #38f9d7;
                    padding: 15px;
                    margin-top: 20px;
                    border-radius: 5px;
                }

                .session-info h4 {
                    color: #38f9d7;
                    margin-bottom: 8px;
                }

                .session-info p {
                    color: #555;
                    font-size: 0.9em;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="card">
                    <div class="header">
                        <div class="lock-icon">🔐</div>
                        <h1>Login</h1>
                        <p>Bài 3: Cookie & Session</p>
                    </div>

                    <c:if test="${not empty message}">
                        <div class="alert ${messageType == 'error' ? 'alert-error' : 'alert-success'}">
                            ${message}
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/login" method="post">
                        <div class="form-group">
                            <label>👤 Username</label>
                            <input type="text" name="username" placeholder="Enter username" value="${username}"
                                required>
                        </div>

                        <div class="form-group">
                            <label>🔒 Password</label>
                            <input type="password" name="password" placeholder="Enter password" value="${password}"
                                required>
                        </div>

                        <div class="remember-me">
                            <input type="checkbox" id="remember" name="remember-me">
                            <label for="remember">🍪 Remember me?</label>
                        </div>

                        <button type="submit" class="btn">Login</button>
                    </form>

                    <div class="info-box">
                        <h4>🔑 Test Credentials</h4>
                        <p>
                            Username: <code>FPT</code><br>
                            Password: <code>poly</code>
                        </p>
                    </div>

                    <c:if test="${not empty sessionScope.username}">
                        <div class="session-info">
                            <h4>✅ Session Active</h4>
                            <p>Logged in as: <strong>${sessionScope.username}</strong></p>
                        </div>
                    </c:if>
                </div>

                <a href="${pageContext.request.contextPath}/" class="back-link">← Back to Home</a>
            </div>
        </body>

        </html>
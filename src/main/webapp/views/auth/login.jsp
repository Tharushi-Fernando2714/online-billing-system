<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Pahana Edu Online Billing System</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        :root {
            --primary-dark: #1e3a8a;
            --primary: #3b82f6;
            --primary-medium: #60a5fa;
            --primary-light: #93c5fd;
            --primary-lighter: #bfdbfe;
            --primary-pale: #dbeafe;
            --primary-bg: #f1f5f9;
            --cream: #f8fafc;
            --accent-green: #10b981;
            --accent-orange: #f59e0b;
            --accent-red: #ef4444;
        }
        
        body {
            background-color: var(--primary-bg);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .login-container {
            width: 100%;
            max-width: 420px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(59, 130, 246, 0.1);
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .login-container:hover {
            box-shadow: 0 15px 40px rgba(59, 130, 246, 0.15);
        }
        
        .login-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 2rem;
            text-align: center;
        }
        
        .login-header h1 {
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .login-header p {
            opacity: 0.9;
            margin-bottom: 0;
        }
        
        .login-body {
            padding: 2rem;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-label {
            color: var(--primary-dark);
            font-weight: 500;
            margin-bottom: 0.5rem;
            display: block;
        }
        
        .form-control {
            border: 1px solid var(--primary-pale);
            border-radius: 8px;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(59, 130, 246, 0.15);
        }
        
        .remember-me {
            margin-bottom: 1.5rem;
        }
        
        .form-check-input {
            border: 1px solid var(--primary-pale);
        }
        
        .form-check-input:checked {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        
        .btn-login {
            background-color: var(--primary);
            border: none;
            border-radius: 8px;
            padding: 0.75rem;
            width: 100%;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }
        
        .btn-login:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }
        
        .login-footer {
            background-color: var(--cream);
            padding: 1rem;
            text-align: center;
            color: var(--primary);
            font-size: 0.9rem;
        }
        
        .login-footer p {
            margin-bottom: 0.5rem;
        }
        
        .login-footer small {
            color: var(--primary-medium);
        }
        
        /* Alert styling */
        .alert {
            border-radius: 8px;
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1><i class="fas fa-book me-2"></i>Pahana Edu Bookshop</h1>
            <p>Online Billing System</p>
        </div>
        
        <div class="login-body">
            <!-- Include messages -->
            <jsp:include page="/includes/messages.jsp" />
            
            <form action="${pageContext.request.contextPath}/login" method="POST">
                <div class="form-group">
                    <label for="username" class="form-label">
                        <i class="fas fa-user me-1"></i>Username
                    </label>
                    <input type="text" 
                           class="form-control" 
                           id="username" 
                           name="username" 
                           value="${username}" 
                           placeholder="Enter your username"
                           required 
                           autofocus>
                </div>
                
                <div class="form-group">
                    <label for="password" class="form-label">
                        <i class="fas fa-lock me-1"></i>Password
                    </label>
                    <input type="password" 
                           class="form-control" 
                           id="password" 
                           name="password" 
                           placeholder="Enter your password"
                           required>
                </div>
                
                <div class="form-check remember-me">
                    <input type="checkbox" 
                           class="form-check-input" 
                           id="rememberMe" 
                           name="rememberMe">
                    <label class="form-check-label" for="rememberMe">
                        Remember me
                    </label>
                </div>
                
                <button type="submit" class="btn btn-primary btn-login">
                    <i class="fas fa-sign-in-alt me-1"></i>Login
                </button>
            </form>
        </div>
        
        <div class="login-footer">
            <p>&copy; 2024 Pahana Edu. All rights reserved.</p>
        </div>
    </div>
    
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Auto-hide alerts after 5 seconds
        $(document).ready(function() {
            setTimeout(function() {
                $('.alert').fadeOut('slow');
            }, 5000);
        });
    </script>
</body>
</html>
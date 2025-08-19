<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer - Pahana Edu</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
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
            --accent-blue: #06b6d4;
        }
        
       body {
            background-color: var(--primary-bg) !important;
            color: var(--primary-dark);
        }
        
        .text-primary-dark {
            color: var(--primary-dark) !important;
        }
        
        .text-primary-medium {
            color: var(--primary-medium) !important;
        }
        
        .border-primary {
            border-color: var(--primary-pale) !important;
        }
        
        .card {
            border: none;
            box-shadow: 0 2px 4px rgba(59, 130, 246, 0.1);
            background: white;
        }
        
        .card-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-medium) 100%);
            color: white;
            border: none;
            padding: 1rem 1.25rem;
        }
        
        .card-header h6 {
            color: white !important;
            font-weight: 600;
            margin: 0;
            font-size: 1.1rem;
        }
        
        /* Form Styling */
        .form-label {
            color: var(--primary-dark);
            font-weight: 600;
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }
        
        .form-label::after {
            content: '';
            color: var(--accent-red);
            margin-left: 2px;
        }
        
        .form-control, .form-select {
            border: 1px solid var(--primary-pale);
            background-color: white;
            color: var(--primary-dark);
            transition: all 0.3s ease;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(59, 130, 246, 0.15);
            background-color: var(--cream);
        }
        
        .form-control.is-invalid {
            border-color: var(--accent-red);
        }
        
        .form-control.is-invalid:focus {
            border-color: var(--accent-red);
            box-shadow: 0 0 0 0.2rem rgba(239, 68, 68, 0.15);
        }
        
        .invalid-feedback {
            color: var(--accent-red);
            font-size: 0.875rem;
        }
        
        textarea.form-control {
            resize: vertical;
        }
        
        /* Form Sections */
        .form-section {
            background: linear-gradient(135deg, white 0%, var(--cream) 100%);
            padding: 1.5rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            border-left: 3px solid var(--primary);
        }
        
        .form-section-title {
            color: var(--primary);
            font-weight: 600;
            margin-bottom: 1rem;
            font-size: 1rem;
            display: flex;
            align-items: center;
        }
        
        .form-section-title i {
            margin-right: 0.5rem;
            color: var(--primary-medium);
        }
        
        /* Buttons */
        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
            color: white;
            font-weight: 500;
            padding: 0.5rem 1.5rem;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(59, 130, 246, 0.2);
        }
        
        .btn-secondary {
            background-color: var(--primary-light);
            border-color: var(--primary-light);
            color: white;
            font-weight: 500;
            padding: 0.5rem 1.5rem;
            transition: all 0.3s ease;
        }
        
        .btn-secondary:hover {
            background-color: var(--primary-medium);
            border-color: var(--primary-medium);
        }
        
        /* Required Field Indicator */
        .required-indicator {
            color: var(--accent-red);
            font-weight: bold;
        }
        
        /* Input Group Icons */
        .input-icon {
            position: relative;
        }
        
        .input-icon i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-light);
            pointer-events: none;
            z-index: 1;
        }
        
        .input-icon .form-control {
            padding-left: 35px;
        }
        
        /* Helper Text */
        .form-text {
            color: var(--primary-medium);
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
        
        /* Card Body */
        .card-body {
            padding: 2rem;
            background: white;
        }
        
        /* Divider */
        hr {
            border-color: var(--primary-pale);
            opacity: 0.3;
            margin: 2rem 0;
        }
        
        /* Focus Animation */
        @keyframes focusPulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.02); }
            100% { transform: scale(1); }
        }
        
        .form-control:focus {
            animation: focusPulse 0.3s ease;
        }
        
        /* Success Message Preview */
        .success-preview {
            background-color: #ecfdf5;
            border-left: 3px solid var(--accent-green);
            padding: 1rem;
            border-radius: 4px;
            display: none;
        }
    </style>
</head>
<body>
    <jsp:include page="/includes/navbar.jsp" />
    
    <div class="container-fluid">
            <main class="px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom border-brown">
                    <h1 class="h2 text-brown-dark fw-bold">
                        <i class="fas fa-user-plus me-2" style="color: var(--brown-medium);"></i>
                        Add New Customer
                    </h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <a href="${pageContext.request.contextPath}/customer/list" class="btn btn-secondary">
                            <i class="fas fa-arrow-left"></i> Back to List
                        </a>
                    </div>
                </div>
                
                <jsp:include page="/includes/messages.jsp" />
                
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold">
                            <i class="fas fa-info-circle me-2"></i>
                            Customer Information
                        </h6>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/customer/add" method="post">
                            <!-- Personal Information Section -->
                            <div class="form-section">
                                <div class="form-section-title">
                                    <i class="fas fa-user"></i>
                                    Personal Information
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="customerName" class="form-label">
                                            Full Name <span class="required-indicator">*</span>
                                        </label>
                                        <div class="input-icon">
                                            <i class="fas fa-user"></i>
                                            <input type="text" class="form-control ${validationErrors.customerName != null ? 'is-invalid' : ''}" 
                                                   id="customerName" name="customerName" value="${customer.customerName}" 
                                                   placeholder="Enter customer's full name" required>
                                        </div>
                                        <c:if test="${validationErrors.customerName != null}">
                                            <div class="invalid-feedback">${validationErrors.customerName}</div>
                                        </c:if>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="nicNumber" class="form-label">
                                            NIC Number <span class="required-indicator">*</span>
                                        </label>
                                        <div class="input-icon">
                                            <i class="fas fa-id-card"></i>
                                            <input type="text" class="form-control ${validationErrors.nicNumber != null ? 'is-invalid' : ''}" 
                                                   id="nicNumber" name="nicNumber" value="${customer.nicNumber}" 
                                                   placeholder="Enter NIC number" required>
                                        </div>
                                        <c:if test="${validationErrors.nicNumber != null}">
                                            <div class="invalid-feedback">${validationErrors.nicNumber}</div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Address Information Section -->
                            <div class="form-section">
                                <div class="form-section-title">
                                    <i class="fas fa-map-marker-alt"></i>
                                    Address Information
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">
                                        Address <span class="required-indicator">*</span>
                                    </label>
                                    <textarea class="form-control ${validationErrors.address != null ? 'is-invalid' : ''}" 
                                              id="address" name="address" rows="3" 
                                              placeholder="Enter complete address" required>${customer.address}</textarea>
                                    <c:if test="${validationErrors.address != null}">
                                        <div class="invalid-feedback">${validationErrors.address}</div>
                                    </c:if>
                                </div>
                                
                                <div class="row mb-3">
                                    <div class="col-md-4">
                                        <label for="city" class="form-label">City</label>
                                        <div class="input-icon">
                                            <i class="fas fa-city"></i>
                                            <input type="text" class="form-control ${validationErrors.city != null ? 'is-invalid' : ''}" 
                                                   id="city" name="city" value="${customer.city}" placeholder="Enter city">
                                        </div>
                                        <c:if test="${validationErrors.city != null}">
                                            <div class="invalid-feedback">${validationErrors.city}</div>
                                        </c:if>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="postalCode" class="form-label">Postal Code</label>
                                        <div class="input-icon">
                                            <i class="fas fa-mail-bulk"></i>
                                            <input type="text" class="form-control ${validationErrors.postalCode != null ? 'is-invalid' : ''}" 
                                                   id="postalCode" name="postalCode" value="${customer.postalCode}" 
                                                   placeholder="Enter postal code">
                                        </div>
                                        <c:if test="${validationErrors.postalCode != null}">
                                            <div class="invalid-feedback">${validationErrors.postalCode}</div>
                                        </c:if>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="registrationDate" class="form-label">Registration Date</label>
                                        <div class="input-icon">
                                            <i class="fas fa-calendar"></i>
                                            <input type="date" class="form-control" id="registrationDate" 
                                                   name="registrationDate" value="${customer.registrationDate}">
                                        </div>
                                        <small class="form-text">Leave blank to use today's date</small>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Contact Information Section -->
                            <div class="form-section">
                                <div class="form-section-title">
                                    <i class="fas fa-phone"></i>
                                    Contact Information
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-4">
                                        <label for="telephone" class="form-label">
                                            Telephone <span class="required-indicator">*</span>
                                        </label>
                                        <div class="input-icon">
                                            <i class="fas fa-phone"></i>
                                            <input type="tel" class="form-control ${validationErrors.telephone != null ? 'is-invalid' : ''}" 
                                                   id="telephone" name="telephone" value="${customer.telephone}" 
                                                   placeholder="Enter telephone number" required>
                                        </div>
                                        <c:if test="${validationErrors.telephone != null}">
                                            <div class="invalid-feedback">${validationErrors.telephone}</div>
                                        </c:if>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="mobile" class="form-label">Mobile</label>
                                        <div class="input-icon">
                                            <i class="fas fa-mobile-alt"></i>
                                            <input type="tel" class="form-control ${validationErrors.mobile != null ? 'is-invalid' : ''}" 
                                                   id="mobile" name="mobile" value="${customer.mobile}" 
                                                   placeholder="Enter mobile number">
                                        </div>
                                        <c:if test="${validationErrors.mobile != null}">
                                            <div class="invalid-feedback">${validationErrors.mobile}</div>
                                        </c:if>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="email" class="form-label">Email</label>
                                        <div class="input-icon">
                                            <i class="fas fa-envelope"></i>
                                            <input type="email" class="form-control ${validationErrors.email != null ? 'is-invalid' : ''}" 
                                                   id="email" name="email" value="${customer.email}" 
                                                   placeholder="Enter email address">
                                        </div>
                                        <c:if test="${validationErrors.email != null}">
                                            <div class="invalid-feedback">${validationErrors.email}</div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            
                            <hr>
                            
                            <div class="text-end">
                                <button type="reset" class="btn btn-secondary me-2">
                                    <i class="fas fa-undo"></i> Reset
                                </button>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save"></i> Save Customer
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </main>
    </div>
    
    <jsp:include page="/includes/footer.jsp" />
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/validation.js"></script>
    
    <script>
        // Add visual feedback on form submission
        document.querySelector('form').addEventListener('submit', function(e) {
            const submitBtn = document.querySelector('button[type="submit"]');
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Saving...';
            submitBtn.disabled = true;
        });
        
        // Auto-set today's date if registration date is empty
        document.addEventListener('DOMContentLoaded', function() {
            const dateField = document.getElementById('registrationDate');
            if (!dateField.value) {
                const today = new Date().toISOString().split('T')[0];
                dateField.value = today;
            }
        });
    </script>
</body>
</html>
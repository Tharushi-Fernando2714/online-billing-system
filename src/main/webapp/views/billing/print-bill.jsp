<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill #${bill.billNumber} - Pahana Edu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/print.css">
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
            --accent-yellow: #eab308;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--primary-dark);
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: white;
        }
        
        .bill-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(59, 130, 246, 0.1);
            overflow: hidden;
        }
        
        .bill-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-medium) 100%);
            color: white;
            padding: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        
        .company-info h1 {
            margin: 0 0 0.5rem 0;
            font-size: 2rem;
            font-weight: 700;
        }
        
        .company-info p {
            margin: 0.25rem 0;
            color: var(--cream);
        }
        
        .bill-title {
            text-align: right;
        }
        
        .bill-title h2 {
            margin: 0 0 0.5rem 0;
            font-size: 1.5rem;
            font-weight: 600;
        }
        
        .bill-title p {
            margin: 0.25rem 0;
            color: var(--cream);
        }
        
        .bill-info {
            padding: 2rem;
            display: flex;
            justify-content: space-between;
            background-color: var(--cream);
            border-bottom: 1px solid var(--primary-pale);
        }
        
        .customer-info h3 {
            color: var(--primary);
            margin: 0 0 1rem 0;
            font-size: 1.1rem;
            font-weight: 600;
        }
        
        .customer-info p {
            margin: 0.25rem 0;
            color: var(--primary-dark);
        }
        
        .bill-details table {
            border: none;
        }
        
        .bill-details td {
            padding: 0.25rem 1rem 0.25rem 0;
            color: var(--primary-dark);
        }
        
        .items-section {
            padding: 1.5rem 2rem;
        }
        
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1.5rem;
        }
        
        .items-table thead th {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-medium) 100%);
            color: white;
            padding: 1rem 0.75rem;
            text-align: left;
            font-weight: 500;
            border: none;
        }
        
        .items-table tbody td {
            padding: 0.75rem;
            border-bottom: 1px solid var(--primary-pale);
            color: var(--primary-dark);
        }
        
        .items-table tbody tr:hover {
            background-color: var(--cream);
        }
        
        .text-center {
            text-align: center;
        }
        
        .text-right {
            text-align: right;
        }
        
        .bill-summary {
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            background-color: var(--cream);
        }
        
        .payment-info p {
            margin: 0.5rem 0;
            color: var(--primary-dark);
        }
        
        .status-paid {
            color: var(--accent-green);
            font-weight: 600;
        }
        
        .status-pending {
            color: var(--accent-orange);
            font-weight: 600;
        }
        
        .status-cancelled {
            color: var(--accent-red);
            font-weight: 600;
        }
        
        .summary-table {
            border: none;
            min-width: 300px;
        }
        
        .summary-table td {
            padding: 0.5rem 1rem 0.5rem 0;
            color: var(--primary-dark);
        }
        
        .total-row {
            border-top: 2px solid var(--primary);
            font-weight: 700;
            font-size: 1.1rem;
            color: var(--primary);
        }
        
        .total-row td {
            padding-top: 1rem;
        }
        
        .bill-footer {
            padding: 2rem;
            background: linear-gradient(135deg, var(--primary-bg) 0%, var(--cream) 100%);
            border-top: 1px solid var(--primary-pale);
        }
        
        .thank-you {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .thank-you p {
            font-size: 1.2rem;
            color: var(--primary);
            font-weight: 600;
            margin: 0;
        }
        
        .signature-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 2rem;
        }
        
        .signature {
            text-align: center;
            flex: 1;
            margin: 0 2rem;
        }
        
        .signature p {
            margin: 0.5rem 0;
            color: var(--primary-dark);
        }
        
        .footer-info {
            text-align: center;
            color: var(--primary-medium);
            font-size: 0.9rem;
        }
        
        .footer-info p {
            margin: 0.25rem 0;
        }
        
        .print-actions {
            position: fixed;
            top: 20px;
            right: 20px;
            background: white;
            padding: 1rem;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.15);
            display: flex;
            gap: 0.5rem;
            z-index: 1000;
        }
        
        .btn-print, .btn-close, .btn-back {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.2s ease;
        }
        
        .btn-print {
            background-color: var(--primary);
            color: white;
        }
        
        .btn-print:hover {
            background-color: var(--primary-dark);
        }
        
        .btn-close {
            background-color: var(--accent-red);
            color: white;
        }
        
        .btn-close:hover {
            background-color: #DC2626;
        }
        
        .btn-back {
            background-color: var(--primary-light);
            color: var(--primary-dark);
        }
        
        .btn-back:hover {
            background-color: var(--primary-medium);
            color: white;
        }
        
        /* Print Styles */
        @media print {
            .no-print { 
                display: none !important; 
            }
            
            body { 
                margin: 0; 
                background: white;
            }
            
            .bill-container { 
                box-shadow: none !important; 
                border-radius: 0;
                max-width: none;
            }
            
            .bill-header {
                background: var(--primary) !important;
                color: white !important;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }
            
            .items-table thead th {
                background: var(--primary) !important;
                color: white !important;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }
            
            .bill-info, .bill-summary, .bill-footer {
                background: var(--cream) !important;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }
        }
    </style>
</head>
<body>
    <div class="bill-container">
        <!-- Header -->
        <div class="bill-header">
            <div class="company-info">
                <h1>${companyName}</h1>
                <p>${companyAddress}</p>
                <p>Tel: ${companyPhone} | Email: ${companyEmail}</p>
            </div>
            <div class="bill-title">
                <h2>INVOICE</h2>
                <p>Bill No: ${bill.billNumber}</p>
            </div>
        </div>
        
        <!-- Bill Info -->
        <div class="bill-info">
            <div class="customer-info">
                <h3>Bill To:</h3>
                <p><strong>${bill.customer.customerName}</strong></p>
                <p>${bill.customer.address}</p>
                <c:if test="${not empty bill.customer.city}">
                    <p>${bill.customer.city} ${bill.customer.postalCode}</p>
                </c:if>
                <p>Tel: ${bill.customer.telephone}</p>
            </div>
            <div class="bill-details">
                <table>
                    <tr>
                        <td><strong>Date:</strong></td>
                        <td><fmt:formatDate value="${bill.billDate}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                    <tr>
                        <td><strong>Time:</strong></td>
                        <td><fmt:formatDate value="${bill.billTime}" pattern="HH:mm:ss"/></td>
                    </tr>
                    <tr>
                        <td><strong>Account No:</strong></td>
                        <td>${bill.customer.accountNumber}</td>
                    </tr>
                    <tr>
                        <td><strong>Payment:</strong></td>
                        <td>${bill.paymentMethod}</td>
                    </tr>
                </table>
            </div>
        </div>
        
        <!-- Items Table -->
        <div class="items-section">
            <table class="items-table">
                <thead>
                    <tr>
                        <th width="5%">#</th>
                        <th width="15%">Item Code</th>
                        <th width="35%">Description</th>
                        <th width="10%">Qty</th>
                        <th width="15%">Unit Price</th>
                        <th width="10%">Discount</th>
                        <th width="15%">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${bill.billItems}" var="item" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${item.item.itemCode}</td>
                            <td>${item.item.itemName}</td>
                            <td class="text-center">${item.quantity}</td>
                            <td class="text-right">
                                <fmt:formatNumber value="${item.unitPrice}" pattern="#,##0.00"/>
                            </td>
                            <td class="text-center">
                                <c:if test="${item.discountPercentage > 0}">
                                    ${item.discountPercentage}%
                                </c:if>
                                <c:if test="${item.discountPercentage == 0}">
                                    -
                                </c:if>
                            </td>
                            <td class="text-right">
                                <fmt:formatNumber value="${item.totalPrice}" pattern="#,##0.00"/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <!-- Summary -->
        <div class="bill-summary">
            <div class="summary-left">
                <div class="payment-info">
                    <p><strong>Payment Status:</strong> 
                        <span class="status-${bill.paymentStatus.toLowerCase()}">${bill.paymentStatus}</span>
                    </p>
                    <c:if test="${not empty bill.notes}">
                        <p><strong>Notes:</strong> ${bill.notes}</p>
                    </c:if>
                </div>
            </div>
            <div class="summary-right">
                <table class="summary-table">
                    <tr>
                        <td>Subtotal:</td>
                        <td><fmt:formatNumber value="${bill.subtotal}" pattern="#,##0.00"/></td>
                    </tr>
                    <c:if test="${bill.discountAmount > 0}">
                        <tr>
                            <td>Discount (${bill.discountPercentage}%):</td>
                            <td>- <fmt:formatNumber value="${bill.discountAmount}" pattern="#,##0.00"/></td>
                        </tr>
                    </c:if>
                    <c:if test="${bill.taxAmount > 0}">
                        <tr>
                            <td>Tax (${bill.taxPercentage}%):</td>
                            <td>+ <fmt:formatNumber value="${bill.taxAmount}" pattern="#,##0.00"/></td>
                        </tr>
                    </c:if>
                    <tr class="total-row">
                        <td><strong>Total Amount:</strong></td>
                        <td><strong>LKR <fmt:formatNumber value="${bill.totalAmount}" pattern="#,##0.00"/></strong></td>
                    </tr>
                </table>
            </div>
        </div>
        
        <!-- Footer -->
        <div class="bill-footer">
            <div class="thank-you">
                <p>Thank you for your business!</p>
            </div>
            <div class="signature-section">
                <div class="signature">
                    <p>_____________________</p>
                    <p>Authorized Signature</p>
                </div>
                <div class="signature">
                    <p>_____________________</p>
                    <p>Customer Signature</p>
                </div>
            </div>
            <div class="footer-info">
                <p>This is a computer generated invoice.</p>
                <p>Printed on: ${currentDate}</p>
            </div>
        </div>
    </div>
    
    <!-- Print Button (won't show when printing) -->
    <div class="no-print print-actions">
        <button onclick="window.print();" class="btn-print">Print Bill</button>
        <button onclick="window.close();" class="btn-close">Close</button>
        <a href="${pageContext.request.contextPath}/bill/view/${bill.billId}" class="btn-back">Back to Bill</a>
    </div>
    
    <script>
        // Auto-print on load (optional)
        // window.onload = function() { window.print(); }
    </script>
</body>
</html>
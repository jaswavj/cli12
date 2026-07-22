<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.*" %>
<jsp:useBean id="bill" class="billing.billingBean" />
<%
    request.setCharacterEncoding("UTF-8");
    JSONObject result = new JSONObject();
    result.put("exchangePoint", 0);

    try {
        String customerIdStr = request.getParameter("customerId");
        if (customerIdStr != null && !customerIdStr.trim().isEmpty()) {
            int customerId = Integer.parseInt(customerIdStr);
            if (customerId > 0) {
                result.put("exchangePoint", bill.getCustomerExchangePoint(customerId));
            }
        }
    } catch (Exception e) {
        result.put("error", e.getMessage());
    }

    out.print(result.toString());
%>

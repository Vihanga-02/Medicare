<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Customers" %>
<%
    Customers customer = (Customers) session.getAttribute("customer");
    boolean isLoggedIn = customer != null;
%>

<?xml version="1.0" encoding="ISO-8859-1"?>
<html xmlns="http://www.w3.org/TR/xhtml1/strict">
    <%@ page language="java"
        import="java.sql.Connection,
                java.sql.ResultSet,
                com.dinhgiang.utils.DBResults"
        errorPage="error.jsp" %>
    <%--
        @author     : Dinh Le Giang
        @date       : August 15, 2003
        @description: display a table to prepare for modifing
        a staff. Data get from table 'NhanVien' in database
        'CongViec'
     --%>
    <head>
        <title>Staff is modifing</title>
        <link rel="stylesheet" href="../xslt/jobStyle.css" type="text/css" />
    </head>
    <body bgcolor="#FFFFFF" text="#000099">
<%
    Connection conPool = (Connection) session.getAttribute("conJobPool");
    if (conPool != null) {

        String id = request.getParameter("staffid");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String groupid = request.getParameter("group");


        String sql = "update nhanvien set tennv='"
                   + name + "',diachi='" + address + "',phone='"
                   + phone + "', magroup="+ groupid + " where manv='" + id + "'";

        /* Showing a error page If it isn't sucessfull */
        int rowAffected = DBResults.executeUpdate(conPool, sql);
    }
%>
        <h3><font face="VNI-Times" color="#AA0000">Th��c hie�n tha�nh co�ng</font></h3>
        <font face="VNI-Times" size="-1">D�� lie�u �a� ����c thay �o�i trong c� s�� d�� kie�u.</font>
	  <hr />
        <%@ include file="../html/footerStaff.html" %>
    </body>
</html>
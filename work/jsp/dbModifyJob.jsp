<?xml version="1.0" encoding="ISO-8859-1"?>
<html xmlns="http://www.w3.org/TR/xhtml1/strict">
    <%@ page language="java"
        import="java.sql.Connection,
                java.sql.ResultSet,
                com.dinhgiang.utils.DBResults"
        errorPage="error.jsp" %>
    <%--
        @author     : Dinh Le Giang
        @date       : August 29, 2003
        @description: display a table to prepare for modifing
        a Job. Data get from table 'Job' in database
        'CongViec'
     --%>
    <head>
        <title>Job is modifing</title>
        <link rel="stylesheet" href="../xslt/jobStyle.css" type="text/css" />
    </head>
    <body bgcolor="#FFFFFF" text="#000099">
<%
    Connection conPool = (Connection) session.getAttribute("conJobPool");
    if (conPool != null) {

        String id = request.getParameter("jobid");
        String name = request.getParameter("name");
        String project = request.getParameter("project");
        String content = request.getParameter("content");
        String finish = request.getParameter("finish");

        finish = (finish==null) ? "0" : "1";
        String sql = "update works set tencv='"
                   + name + "',mada=" + project + ",noidung='"
                   + content + "', daxong="+ finish + " where macv=" + id;

        /* Showing a error page If it isn't sucessfull */
        int rowAffected = DBResults.executeUpdate(conPool, sql);
    }
%>
        <h3><font face="VNI-Times" color="#AA0000">Th��c hie�n tha�nh co�ng</font></h3>
        <font face="VNI-Times" size="-1">D�� lie�u �a� ����c thay �o�i trong c� s�� d�� kie�u.</font>
	  <hr />
        <%@ include file="../html/footerJob.html" %>
    </body>
</html>
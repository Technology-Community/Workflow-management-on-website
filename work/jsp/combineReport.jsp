<?xml version="1.0" encoding="ISO-8859-1"?>
<html xmlns="http://www.w3.org/TR/xhtml1/strict">
    <%@ page language="java"
             import="com.dinhgiang.beans.UserBean,
                     com.dinhgiang.utils.DBResults,
                     java.util.GregorianCalendar,
                     java.sql.Connection,
                     java.sql.ResultSet"
             errorPage="error.jsp" %>
    <%--
        @author     : Dinh Le Giang
        @date       : August 17, 2003
        @description: See Assigned Work.
     --%>
    <head>
        <title>Combine Report</title>
        <link rel="stylesheet" href="../xslt/jobStyle.css" type="text/css" />
        <script language="javascript" src="../xslt/jobScript.js"></script>
    </head>
    <body bgcolor="#FFFFFF" text="#000099">
<%
    Connection conPool = (Connection) session.getAttribute("conJobPool");
    if (conPool != null) {

        String work = request.getParameter("work");
        String sql = "select tencv, count(baocaongay.ngay) as songay, (100 - sum(tiendo)) as tondong "
                   + "from works, baocaongay "
                   + "where works.macv=baocaongay.macv and works.macv=" + work + " "
                   + "group by tencv";

        ResultSet rs = DBResults.executeQuery(conPool, sql);
        if (rs.next()) {
            GregorianCalendar calendar = new GregorianCalendar();
            int date = calendar.get(GregorianCalendar.DATE);
            int month = calendar.get(GregorianCalendar.MONTH) + 1;
            int year = calendar.get(GregorianCalendar.YEAR);
            String fullday = "" + year + "-" + month + "-" + date;
%>
        <form action="../servlet/CombineReport" enctype="multipart/form-data" method="POST">
            <h3 align="center"><font face="VNI-Times, VNI-Helve" color="#AA0000">To�ng H��p Ba�o Ca�o</font></h3>

            <b><font face="VNI-Times, VNI-Helve">Ma� ba�o ca�o&nbsp;</font></b>
            <input type="text" name="mabcth" value="00000" size="5" />

            <b><font face="VNI-Times, VNI-Helve">&nbsp;&nbsp;&nbsp;Nga�y&nbsp;</font></b>
            <input type="text" name="ngay" value="<%= fullday %>"  size="10" />
            <br />

            <b><font face="VNI-Times, VNI-Helve">Co�ng vie�c</font></b>
            <input type="hidden" name="macv" value="<%= work %>" />
            <input type="text" name="workName" value="<%= rs.getString(1) %>" size="35" disabled />

            <b><font face="VNI-Times, VNI-Helve">th��c hie�n trong </font></b>
            <input type="text" name="dateNum" value="<%= rs.getString(2) %>" size="2" disabled /> <b><font face="VNI-Times, VNI-Helve">nga�y,</font></b>
            <br />

            <b><font face="VNI-Times, VNI-Helve">co�n to�n �o�ng </font></b>
            <input type="text" name="tondong" value="<%= rs.getString(3) %>" size="3" /> <b><font face="VNI-Times, VNI-Helve">pha�n tra�m.</font></b>
            <br />

            <b><font face="VNI-Times, VNI-Helve">Co�ng vie�c t��ng lai&nbsp;</font></b>
            <input type="text" name="cvtuonglai" size="35" />
            <br />

            <b><font face="VNI-Times, VNI-Helve">�e� xua�t</font></b>
            <input type="text" name="dexuat" size="43" />
            <br />

            <b><font face="VNI-Times, VNI-Helve">Ke�m ta�p tin</font></b>
            <input type="file" name="filename" size="37" />
		<!-- name="subOK" disabled onchange="testUploadFile(filename, subOK)" -->
            <p align="center">
                <input type="submit" value="  OK   " />
                <input type="button" value="Back" onclick="history.back()" />
            </p>
        </form>
<%
        }
        else {
%>
        <h3 align="center"><font face="VNI-Times, VNI-Helve" color="#AA0000">Co�ng vie�c na�y ch�a co� ba�o ca�o tie�n �o�</font></h3>
        <p align="center">
            <input type="button" name="btnBack" value="Back" onclick="history.back()" />
        </p>
<%
        }
    }
%>
    </body>
</html>
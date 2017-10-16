<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: fake_fan
  Date: 2017/9/21
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
import java.sql.*;
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lumino - Dashboard</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <!--Custom Font-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span></button>
            <a class="navbar-brand" href="#"><span>Library</span>Admin</a>
        </div>
    </div><!-- /.container-fluid -->
</nav>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <div class="profile-sidebar">
        <div class="profile-userpic">
            <img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
        </div>
        <div class="profile-usertitle">
            <div class="profile-usertitle-name">Admin</div>
            <div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="divider"></div>
    <ul class="nav menu">
        <li><a href="MainPage.jsp"><em class="fa fa-dashboard">&nbsp;</em> 主页</a></li>
        <li class="active"><a><em class="fa fa-calendar">&nbsp;</em> 作者查询</a></li>
        <li><a href="insert.jsp"><em class="fa fa-calendar">&nbsp;</em> 添加新书籍</a></li>
        <li><a href="insert_author.jsp"><em class="fa fa-calendar">&nbsp;</em> 添加新作者</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                <em class="fa fa-home"></em>
            </a></li>
            <li class="active">查询结果</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">查询结果</h1>
        </div>
    </div><!--/.row-->
    <div>
        <h3><s:property value="name"/></h3>
    </div>
    <div class="row">
        <table border="1" align="center">
            <tr>
                <td align="center" width="225">ISBN</td>
                <td align="center" width="225">Title</td>
                <td align="center" width="150">Author</td>
                <td align="center" width="225">Publisher</td>
                <td align="center" width="225">PublishDate</td>
                <td align="center" width="137">Price</td>
                <td align="center" width="105">更改</td>
                <td align="center" width="105">删除</td>
            </tr>
            <s:iterator value="result" var = "var">
            <tr>
                <td width=16% align="center"><s:property value="#var.key"/></td>
                <td width=16% align="center">
                    <a href="detail.action?detailISBN=<s:property value="#var.key"/>"><s:property value="#var.value[0]"/></a>
                </td>
                <td width=8% align="center"><s:property value="name"/></td>
                <td width=14% align="center"><s:property value="#var.value[2]"/></td>
                <td width=16% align="center"><s:property value="#var.value[3]"/></td>
                <td width=10% align="center"><s:property value="#var.value[4]"/></td>
                <td width=10% algin="center" onclick="return modifyStu()">
                    <a href="change.action?changeISBN=<s:property value="#var.key"/>">信息更新</a>
                </td>
                <td width=10% algin="center" onclick="return deleteStu()">
                    <a href="del.action?delISBN=<s:property value="#var.key"/>">删除</a>
                </td>
            </tr>
            </s:iterator>
        </table>
    </div><!--/.row-->

</div>	<!--/.main-->

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/chart-data.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/easypiechart-data.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/custom.js"></script>
<script>
    window.onload = function () {
        var chart1 = document.getElementById("line-chart").getContext("2d");
        window.myLine = new Chart(chart1).Line(lineChartData, {
            responsive: true,
            scaleLineColor: "rgba(0,0,0,.2)",
            scaleGridLineColor: "rgba(0,0,0,.05)",
            scaleFontColor: "#c5c7cc"
        });
    };
</script>

</body>
</html>

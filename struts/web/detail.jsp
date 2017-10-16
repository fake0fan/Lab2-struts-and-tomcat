<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <link href="css/datepicker.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <!--Custom Font-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="css/bootstrap.min.js"></script>
    <script src="css/bootstrap-datepicker.js"></script>
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
        <li><a href="authorquery.jsp"><em class="fa fa-calendar">&nbsp;</em> 作者查询</a></li>
        <li class="active"><a><em class="fa fa-calendar">&nbsp;</em> 书籍详细信息</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                <em class="fa fa-home"></em>
            </a></li>
            <li class="active">书籍详细信息</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">书籍详细信息</h1>
        </div>
    </div><!--/.row-->
    <s:iterator value="result" var = "var">
    <div class="panel panel-default">
        <div class="panel-heading">
        </div>
        <div class="panel-body">
            <form class="form-horizontal" action="change_submit">
                <!-- Name input-->
                <div class="form-group">
                    <label class="col-md-3 control-label" for="ISBN">ISBN</label>
                    <div class="col-md-9">
                        <input id="ISBN" name="ISBN" type="text"  value=<s:property value="#var.key"/> disabled="disabled" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="title">Title</label>
                    <div class="col-md-9">
                        <input id="title" name="Title" type="text" value="<s:property value="#var.value[0]"/>" disabled="disabled" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="price">Price</label>
                    <div class="col-md-9">
                        <input id="price" name="Price" type="number" value=<s:property value="#var.value[4]"/> disabled="disabled" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="publisher">Publisher</label>
                    <div class="col-md-9">
                        <input id="publisher" name="Publisher" type="text" value="<s:property value="#var.value[2]"/>"  disabled="disabled" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="publishdate">PublishDate</label>
                    <div class="col-md-9">
                        <input data-date-format="yyyy-mm-dd" data-provide="datepicker" id="publishdate" disabled="disabled" name="PublishDate" type="date" value="<s:property value="#var.value[3]"/>" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="AuthorID">AuthorID</label>
                    <div class="col-md-9">
                        <input id="AuthorID" name="AuthorID" type="text" value="<s:property value="#var.value[5]"/>" disabled="disabled" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="Author">Author</label>
                    <div class="col-md-9">
                        <input id="Author" name="Author" type="text" value="<s:property value="#var.value[6]"/>" disabled="disabled" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="Age">Age</label>
                    <div class="col-md-9">
                        <input id="Age" name="Age" type="text" value="<s:property value="#var.value[7]"/>" disabled="disabled" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="Country">Country</label>
                    <div class="col-md-9">
                        <input id="Country" name="Country" type="text" value="<s:property value="#var.value[8]"/>" disabled="disabled" class="form-control">
                    </div>
                </div>

                <!-- Form actions -->
                </fieldset>
            </form>
        </div>
    </div>
    </s:iterator>>
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

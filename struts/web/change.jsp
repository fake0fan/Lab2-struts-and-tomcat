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
        <li class="active"><a><em class="fa fa-calendar">&nbsp;</em> 更新书籍信息</a></li>
        <li><a href="insert_author.jsp"><em class="fa fa-calendar">&nbsp;</em> 添加新作者</a></li>

    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                <em class="fa fa-home"></em>
            </a></li>
            <li class="active">更新书籍信息</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">更新书籍信息</h1>
        </div>
    </div><!--/.row-->
    <%
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url ="jdbc:mysql://localhost:3306/bookdb?useUnicode=true&characterEncoding=UTF-8";
            Connection con = DriverManager.getConnection(url,"root","");
            Statement stmt = con.createStatement();
            String sql = "select b.*, a.Name from book b,author a where b.AuthorID=a.AuthorID and b.ISBN=" + request.getParameter("changeISBN");
            System.out.println(sql);
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                System.out.println(rs.getObject(4));
    %>
    <div class="panel panel-default">
        <div class="panel-heading">
        </div>
        <div class="panel-body">
            <form class="form-horizontal" action="change_submit">
                <!-- Name input-->
                <div class="form-group">
                    <label class="col-md-3 control-label" for="ISBN">ISBN</label>
                    <div class="col-md-9">
                        <input id="ISBN" name="ISBN" type="text"  value=<%=rs.getObject(1)%> readonly="readonly" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="title">Title</label>
                    <div class="col-md-9">
                        <input id="title" name="Title" type="text" value=<%=rs.getObject(2)%> readonly="readonly" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="Author">Author</label>
                    <div class="col-md-9">
                        <input id="Author" name="Author" type="text" value="<%=rs.getObject(7)%>" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="price">Price</label>
                    <div class="col-md-9">
                        <input id="price" name="Price" type="text" onkeyup="value=value.replace(/[^\d.]/g,'')"  value=<%=rs.getObject(6)%> class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="publisher">Publisher</label>
                    <div class="col-md-9">
                        <input id="publisher" name="Publisher" type="text" value="<%=rs.getObject(4)%>" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="publishdate">PublishDate</label>
                    <div class="col-md-9">
                        <input data-date-format="yyyy-mm-dd" data-provide="datepicker" id="publishdate" name="PublishDate" type="date" value=<%=rs.getObject(5)%> class="form-control">
                    </div>
                </div>

                <!-- Form actions -->
                <div class="form-group">
                    <div class="col-md-12 widget-right">
                        <button type="submit" class="btn btn-default btn-md pull-right">Submit</button>
                    </div>
                </div>
                </fieldset>
            </form>
        </div>
    </div>
    <%
            }
            rs.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }

    %>
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

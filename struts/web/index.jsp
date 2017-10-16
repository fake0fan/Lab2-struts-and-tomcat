<%--
  Created by IntelliJ IDEA.
  User: fake_fan
  Date: 2017/9/21
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Lumino - Login</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/datepicker3.css" rel="stylesheet">
  <link href="css/styles.css" rel="stylesheet">
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>
<body>
<div class="row">
  <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
    <div class="login-panel panel panel-default">
      <div class="panel-heading">Log in</div>
      <div class="panel-body">
        <%--<div>--%>
          <%--<h3>--%>
            <%--<h1>Hello World From Struts2</h1>--%>
            <%--<form action="hello">--%>
              <%--<label for="name"> Please enter your name </label><br/>--%>
              <%--<input type="text" name="name"/>--%>
              <%--<input type="submit" value="Say Hello"/>--%>
            <%--</form>--%>
          <%--</h3>--%>
        <%--</div>--%>
        <form action= "hello">
            <div class="form-group">
              <input class="form-control" placeholder="E-mail" name="email" type="text" autofocus="">
            </div>
            <div class="form-group">
              <input class="form-control" placeholder="Password" name="password" type="password" value="">
            </div>
            <input class="btn btn-primary" type="submit", value="Login">
        </form>
      </div>
    </div>
  </div><!-- /.col-->
</div><!-- /.row -->


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
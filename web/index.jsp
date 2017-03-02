<%--
  Created by IntelliJ IDEA.
  User: NyBruger
  Date: 22-10-2016
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tech. 1</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<div class="container">
    <H1 class="text-center">My First Web App</H1>

    <div class="wrapper">
        <form class="form-signin" method="POST" action="Fredlet">
            <h2 class="form-signin-heading">Please login</h2>
            <div class="form-group">
                    <%
        if (null != request.getAttribute("errorMessage") && request.getAttribute("errorMessage").equals("true")) {
    %>
                <div class="alert alert-danger fade in">
                    <a href="#" class="close" data-dismiss="alert">&times;</a>
                    <strong>Error! </strong>Login failed, wrong username or password.
                </div>
                    <% }
    %>
                <input type="text" class="form-control" name="username" placeholder="Email Address" required=""
                       autofocus=""/>
                <input type="password" class="form-control" name="password" placeholder="Password" required=""/>
                <label class="checkbox">
                    <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Remember me
                </label>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
        </form>
    </div>
</div>
</body>
</html>

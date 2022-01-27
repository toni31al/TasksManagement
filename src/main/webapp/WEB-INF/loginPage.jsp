<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>
<body>
<!-- create navigation bar ( header) -->
<nav class="navbar navbar-inverse navbar-fixed-top bg-dark">
    <div class="container">
        <h2 class="text-light"> Project Tasks Management</h2>
    </div>
</nav>
<br>
<div class = "container">
    <div class = "row">
        <div class = "col-md-6 col-md-offset-3">
            <h1> Sign-in </h1>
            <p><c:out value="${error}" /></p>
            <form method="post" action="/login">
                <div class = "form-group">
                    <label type="email" for="email">Email</label>
                    <input type="text" class = "form-control" id="email" name="email" placeholder="Enter Email ID" autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control"
                           placeholder="Enter Password"/>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3">
                            <input type="submit" name="login-submit" id="login-submit"
                                   class="form-control btn btn-primary" value="Log In" />
                        </div>
                    </div>
                </div>
            </form>
            <div class="form-group">
                New user? <a href="/registration" >Register here</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
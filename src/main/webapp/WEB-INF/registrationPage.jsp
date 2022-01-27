<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Registration Page</title>
</head>
<body>
<!-- create navigation bar ( header) -->
<nav class="navbar navbar-inverse navbar-fixed-top bg-dark">
    <div class="container">
        <h2 class="text-light"> Project Tasks Management</h2>
    </div>
</nav>
<br>

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
<%--            <p><form:errors path="user.*"/></p>--%>
            <%--@elvariable id="user" type=""--%>
            <form:form action="/registration" method="post" modelAttribute="user">
                <h2>Register</h2>
                <div class="form-group">
                    <form:label path="firstName">First Name</form:label>
                    <form:errors path="firstName"/>
                    <form:input class="form-control" path="firstName" placeholder="Enter First Name" autofocus="autofocus" />
                </div>
                <div class="form-group">
                    <form:label path="lastName">Last Name</form:label>
                    <form:errors path="lastName"/>
                    <form:input class="form-control" path="lastName" placeholder="Enter Last Name" autofocus="autofocus" />
                </div>
                <div class="form-group">
                    <form:label path="email">Email</form:label>
                    <form:errors path="email"/>
                    <form:input type="email" class="form-control" path="email" placeholder="Enter Email" autofocus="autofocus"/>
                </div>
                <div class="form-group">
                    <form:label path="password">Password</form:label>
                    <form:errors path="password"/>
                    <form:password class="form-control" path="password" placeholder="Enter Password" autofocus="autofocus" />
                </div>
                <div class="form-group">
                    <form:label path="passwordConfirmation">Confirm Password</form:label>
                    <form:errors path="passwordConfirmation"/>
                    <form:password class="form-control" path="passwordConfirmation" placeholder="Re-Enter Password" autofocus="autofocus" />
                </div>
                <input class = "form-control btn btn-primary" type="submit" value="Register">
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
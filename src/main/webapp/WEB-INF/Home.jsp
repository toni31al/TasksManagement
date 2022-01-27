<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <style>
        .bcg-image {
            display: block;
            margin-left: auto;
            margin-right: auto;
            height: 300px;
        }
    </style>
    <title>Home</title>
</head>
<body>
<!-- create navigation bar ( header) -->
<nav role="navigation" class="navbar navbar-light" style="background-color: #9FE0C7;">
     <div class="navbar-collapse">
        <ul class="nav navbar-nav">
            <li><a href="/tasks">Tasks</a></li>
            <li><a href="/projects">Projects</a></li>
            <li><a href="/mytasks">My tasks</a></li>
            <li><a href="/logout">Logout</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li>Welcome, <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></li>
        </ul>
    </div>
</nav>
<!-- End navigation bar ( header) -->

<div class="container-fluid">

     <div class="jumbotron text-center ">

         <div>

             <h1>Welcome</h1>

             <h3>This is welcome page of Project Tasks Management</h3>

         </div>

    </div>

</div>
<div styele style="background-color: #F5FCF7;">
    <img class ="bcg-image" src="/static/img/background.png">
</div>

</body>
</html>
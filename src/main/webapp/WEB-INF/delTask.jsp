<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <title>Delete Task</title>
</head>
<body>
<!-- create navigation bar ( header) -->
<nav role="navigation" class="navbar navbar-light" style="background-color: #D1F1D9;">
    <div class="">
        <a href="/home" class="navbar-brand">Project Tasks Management</a>
    </div>
    <div class="navbar-collapse">
        <ul class="nav navbar-nav">
            <li class="active"><a href="/home">Home</a></li>
            <li><a href="/tasks">Tasks</a></li>
            <li><a href="/logout">Logout</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li>Welcome, <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></li>
        </ul>
    </div>
</nav>
<!-- End navigation bar ( header) -->

<main class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3 ">
            <div class="panel panel-primary">
                <div class="panel-heading">Delete Task</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="form-control-label ">Task Name</label>
                        <input type="text" value="<c:out value="${task.name}"/>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label ">Description</label>
                        <input type="text" value="<c:out value="${task.description}"/>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label ">Target Date</label>
                        <input type="date" value="<c:out value="${task.targetDate}"/>" class="form-control" readonly>
                    </div>
                      <div class="form-group">
                        <label class="form-control-label " id="inputGroup-sizing-default">Project Name</label>
                        <input type="text" value="<c:out value="${task.project.projectName}"/>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <a href="/tasks" class="btn btn-outline-primary pull-right ml-3">Cancel</a>
                        <form action="/delete/${task.id}" method="POST">
                        <input type = "submit" value = "Delete" class="btn btn-outline-primary pull-right ml-3">
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>


</main>
</body>
</html>
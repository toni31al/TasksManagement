<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <title>Create Task</title>
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

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3 ">
            <div class="panel panel-primary">
                <div class="panel-heading">Create new Task</div>
                    <div class="panel-body">
                        <form:form action="/task/create" method="post" modelAttribute="newTask">
                            <fieldset class="form-group">
                                <form:label path="name" class="form-control-label">Task Name</form:label>
                                <form:errors class="text-danger" path="name"/>
                                <form:input class="form-control" path="name" placeholder="Enter Task Name"
                                            autofocus="autofocus"/>
                            </fieldset>
                            <fieldset class="form-group">
                                <form:label path="description" class="form-control-label">Task Description</form:label>
                                <form:errors class="text-danger" path="description"/>
                                <form:textarea class="form-control" path="description" placeholder="Enter Task Description"
                                               autofocus="autofocus"/>
                            </fieldset>
                            <fieldset class="form-group">
                                <form:label path="targetDate" class="form-control-label">Target Date</form:label>
                                <form:errors class="text-danger" path="targetDate"/>
                                <form:input class="form-control" path="targetDate" type="date" value="${ now }"
                                            placeholder="Enter Target Date" autofocus="autofocus"/>
                            </fieldset>
                            <fieldset class="form-group">
                                <form:input type="hidden" value="${userId}" path="taskCreator"/>
                                <form:input type="hidden" value="New" path="status"/>
                                <input type="submit" class="form-control btn btn-primary" value="Create">
                            </fieldset>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
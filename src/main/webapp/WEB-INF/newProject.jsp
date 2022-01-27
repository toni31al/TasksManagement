<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <title>Create Project</title>
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
                <div class="panel-heading">Create new Project</div>
                <fieldset class="panel-body">

                <form:form action="/project/create" method="post" modelAttribute="newProject">
                <fieldset class="form-group">
                    <form:label path="projectName">Project Name</form:label>
                    <form:errors class="text-danger" path="projectName"/>
                    <form:input class="form-control" path="projectName" placeholder="Enter Project Name"
                                autofocus="autofocus"/>
                </fieldset>
                <fieldset class="form-group">
                    <form:label path="description">Description</form:label>
                    <form:errors class="text-danger" path="description"/>
                    <form:textarea class="form-control" path="description" placeholder="Enter description"
                                   autofocus="autofocus"/>
                </fieldset>
                <fieldset class="form-group">
                    <form:label path="startDate">Start Date</form:label>
                    <form:errors class="text-danger" path="startDate"/>
                    <form:input class="form-control" path="startDate" type="date" value="${ now }"
                                placeholder="Enter Start Date" autofocus="autofocus"/>
                </fieldset>
                <fieldset class="form-group">
                    <form:label path="endDate">Start Date</form:label>
                    <form:errors class="text-danger" path="endDate"/>
                    <form:input class="form-control" path="endDate" type="date" value="${ now }"
                                placeholder="Enter End Date" autofocus="autofocus"/>
                </fieldset>
                <fieldset class="form-group">
                    <form:input type="hidden" value="${userId}" path="creator"/>
                    <input type="submit" class="btn btn-success" value="Create">
                </fieldset>
            </form:form>

        </div>
    </div>
    </div>
</div>
</body>
</html>
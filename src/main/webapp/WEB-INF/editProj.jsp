<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <title>Edit Task</title>
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
            <li><a href="/projects">Projects</a></li>
            <li><a href="/projects">Tasks</a></li>
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
                <div class="panel-heading">Edit Project</div>
                <div class="panel-body">
                    <form:form action ="/project/${project.id}" method ="POST" modelAttribute="project" >
                        <input type="hidden" name="_method" value="PUT">
                        <div class="form-group">
                            <form:label path="projectName" class="form-control-label">Project Name</form:label>
                            <form:errors class="text-danger" path="projectName"/>
                            <form:input class="form-control" path="projectName" autofocus="autofocus"/>
                        </div>
                        <div class="form-group">
                            <form:label path="description" class="form-control-label">Project Description</form:label>
                            <form:errors class="text-danger" path="description"/>
                            <form:textarea class="form-control" path="description" placeholder="Edit Project Description"
                            autofocus="autofocus"/>
                        </div>
                        <div class="form-group">
                            <form:label path="startDate" class="form-control-label">Start Date</form:label>
                            <form:errors class="text-danger" path="startDate"/>
                            <form:input class="form-control" path="startDate" type="date"
                            placeholder="Edit Start Date" autofocus="autofocus"/>
                        </div>
                        <div class="form-group">
                            <form:label path="endDate" class="form-control-label">End Date</form:label>
                            <form:errors class="text-danger" path="endDate"/>
                            <form:input class="form-control" path="endDate" type="date"
                            placeholder="Edit End Date" autofocus="autofocus"/>
                        </div>
                            <form:input type ="hidden" path="creator.id"/>
                        <div class="form-group">
                            <input type = "submit" value = "Submit" class="btn btn-success">
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
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
            <li><a href="/tasks">Tasks</a></li>
            <li><a href="/tasks/users">Assign Task</a></li>
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
                <div class="panel-heading">Edit Task</div>
                <div class="panel-body">
        <form:form action ="/task/${task.id}" method ="POST" modelAttribute="task" >
<%--            <input type="hidden" name="_method" value="PUT">--%>
            <div class="form-group">
                <form:label path="name" class="form-control-label">Task Name</form:label>
                <form:errors class="text-danger" path="name"/>
                <form:input class="form-control" path="name" placeholder="Edit Task Name"
                            autofocus="autofocus"/>
            </div>

            <div class="form-group">
                <form:label path="description" class="form-control-label">Task Description</form:label>
                <form:errors class="text-danger" path="description"/>
                <form:textarea class="form-control" path="description" placeholder="Edit Task Description"
                            autofocus="autofocus"/>
            </div>
            <div class="form-group">
                <form:label path="targetDate" class="form-control-label">Target Date</form:label>
                <form:errors class="text-danger" path="targetDate"/>
                <form:input class="form-control" path="targetDate" type="date"
                            placeholder="Edit Target Date" autofocus="autofocus"/>
            </div>
            <form:hidden path="status" value ="${task.status}"/>
             <%--   <form:hidden path="project" value ="${task.project}"/>

                <form:hidden path="taskOwner" value ="${task.taskOwner}"/>
                <form:hidden path="taskCreator" value ="${task.taskCreator}"/>--%>

                <div class="form-group">
<%--                <input type="submit" class="btn btn-primary" value="Edit">--%>
                    <input type = "submit" value = "Submit" class="btn btn-success">
                </div>
        </form:form>
    </div>
</div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 col-md-offset-3 ">
            <div class="panel panel-primary">
                <div class="panel-heading">Assign Project</div>
                <div class="panel-body">
                    <div class="form-group">
                            <label class="form-control-label " id="inputGroup-sizing-default">Project Name</label>
                            <input type="text" value="<c:out value="${task.project.projectName}"/>" class="form-control" readonly>
                        </div>


                    <%--                    Insert project--%>
                    <div class="form-group col-md-4">
                         <form method="post" action="/addTaskToProj/${task.id}">
                             <div class="form-group">
                            <select name="project" class="form-control"  id="inputGroupSelect01" >
                                <c:forEach items="${proj}" var="project">
                                    <option class="form-control" value="${project.id}">${project.projectName}</option>
                                </c:forEach>
                            </select>
                             </div>
                            <div class="form-group">
                                <input type = "submit" value = "Assign project" class="btn btn-success">
                            </div>
                         </form>
                    </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
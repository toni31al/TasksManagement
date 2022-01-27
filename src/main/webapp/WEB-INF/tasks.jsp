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
            <li><a href="/task/create">Create Task</a></li>
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
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3>List of Task</h3>
        </div>
        <c:choose>
            <c:when test="${notCompleted}">
                <a href="/tasks" class="btn btn-outline-info btn-lg float-right">Show Completed Tasks</a>
            </c:when>
            <c:otherwise>
                <a href="/tasks/notCompleted" class="btn btn-outline-info btn-lg float-right">Hide Completed Tasks</a>
            </c:otherwise>
        </c:choose>
        <div class="panel-body">
        <table class="my-tab table table-hover text-center"
               style="table-layout: fixed; width: 100%;">
            <thead class="table-primary">
                <tr>
                    <th style="width:24%" class="text-left">Task name</th>
                    <th style="width:12%">Date</th>
                    <th style="width:10%" class="d-none d-lg-table-cell">Days left</th>
                    <th style="width:10%">Status</th>
                    <th style="width:14%" class="d-none d-lg-table-cell">Task owner</th>
                    <th style="width:14%" class="d-none d-lg-table-cell">Task creator</th>
                    <th style="width:16%" class="d-none d-lg-table-cell" colspan="2">Actions</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${tasks}" var = "task">
                <tr>
                    <td class="text-left"><c:out value="${task.name}"/> - <c:out value="${task.project.projectName}"/></td>
                    <td class="text-left">
                        <fmt:parseDate value="${task.targetDate}" pattern="yyyy-MM-dd" var="stDate" type="date" />
                        <fmt:formatDate value="${stDate}" pattern="MM-dd-yyyy" var="newstDate" /> <c:out value="${newstDate}" />
                    </td>
                    <td class="text-center col-1 d-none d-lg-table-cell"><c:out value="${task.daysLeftUntilDeadline(task.targetDate)}"/> </td>
                    <td class="text-left"><c:out value="${task.status}"/></td>
                    <td class="d-none d-lg-table-cell"><c:out value="${task.taskOwner.email}"/></td>
                    <td class="d-none d-lg-table-cell" ><c:out value="${task.taskCreator.email}"/></td>
                    <c:if test="${task.taskCreator.id == user.id}">
                        <td><a href="/task/${task.id}"> Update</a></td>
                            <td><a href="/delete/task/${task.id}">Delete</a></td>
                    </c:if>
                    <c:if test="${task.taskCreator.id != user.id}">
                        <td></td>
                        <td></td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    </div>
</main>
</body>
</html>
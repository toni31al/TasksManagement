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
            <li><a href="/project/new">Create Project</a></li>
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
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3>List of Projects</h3>
        </div>
        <div class="panel-body">
            <table class="my-tab table table-hover text-center"
                   style="table-layout: fixed; width: 100%;">
                <thead class="table-primary">
                <tr>
                    <th style="width:22%" class="text-left">Project name</th>
                    <th style="width:34%" class="text-left">Description</th>
                    <th style="width:8%" class="d-none d-lg-table-cell">Start Date</th>
                    <th style="width:8%" class="d-none d-lg-table-cell">End Date</th>
                    <th style="width:12%" class="text-left">Owner</th>
                    <th style="width:16%" class="d-none d-lg-table-cell" colspan="2">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${projects}" var = "project">
            <tr>
                <td class="text-left"><c:out value="${project.projectName}"/></td>
                <td class="text-left"><c:out value="${project.description}"/></td>
                <td class="d-none d-lg-table-cell"><fmt:formatDate value="${project.startDate}" pattern="MM-dd-yyyy" var="stDate" /> <c:out value="${stDate}" /></td>
                <td class="d-none d-lg-table-cell"><fmt:formatDate value="${project.endDate}" pattern="MM-dd-yyyy" var="enDate" /> <c:out value="${enDate}" /></td>
                <td class="text-left"><c:out value="${project.creator.firstName}"/> <c:out value="${project.creator.lastName}"/></td>
                <c:if test="${project.creator.id == user.id}">
                    <td><a href="/project/${project.id}"> Update</a></td>
                       <td> <a href="/delete/proj/${project.id}">Delete</a></td>
                      <%--<form action="/delete/${ idea.id }" method="POST">
                        <input type="hidden" name="_method" value="delete" />
                        <input type="submit" value="delete" />
                    </form>--%>
                </c:if>
                <c:if test="${project.creator.id != user.id}">
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
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
            <li><a href="/mytasks">My tasks</a></li>
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
                <div class="panel-heading">Select User</div>
                    <div class="panel-body">
                            <div class="form-group">
                                <form method="get" action="/tasks/seluser">
                                   <select name="selectedUser" class="form-control"  id="inputGroupSelect01" onchange="this.form.submit()">
                                       <option value="">-- SELECT ONE --</option>
                                       <c:forEach items="${users}" var="currentuser">
                                            <option class="form-control" value="${currentuser.id}">${currentuser.firstName}  ${currentuser.lastName}</option>
                                        </c:forEach>
                                    </select>
<%--                                    <input type = "submit" value = "Select" />--%>
                                </form>
                            </div>
                    </div>
            </div>
        </div>
    </div>

    <div class ="form-group">
         <h3>
             <c:choose>
                 <c:when test="${selectedUser == null}">
                     No user is selected.
                 </c:when>
                 <c:otherwise>
                     <c:out value="${selectedUser.firstName}"/> <c:out value="${selectedUser.lastName}"/> is selected.
                 </c:otherwise>
             </c:choose>
        </h3>
    </div>

    <div class="row">
        <%-- List i task te pa assigned  --%>
        <div class="col-sm-6 col-12">
            <div class="panel panel-primary">
                <div class="panel-heading">Free tasks</div>
                <c:if test="${selectedUser != null}">

                <div class="panel-body">
                    <table class = "table table-hover text-left">
                        <thead>
                        <tr>
                            <th>Task Name</th>
                            <th>Description</th>
                            <th>Project</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${freeTasks}" var = "task">
                            <tr>
                                <td><c:out value="${task.name}"/></td>
                                <td><c:out value="${task.description}"/></td>
                                <td><c:out value="${task.project.projectName}"/></td>
                                <c:if test="${task.taskOwner.id == null}">
                                    <td><a href="/task/assign/${task.id}/${selectedUser.id}"> Assign</a>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                </c:if>
            </div>
        </div>
            <%-- List i task te assigned tek useri  --%>
        <div class="col-sm-6 col-12">
            <div class="panel panel-primary">
                <div class="panel-heading">Tasks in progress</div>
                <c:if test="${selectedUser != null}">

                    <div class="panel-body">
                        <table class = "table table-hover text-left">
                            <thead>
                            <tr>
                                <th>Task Name</th>
                                <th>Description</th>
                                <th>Project</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${taskedAssigned}" var = "task">
                                <tr>
                                    <td><c:out value="${task.name}"/></td>
                                    <td><c:out value="${task.description}"/></td>
                                    <td><c:out value="${task.project.projectName}"/></td>
                                    <c:if test="${task.taskOwner != null}">
                                        <td><a href="/task/unassign/${task.id}">Unassign</a></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</main>
</body>
</html>
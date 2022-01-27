<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <title>My Tasks</title>
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
    <div class="panel panel-info">
        <div class="panel-heading">New</div>
        <div class="panel-body">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th style="width:15%" class="text-left">Project</th>
                    <th style="width:15%" class="text-left">Task name</th>
                    <th style="width:25%" class="text-left">Description</th>
                    <th style="width:12%">Target Date</th>
                    <th style="width:8%" class="d-none d-lg-table-cell">Days left</th>
                    <th style="width:10%">Status</th>
                    <th style="width:20%" class="d-none d-lg-table-cell">Update Status</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${newTasks}" var = "newtask">
                    <tr>
                        <td class="text-left"><c:out value="${newtask.project.projectName}"/></td>
                        <td class="text-left"><c:out value="${newtask.name}"/></td>
                        <td class="text-left"><c:out value="${newtask.description}"/></td>
                        <td class="text-left">
                            <fmt:parseDate value="${newtask.targetDate}" pattern="yyyy-MM-dd" var="trgDate" type="date" />
                            <fmt:formatDate value="${trgDate}" pattern="MM-dd-yyyy" var="newstDate" /> <c:out value="${newstDate}" />
                        </td>
                        <td class="text-center col-1 d-none d-lg-table-cell"><c:out value="${newtask.daysLeftUntilDeadline(newtask.targetDate)}"/> </td>
                        <td class="text-left"><c:out value="${newtask.status}"/></td>
                        <td>
                            <form method="get" action="/mytasksupd/${newtask.id}">
                                <select name="selectedStatus" class="form-control"  id="inputGroupSelect03" onchange="this.form.submit()">
                                    <option value=""></option>
                                    <option value="New">New</option>
                                    <option value="In Progress">In Progress</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Completed">Completed</option>
                                </select>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel panel-warning">
        <div class="panel-heading">In progress</div>
        <div class="panel-body">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th style="width:15%" class="text-left">Project</th>
                    <th style="width:15%" class="text-left">Task name</th>
                    <th style="width:25%" class="text-left">Description</th>
                    <th style="width:12%">Target Date</th>
                    <th style="width:8%" class="d-none d-lg-table-cell">Days left</th>
                    <th style="width:10%">Status</th>
                    <th style="width:20%" class="d-none d-lg-table-cell">Update Status</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${progTasks}" var = "progtask">
                    <tr>
                        <td class="text-left"><c:out value="${progtask.project.projectName}"/></td>
                        <td class="text-left"><c:out value="${progtask.name}"/></td>
                        <td class="text-left"><c:out value="${progtask.description}"/></td>
                        <td class="text-left">
                            <fmt:parseDate value="${progtask.targetDate}" pattern="yyyy-MM-dd" var="trgDate" type="date" />
                            <fmt:formatDate value="${trgDate}" pattern="MM-dd-yyyy" var="newstDate" /> <c:out value="${newstDate}" />
                        </td>
                        <td class="text-center col-1 d-none d-lg-table-cell"><c:out value="${progtask.daysLeftUntilDeadline(progtask.targetDate)}"/> </td>
                        <td class="text-left"><c:out value="${progtask.status}"/></td>
                        <td>
                            <form method="get" action="/mytasksupd/${progtask.id}">
                                <select name="selectedStatus" class="form-control"  id="inputGroupSelect02" onchange="this.form.submit()">
                                    <option value=""></option>
                                    <option value="New">New</option>
                                    <option value="In Progress">In Progress</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Completed">Completed</option>
                                </select>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel panel-danger">
        <div class="panel-heading">Pending </div>
        <div class="panel-body">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th style="width:15%" class="text-left">Project</th>
                    <th style="width:15%" class="text-left">Task name</th>
                    <th style="width:25%" class="text-left">Description</th>
                    <th style="width:12%">Target Date</th>
                    <th style="width:8%" class="d-none d-lg-table-cell">Days left</th>
                    <th style="width:10%">Status</th>
                    <th style="width:20%" class="d-none d-lg-table-cell">Update Status</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pendTasks}" var = "pendtasks">
                    <tr>
                        <td class="text-left"><c:out value="${pendtasks.project.projectName}"/></td>
                        <td class="text-left"><c:out value="${pendtasks.name}"/></td>
                        <td class="text-left"><c:out value="${pendtasks.description}"/></td>
                        <td class="text-left">
                            <fmt:parseDate value="${pendtasks.targetDate}" pattern="yyyy-MM-dd" var="trgDate" type="date" />
                            <fmt:formatDate value="${trgDate}" pattern="MM-dd-yyyy" var="newstDate" /> <c:out value="${newstDate}" />
                        </td>
                        <td class="text-center col-1 d-none d-lg-table-cell"><c:out value="${pendtasks.daysLeftUntilDeadline(pendtasks.targetDate)}"/> </td>
                        <td class="text-left"><c:out value="${pendtasks.status}"/></td>
                        <td>
                                <form method="get" action="/mytasksupd/${pendtasks.id}">
                                    <select name="selectedStatus" class="form-control"  id="inputGroupSelect01" onchange="this.form.submit()">
                                        <option value=""></option>
                                        <option value="New">New</option>
                                        <option value="In Progress">In Progress</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Completed">Completed</option>
                                     </select>
                                </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</main>

</body>
</html>
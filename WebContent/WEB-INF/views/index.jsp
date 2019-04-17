<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin | An Cầu</title>

<jsp:include page="_include/_import.jsp" />

</head>
<body>
    <div class="preloader" style="display: none;">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper" data-sidebartype="full">
        <!-- header -->
        <jsp:include page="_include/_header.jsp" />
        <!-- aside -->
        <jsp:include page="_include/_aside.jsp" />
        <div class="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title"><s:message code="home.dashboard.top10" /></h4>
                            </div>
                            <div class="comment-widgets scrollable ps-container ps-theme-default" data-ps-id="3982b10d-5032-6502-b984-f7ed52abd1ed">
                                <!-- TOP -->
                                <c:forEach var="record" items="${records}" varStatus="status">
	                                <div class="d-flex flex-row comment-row" style="height: 90px;">
	                                    <div class="p-2"><img src="resources/avatar/${record[5]}" alt="user" width="50" class="rounded-circle"></div>
	                                    <div class="comment-text w-100">
	                                        <h6 class="font-medium">${status.index+1}. ${record[0]}</h6>
	                                        <span class="m-b-15 d-block" style="width:250px;float:left;">${record[4]}</span>
	                                        <div class="comment-footer">
	                                            <button type="button" class="float-right btn btn-danger btn-sm">-${record[2]}</button>
	                                            <button type="button" class="float-right btn btn-success btn-sm">+${record[1]}</button>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                    	<!-- process bar -->
                    	<%-- <div class="card">
                            <div class="card-body">
                                <h4 class="card-title m-b-0">Progress Box</h4>
                                <div class="m-t-20">
                                    <div class="d-flex no-block align-items-center">
                                        <span style="margin-top: 20px;">81% Clicks</span>
                                        <div class="ml-auto">
                                            <span>125</span>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 81%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="d-flex no-block align-items-center m-t-25">
                                        <span style="margin-top: 20px;">72% Uniquie Clicks</span>
                                        <div class="ml-auto">
                                            <span>120</span>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 72%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="d-flex no-block align-items-center m-t-25">
                                        <span style="margin-top: 20px;">53% Impressions</span>
                                        <div class="ml-auto">
                                            <span>785</span>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 53%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div>
                                    <div class="d-flex no-block align-items-center m-t-25">
                                        <span style="margin-top: 20px;">3% Online Users</span>
                                        <div class="ml-auto">
                                            <span>8</span>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-striped bg-danger" role="progressbar" style="width: 3%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div> --%>
                    
                    	<!-- Thanh tich gan day -->
                    	<div class="card">
                            <div class="card-body" style="height: 816px;">
                                <h4 class="card-title"><s:message code="home.dashboard.recent" /></h4>
                                <div class="todo-widget scrollable ps-container ps-theme-default ps-active-y" style="height:750px;">
                                    <ul class="list-task todo-list list-group m-b-0" data-role="tasklist">
                                    	<c:forEach var="record" items="${recentRecords}">
										<li class="list-group-item todo-item" data-role="task">
                                            <div class="custom-control custom-checkbox" style="padding-left: 0px;">
                                                <label class="todo-label" for="customCheck">
                                                    <span class="todo-desc">${record.reason}</span>
                                                    <c:choose>
	                                                    <c:when test="${record.type == 0}">
	                                                    	<span class="badge badge-pill badge-danger float-right">${record.date}</span>
	                                                    </c:when>
	                                                    <c:otherwise>
	                                                    	<span class="badge badge-pill badge-success float-right">${record.date}</span>
	                                                    </c:otherwise>
                                                    </c:choose>
                                                </label>
                                            </div>
                                            <ul class="list-style-none assignedto">
                                                <li class="assignee"><img class="rounded-circle" width="40" src="<c:url value="/resources/avatar/${record.staffs.photo}"/>" alt="user" data-placement="top" title="${record.staffs.name}"></li>
                                            </ul>
                                        </li>
                                        
                                        
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <footer class="footer text-center">
                An Cầu &copy; 2018</a>.
            </footer>

        </div>

    </div>

<div class="flotTip" style="display: none; position: absolute;"></div>

</body>
</html>
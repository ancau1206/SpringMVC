<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin | An Cầu</title>

<jsp:include page="../_include/_import.jsp" />

</head>
<body>
	<body>
    <div class="preloader" style="display: none;">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper" data-sidebartype="full">
        <!-- header -->
        <jsp:include page="../_include/_header.jsp" />
        <!-- aside -->
        <jsp:include page="../_include/_aside.jsp" />
        <div class="page-wrapper">
       
        
            <div class="container-fluid">
            <h4 class="card-title"><s:message code="home.departs.title.update" /></h4>
            <form:form action="departs/update" method="POST" modelAttribute="departs" enctype="multipart/form-data">
            
	            <div class="row">
	                    <div class="col-12" data-select2-id="16">
	                        <div class="card" data-select2-id="15">
	                            <div class="card-body" data-select2-id="14">
	                            <c:choose>
	                            	<c:when test="${update == true}">
	                            		<div class="alert alert-success" role="alert"> <s:message code="home.departs.update.success" /> </div><br/>
	                            	</c:when>
                            	</c:choose>
	                            	<!-- id -->
	                            	<form:input path="id" type="hidden" value="${departs.id}" />
									<!-- Mã phòng ban -->
									<div class="form-group row">
	                                    <label class="col-md-3" for="disabledTextInput"><s:message code="home.departs.codeid"/></label>
	                                    <div class="col-md-9">
	                                        <form:input path="codeId" type="text" class="form-control" value="${departs.codeId}" readonly="true"/>
	                                    	<form:errors path="codeId" cssStyle="color:red;" />
	                                    </div>
	                                </div>
									 
									<!-- Tên phòng ban -->
									<div class="form-group row" data-select2-id="89">
										<label class="col-md-3 m-t-15"><s:message code="home.departs.name"/></label>
										<div class="col-sm-9">
											<form:input path="name" type="text" class="form-control" value="${departs.name}" />
											<form:errors path="name" cssStyle="color:red;" />
										</div>
									</div>
	                            </div>
	                            <div class="border-top">
	                                <div class="card-body">
	                                    <button class="btn btn-primary"><s:message code="home.submit"/></button> <a href="departs/update?id=${departs.id}" type="reset" class="btn btn-secondary"><s:message code="home.reset"/></a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	             </form:form>
            
            </div>

            <footer class="footer text-center">
                An Cầu &copy; 2018</a>.
            </footer>

        </div>

    </div>


<div class="flotTip" style="display: none; position: absolute;"></div>
</body>
</html>
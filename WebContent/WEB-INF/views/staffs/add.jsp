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
            <h4 class="card-title"><s:message code="home.staffs.title.add" /></h4>
            <form:form action="staffs/add" method="POST" enctype="multipart/form-data" modelAttribute="staffs">
            
	            <div class="row">
	                    <div class="col-12" data-select2-id="16">
	                        <div class="card" data-select2-id="15">
	                            <c:choose>
	                            	<c:when test="${add == true}">
	                            		<div class="alert alert-success" role="alert"> <s:message code="home.staffs.add.success" /> </div><br/>
	                            	</c:when>
                            	</c:choose>
	                            <div class="card-body" data-select2-id="14">
	                            	<center><img id="blah" src="resources/avatar/noimage.jpg" width="128px" height="128px"/></center>
	                            	<br/>
	                            	<!-- id -->
	                            	<form:input path="id" type="hidden" class="form-control" />
	                            	<!-- old-photo -->
	                            	<form:input path="photo" type="hidden" value="noimage.jpg" />
									<!-- Mã nhân viên -->
									<div class="form-group row">
	                                    <label class="col-md-3" for="disabledTextInput"><s:message code="home.staffs.codeid" /></label>
	                                    <div class="col-md-9">
	                                        <form:input path="codeId" type="text" id="codeid" class="form-control" value="${newId}" readonly="true"/>
	                                    </div>
	                                </div>
									
									<!-- Họ tên -->
									<div class="form-group row" data-select2-id="89">
										<label class="col-md-3 m-t-15"><s:message code="home.staffs.name" /></label>
										<div class="col-sm-9">
											<form:input path="name" type="text" class="form-control" id="name" onchange="change(this.id);" value="${staffs.name}" />
											<form:errors path="name" cssStyle="color:red;float:left;"/>
										</div>
									</div>
									
									<!-- Giới tính -->
									<div class="form-group row">
	                                    <label class="col-md-3"><s:message code="home.staffs.gender" /></label>
	                                    <div class="col-md-9">
	                                    <c:set var="gd" value="${staffs.gender}" />
	                                    
	                                        <div class="custom-control custom-radio">
	                                        	<c:choose>
	                                        	<c:when test="${gd == true}"><input type="radio" class="custom-control-input" id="customControlValidation1" value="1" name="gender" checked="checked" ></c:when>
	                                            <c:otherwise><input type="radio" class="custom-control-input" id="customControlValidation1" value="1" name="gender" ></c:otherwise>
	                                            </c:choose>
	                                            <label class="custom-control-label" for="customControlValidation1"><s:message code="male" /></label>
	                                        </div>
	                                         <div class="custom-control custom-radio">
	                                            <c:choose>
	                                        	<c:when test="${gd == true}"><input type="radio" class="custom-control-input" id="customControlValidation2" value="0" name="gender" ></c:when>
	                                            <c:otherwise><input type="radio" class="custom-control-input" id="customControlValidation2" value="0" name="gender" checked="checked" ></c:otherwise>
	                                            </c:choose>
	                                            <label class="custom-control-label" for="customControlValidation2"><s:message code="female" /></label>
	                                        </div>
	                                    </div>
	                                </div>
									
									<!-- Ngày sinh -->
									<div class="form-group row" data-select2-id="89">
	                                    <label class="col-md-3 m-t-15"><s:message code="home.staffs.birthday" /></label>
										<div class="col-sm-9">
											<form:input type="date" path="birthday" class="form-control" onchange="change(this.id);" id="birthday" value="${date}" />
											<form:errors path="birthday" cssStyle="color:red;" />
										</div>
									</div>
									
									<!-- Chọn ảnh -->
									<div class="form-group row">
	                                    <label class="col-md-3"><s:message code="home.staffs.image" /></label>
	                                    <div class="col-md-9">
	                                            <input type="file" onchange="readURL(this);" id="photo" name="photo2" class="" accept="image/*">
	                                            <c:choose>
	                                            	<c:when test="${photoError}">
	                                            		<div style="color:red;"><s:message code="home.staffs.image.error" /></div>
	                                            	</c:when>
	                                            </c:choose>
	                                    </div>
	                                </div>
	                                <form:errors path="photo" cssStyle="color:red;" />
									
									<!-- Email -->
									<div class="form-group row" data-select2-id="89">
										<label class="col-md-3 m-t-15"><s:message code="home.staffs.email" /></label>
										<div class="col-sm-9">
											<form:input type="text" path="email" class="form-control" onchange="change(this.id);" id="email" value="${staffs.email }" />
											<form:errors path="email" cssStyle="color:red;"/>
										</div>
									</div>
									
									<!-- Phone -->
									<div class="form-group row" data-select2-id="89">
										<label class="col-md-3 m-t-15"><s:message code="home.staffs.phone" /></label>
										<div class="col-sm-9">
											<form:input type="text" path="phone" class="form-control" onchange="change(this.id);" id="phone" value="${staffs.phone}" />
											<form:errors path="phone" cssStyle="color:red;" />
										</div>
									</div>
									
									<!-- Level -->
									<div class="form-group row" data-select2-id="89">
										<label class="col-md-3 m-t-15"><s:message code="home.staffs.level" /></label>
										<div class="col-sm-9">
											<form:input type="text" path="level" class="form-control" onchange="change(this.id);" id="level" value="1" readonly="true" />
											<form:errors path="level" cssStyle="color:red;"/>
										</div>
									</div>
									
									<!-- Lương -->
									<div class="form-group row" data-select2-id="89">
										<label class="col-md-3 m-t-15"><s:message code="home.staffs.salary" /></label>
										<div class="col-sm-9">
											<form:input type="text" path="salary" class="form-control" onchange="change(this.id);" id="salary" value="${staffs.salary}" />
											<form:errors path="salary" cssStyle="color:red;"/>
										</div>
									</div>
									<!-- Ghi chú -->
									<div class="form-group row" data-select2-id="89">
										<label class="col-md-3 m-t-15"><s:message code="home.staffs.notes" /></label>
										<div class="col-sm-9">
											<form:input path="notes" type="text" class="form-control" onchange="change(this.id);" id="notes" value="${staffs.notes}" />
											<form:errors path="notes" cssStyle="color:red;"/>
										</div>
									</div>
									
	                                <%-- <div class="form-group row" data-select2-id="89">
	                                    <label class="col-md-3 m-t-15">Phòng ban</label>
	                                    <div class="col-md-9" data-select2-id="88">
	                                        <select name="departs" class="select2 form-control custom-select" style="width: 100%; height:36px;">
	                                            	<c:set var="dpid" value="${staffs.departs.id}" />
														<c:forEach var="depart" items="${departs}">
															<c:choose>
																<c:when test="${dpid == depart.id}">
																	<option value="${depart}" selected="selected">${depart.name}</option>
																</c:when>
																<c:otherwise>
																	<option value="${depart}">${depart.name}</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
	                                        </select>
	                                    </div>
	                                </div> --%>
	                                
	                                <div class="form-group row" data-select2-id="89">
	                                    <label class="col-md-3 m-t-15"><s:message code="home.departs" /></label>
	                                    <div class="col-md-9" data-select2-id="88">
	                                    <div class="form-control" style="padding:0px;">
	                                    	<form:select path="departs.id" cssClass="form-control" items="${departs}" itemValue="id" itemLabel="name" />
	                                    </div>
	                                </div>
	                                
	                                <form:errors path="departs" cssStyle="color:red;" />
	                                
	                            </div>
	                            <div class="border-top">
	                                <div class="card-body">
	                                    <button class="btn btn-primary"><s:message code="home.submit" /></button> <button type="reset" class="btn btn-secondary"><s:message code="home.reset" /></button>
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
    <script>
    
    	function change(id) {
    		var p = document.getElementById(id+'.errors');
    		p.style.display = "none";
    	}
    
    </script>

<div class="flotTip" style="display: none; position: absolute;"></div>
</body>
</html>
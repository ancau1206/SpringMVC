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
<style>
#confirm {
	display: block;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 30%;
}

.close2 {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close2:hover, .close2:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
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
        <jsp:include page="../_include/_header.jsp" />
        <!-- aside -->
        <jsp:include page="../_include/_aside.jsp" />
        <div class="page-wrapper">
        
        
            <div class="container-fluid">
            
            <div class="row">
                    <!-- Column -->
                    <div class="col-lg-4 col-xlg-3 col-md-5">
                        <div class="card">
                            <div class="card-body">
                            	<c:choose>
	                            	<c:when test="${add == true}">
	                            		<div class="alert alert-success" role="alert"> <s:message code="home.staffs.add.success" /> </div><br/>
	                            	</c:when>
                            	</c:choose>
                                <center class="m-t-30"> <img src="resources/avatar/${oldphoto}" class="rounded-circle" width="150" height="150" style="margin-bottom:10px;" />
                                    <h4 class="card-title m-t-10">${staffs.name}</h4>
                                    <h6 class="card-subtitle">${staffs.departs.name}</h6>
                                    <div class="row text-center justify-content-md-center">
<%--                                         <div class="col-4"><a href="javascript:void(0)" class="link"><i class="icon-people"></i> <font class="font-medium">${staffs.level}</font></a></div>
                                        <div class="col-4"><a href="javascript:void(0)" class="link"><i class="icon-picture"></i> <font class="font-medium">${staffs.salary }</font></a></div> --%>
                                    </div>
                                </center>
                            </div>
                            <div>
                                <hr> </div>
                            <div class="card-body">
	                            <div style="width:50%;float:left;">
		                            <small class="text-muted">
		                            <s:message code="home.staffs.codeid" /> </small>
	                                <h6>${staffs.codeId}</h6> <small class="text-muted p-t-30 db">
	                                
	                                <s:message code="home.staffs.gender" /></small>
	                                <c:choose>
	                                	<c:when test="${staffs.gender == true}">
	                                		<h6>Nam</h6>
	                                	</c:when>
	                                	<c:otherwise>
	                                		<h6>Nữ</h6>
	                                	</c:otherwise>
	                                </c:choose>
	                                <small class="text-muted p-t-30 db">
	                                
	                                <s:message code="home.staffs.birthday" /></small>
	                                <h6>${staffs.birthday}</h6>
	                                
	                                <small class="text-muted">
	                                <s:message code="home.staffs.notes" /></small>
	                                <h6>${staffs.notes}</h6>
	                                
	                            </div>
	                            <div style="width:50%;float:left;">
	                            
	                                <small class="text-muted">
	                                <s:message code="home.staffs.phone" /></small>
	                                <h6>${staffs.phone}</h6>
	                                
	                                <small class="text-muted">
	                                <s:message code="home.staffs.email" /></small>
	                                <h6>${staffs.email}</h6>
	                                
	                                <small class="text-muted">
	                                <s:message code="home.staffs.level" /></small>
	                                <h6>${staffs.level}</h6>
	                                
	                                <small class="text-muted">
	                                <s:message code="home.staffs.salary" /></small>
	                                <h6>$${staffs.salary}</h6>
	                            </div>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                    <!-- Column -->
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <div class="card-body">
                            	<c:choose>
	                            	<c:when test="${update == true}">
	                            		<div class="alert alert-success" role="alert"> <s:message code="home.staffs.update.success" /> </div><br/>
	                            	</c:when>
                            	</c:choose>
					             <form:form action="staffs/update" method="POST" modelAttribute="staffs" enctype="multipart/form-data">
					            
						            <div class="row">
						                    <div class="col-12" data-select2-id="16">
						                        <div class="card" data-select2-id="15">
						                            <div class="card-body" data-select2-id="14">
						                            	<%-- <center><img id="blah" src="resources/avatar/${staffs.photo}" width="128px" height="128px"/></center> --%>
						                            	<br/>
						                            	<!-- id -->
						                            	<form:input path="id" type="hidden" value="${staffs.id}" class="form-control" />
						                            	<!-- old-photo -->
						                            	<form:input path="photo" type="hidden" value="noimage.jpg" />
						                            	<input name="oldphoto" type="hidden" value="${oldphoto}" >
														<!-- Mã nhân viên -->
														<form:input path="codeId" type="hidden" id="codeid" class="form-control" value="${staffs.codeId}" />
														
														<!-- Họ tên -->
														<div class="form-group row" data-select2-id="89">
															<label class="col-md-3 m-t-15"><s:message code="home.staffs.name" /></label>
															<div class="col-sm-9">
																<form:input path="name" type="text" class="form-control" id="name" onchange="change(this.id);" placeholder="${staffs.name}" />
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
																<form:input type="date" path="birthday" class="form-control" onchange="change(this.id);" id="birthday" placeholder="${date}" />
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
																<form:input type="text" path="email" class="form-control" onchange="change(this.id);" id="email" placeholder="${staffs.email}" />
																<form:errors path="email" cssStyle="color:red;"/>
															</div>
														</div>
														
														<!-- Phone -->
														<div class="form-group row" data-select2-id="89">
															<label class="col-md-3 m-t-15"><s:message code="home.staffs.phone" /></label>
															<div class="col-sm-9">
																<form:input type="text" path="phone" class="form-control" onchange="change(this.id);" id="phone" placeholder="${staffs.phone}" />
																<form:errors path="phone" cssStyle="color:red;" />
															</div>
														</div>
														
														<!-- Level -->
														<div class="form-group row" data-select2-id="89">
															<label class="col-md-3 m-t-15"><s:message code="home.staffs.level" /></label>
															<div class="col-sm-9">
																<form:input type="text" path="level" class="form-control" onchange="change(this.id);" id="level" placeholder="${staffs.level}" />
																<form:errors path="level" cssStyle="color:red;"/>
															</div>
														</div>
														
														<!-- Lương -->
														<div class="form-group row" data-select2-id="89">
															<label class="col-md-3 m-t-15"><s:message code="home.staffs.salary" /></label>
															<div class="col-sm-9">
																<form:input type="text" path="salary" class="form-control" onchange="change(this.id);" id="salary" placeholder="${staffs.salary}" />
																<form:errors path="salary" cssStyle="color:red;"/>
															</div>
														</div>
														<!-- Ghi chú -->
														<div class="form-group row" data-select2-id="89">
															<label class="col-md-3 m-t-15"><s:message code="home.staffs.notes" /></label>
															<div class="col-sm-9">
																<form:input path="notes" type="text" class="form-control" onchange="change(this.id);" id="notes" placeholder="${staffs.notes}" />
																<form:errors path="notes" cssStyle="color:red;"/>
															</div>
														</div>
						                                
						                                <div class="form-group row" data-select2-id="89">
						                                    <label class="col-md-3 m-t-15"><s:message code="home.departs" /></label>
						                                    <div class="col-md-9" data-select2-id="88">
						                                    	<div class="form-control" style="padding:0px;">
							                                    	<form:select path="departs.id" cssClass="form-control" items="${departs}" itemValue="id" itemLabel="name">
																				<c:forEach var="depart" items="${departs}">
																							<form:option value="${depart.id}">${depart.name}</form:option>
																				</c:forEach>
							                                    	</form:select>
							                                    </div>
						                                    </div>
						                                </div>
						                                
						                                <form:errors path="departs" cssStyle="color:red;" />
						                                
						                            </div>
						                            <div class="border-top">
						                                <div class="card-body">
						                                    <button class="btn btn-primary"><s:message code="home.submit" /></button> <a href="staffs/update?id=${staffs.id}" class="btn btn-secondary"><s:message code="home.reset" /></a>
						                                </div>
						                            </div>
						                        </div>
						                    </div>
						                </div>
						             </form:form>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
            
            </div>

            <footer class="footer text-center">
                An Cầu &copy; 2018</a>.
            </footer>

        </div>

    </div>

<div id="confirm" class="modal" style="display: none;">
	<div class="modal-content">
		<div class="modal-body"><s:message code="home.staffs.confirm" /></div>
		<div class="modal-footer"><a class="btn btn-secondary" onclick="deleteById()"><span style="color:white;"><s:message code="home.cancel" /></span></a> <a class="btn btn-danger" href="#" id="idDelelte"><s:message code="home.delete" /></a></div>
	</div>
</div>



<script>
	$('#zero_config').DataTable();
</script>
<script>
	function deleteById(id) {
		document.getElementById("idDelelte").href='staffs/delete?id=' + id;
		
		var p = document.getElementById("confirm");
		  if(p.style.display == "block")
		      p.style.display = "none";
		  else
		      p.style.display = "block";
	}
	
	window.onclick = function(event) {
		var p = document.getElementById("confirm");
		    if (event.target == p) {
		    	p.style.display = "none";
		    }
	}
</script>

<div class="flotTip" style="display: none; position: absolute;"></div>
</body>
</html>
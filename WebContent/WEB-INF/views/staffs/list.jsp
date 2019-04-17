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
            
				<div class="card">
                            <div class="card-body">
                            	<c:choose>
	                            	<c:when test="${delete == true}">
	                            		<div class="alert alert-success" role="alert"> <s:message code="home.staffs.delete.success" /> </div><br/>
	                            	</c:when>
                            	</c:choose>
                            	<h4 class="card-title"><s:message code="home.staffs.title" /></h4><br/>
                                <div class="table-responsive">
                                    <table id="zero_config" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th><s:message code="home.staffs.no" /></th>
                                                <th><s:message code="home.staffs.codeid" /></th>
                                                <th><s:message code="home.staffs.name" /></th>
                                                <th><s:message code="home.staffs.departs" /></th>
                                                <th><s:message code="home.action" /></th>
                                            </tr> 
                                        </thead>
                                        <tbody>
                                        <c:forEach var="staff" items="${staffs}" varStatus="status">
                                            <tr>
                                                <td>${status.index+1}</td>
                                                <td>${staff.codeId}</td>
                                                <td>${staff.name}</td>
                                                <td>${staff.departs.name}</td>
                                                <td><a href="staffs/update?id=${staff.id}" title="Sửa"><button type="button" class="btn btn-success"><i class="far fa-edit"></i></button></a> <a id="${staff.id}" onclick="deleteById(this.id)" title="Xóa"><button type="button" class="btn btn-danger"><i class="far fa-calendar-times"></i></button></a></td>
                                            </tr>
                                         </c:forEach>
                                        </tbody> 
                                    </table>
                                </div>

                            </div>
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
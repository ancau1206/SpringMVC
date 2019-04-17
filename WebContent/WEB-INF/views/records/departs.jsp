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
#p1 {
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
                            <h4 class="card-title"><s:message code="home.aad.title.departs" /></h4><br/>
                                <div class="table-responsive">
                                    <table id="zero_config" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th><s:message code="home.aad.no" /></th>
                                                <th><s:message code="home.departs.codeid" /></th>
                                                <th><s:message code="home.departs.name" /></th>
                                                <th><s:message code="home.aad.achievement" /></th>
                                                <th><s:message code="home.aad.discipline" /></th>
                                                <th><s:message code="home.aad.score" /></th>
                                            </tr> 
                                        </thead>
                                        <tbody>
                                        <c:forEach var="depart" items="${departs}" varStatus="status">
                                            <tr>
                                                <td>${status.index+1}</td>
                                                <td>${depart[0]}</td>
                                                <td>${depart[1]}</td>
                                                <td>${depart[2]}</td>
                                                <td>-${depart[3]}</td>
                                                <td>${depart[4]}</td>
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

<div id="p1" class="modal" style="display: none;">
	<div class="modal-content">
		<div class="modal-body">Bạn chắc chắn muốn xóa nhân viên này?</div>
		<div class="modal-footer"><a class="btn btn-secondary" onclick="deleteById()"><span style="color:white;">Hủy</span></a> <a class="btn btn-danger" href="#" id="idDelelte" style="width:50px;">Xóa</a></div>
	</div>
</div>

<script>
	$('#zero_config').DataTable();
</script>
<script>
	function deleteById(id) {
		document.getElementById("idDelelte").href='staffs/delete?id=' + id;
		
		var p = document.getElementById("p1");
		  if(p.style.display == "block")
		      p.style.display = "none";
		  else
		      p.style.display = "block";
	}
	
	window.onclick = function(event) {
		var p = document.getElementById("p1");
		    if (event.target == p) {
		    	p.style.display = "none";
		    }
	}
</script>

<div class="flotTip" style="display: none; position: absolute;"></div>
</body>
</html>
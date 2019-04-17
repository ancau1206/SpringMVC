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
            
            <form action="records/add" method="POST" modelAttribute="records">
            
	            <div class="row">
	                    <div class="col-12" data-select2-id="16">
	                        <div class="card" data-select2-id="15">
	                            <div class="card-body" data-select2-id="14">
		                            <c:choose>
		                            	<c:when test="${add == true}">
		                            		<div class="alert alert-success" role="alert"> <s:message code="home.aad.add.success" /> </div><br/>
		                            	</c:when>
	                            	</c:choose>
									<!-- Loại -->
									<div class="form-group row">
	                                    <label class="col-md-3"><s:message code="home.aad.type" /></label>
	                                    <div class="col-md-9">
	                                        <div class="custom-control custom-radio">
	                                            <input value="1" type="radio" class="custom-control-input" id="customControlValidation1" name="type" checked="checked">
	                                            <label class="custom-control-label" for="customControlValidation1"><s:message code="home.aad.achievement" /></label>
	                                        </div>
	                                         <div class="custom-control custom-radio">
	                                            <input value="0" type="radio" class="custom-control-input" id="customControlValidation2" name="type">
	                                            <label class="custom-control-label" for="customControlValidation2"><s:message code="home.aad.discipline" /></label>
	                                        </div>
	                                    </div>
	                                </div>
	                            
									<!-- Chọn nhân viên -->
									<div class="form-group row">
                                    <label class="col-md-3 m-t-15"><s:message code="home.aad.staffs" /></label>
                                    <div class="col-md-9">
                                        <select name="staffs" class="select2 form-control m-t-15" multiple="multiple" style="height: 36px;width: 100%;" >
                                        	<c:forEach var="dp" items="${departs}">
	                                            <optgroup label="${dp.name}">
	                                            	<c:forEach var="staff" items="${staffs[dp.id]}">
		                                                <option value="${staff.id}">${staff.codeId} - ${staff.name}</option>
	                                                </c:forEach>
	                                            </optgroup>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                
                                <!-- Tên phòng ban -->
									<div class="form-group row" data-select2-id="89">
										<label class="col-md-3 m-t-15"><s:message code="home.aad.content" /></label>
										<div class="col-sm-9">
											<textarea name="reason" type="text" class="form-control" placeholder="<s:message code="home.aad.content" />" ></textarea>
										</div>
									</div>

								<input name="date" id="date" type="hidden"/>
									
	                            </div>
	                            <div class="border-top">
	                                <div class="card-body">
	                                    <button class="btn btn-primary"><s:message code="home.submit" /></button> <button type="reset" class="btn btn-secondary"><s:message code="home.reset" /></button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	             </form>
            
            </div>

            <footer class="footer text-center">
                An Cầu &copy; 2018</a>.
            </footer>

        </div>

    </div>

<div class="flotTip" style="display: none; position: absolute;"></div>

<script>
        //***********************************//
        // For select 2
        //***********************************//
        $(".select2").select2();

        /*colorpicker*/
        $('.demo').each(function() {
        //
        // Dear reader, it's actually very easy to initialize MiniColors. For example:
        //
        //  $(selector).minicolors();
        //
        // The way I've done it below is just for the demo, so don't get confused
        // by it. Also, data- attributes aren't supported at this time...they're
        // only used for this demo.
        //
        $(this).minicolors({
                control: $(this).attr('data-control') || 'hue',
                position: $(this).attr('data-position') || 'bottom left',

                change: function(value, opacity) {
                    if (!value) return;
                    if (opacity) value += ', ' + opacity;
                    if (typeof console === 'object') {
                        console.log(value);
                    }
                },
                theme: 'bootstrap'
            });

        });
        /*datwpicker*/
        jQuery('.mydatepicker').datepicker();
        jQuery('#datepicker-autoclose').datepicker({
            autoclose: true,
            todayHighlight: true
        });
        var quill = new Quill('#editor', {
            theme: 'snow'
        });

    </script>
    <script>
    $(document).ready(function() {
		    var today = new Date();
		    var dd = today.getDate();
		    var mm = today.getMonth()+1; //January is 0!
		    var yyyy = today.getFullYear();
		
		    if(dd<10) {
		        dd = '0'+dd
		    } 
		
		    if(mm<10) {
		        mm = '0'+mm
		    } 
		
		    today = yyyy + '-' + mm + '-' + dd;
		    document.getElementById('date').value = today;
    	});
    </script>

</body>
</html>
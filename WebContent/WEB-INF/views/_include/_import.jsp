<base href="${pageContext.servletContext.contextPath}/">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder" %>

<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon" />

<link= href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<c:url value="/resources/css/float-chart.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/themify-icons.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/dataTables.bootstrap4.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/multicheck.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery.minicolors.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/quill.snow.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/select2.min.css" />" rel="stylesheet">

<script src="<c:url value="/resources/js/excanvas.js" />"></script>
<script src="<c:url value="/resources/js/jquery.flot.js" />"></script>
<script src="<c:url value="/resources/js/jquery.flot.pie.js" />"></script>
<script src="<c:url value="/resources/js/jquery.flot.time.js" />"></script>
<script src="<c:url value="/resources/js/jquery.flot.stack.js" />"></script>
<script src="<c:url value="/resources/js/jquery.flot.crosshair.js" />"></script>
<script src="<c:url value="/resources/js/jquery.flot.tooltip.min.js" />"></script>
<script src="<c:url value="/resources/js/chart-page-init.js" />"></script>
<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
<script src="<c:url value="/resources/js/popper.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/sparkline.js" />"></script>
<script src="<c:url value="/resources/js/waves.js" />"></script>
<script src="<c:url value="/resources/js/sidebarmenu.js" />"></script>
<script src="<c:url value="/resources/js/custom.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap-datepicker.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.inputmask.bundle.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.minicolors.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery-asColor.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery-asColorPicker.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery-asGradient.js" />"></script>
<script src="<c:url value="/resources/js/mask.init.js" />"></script>
<script src="<c:url value="/resources/js/select2.full.min.js" />"></script>
<script src="<c:url value="/resources/js/select2.min.js" />"></script>
<%-- <script src="<c:url value="/resources/js/sidebarmenu.js" />"></script> --%>
<script src="<c:url value="/resources/js/datatable-checkbox-init.js" />"></script>
<%if(String.valueOf(LocaleContextHolder.getLocale()).equals("vi")) {
	%>
	<script src="<c:url value="/resources/js/datatables.min.vi.js" />"></script>
<%} else {%>
<script src="<c:url value="/resources/js/datatables.min.js" />"></script>
<% } %>

<script src="<c:url value="/resources/js/jquery.multicheck.js" />"></script>
<script src="<c:url value="/resources/js/quill.min.js" />"></script>
<script src="<c:url value="/resources/js/perfect-scrollbar.jquery.min.js" />"></script>

<script type="text/javascript">
	function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#blah')
                        .attr('src', e.target.result)
                        .width(128)
                        .height(128);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
  </script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<aside class="left-sidebar" data-sidebarbg="skin5">
            <div class="scroll-sidebar">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" class="p-t-30 in">
                    	<c:set var ="mn" value="${menu}"/>
                    	<c:choose><c:when test="${mn == 'dashboard'}"><li class="sidebar-item selected"></c:when><c:otherwise><li class="sidebar-item"></c:otherwise></c:choose>
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="dashboard" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu"><s:message code="home.dashboard" /></span></a></li>
                        <c:choose><c:when test="${mn == 'staffs'}"><li class="sidebar-item selected"></c:when><c:otherwise><li class="sidebar-item"></c:otherwise></c:choose>
						<a class="sidebar-link waves-effect waves-dark sidebar-link" href="staffs" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu"><s:message code="home.staffs" /></span></a></li>
                        <c:choose><c:when test="${mn == 'departs'}"><li class="sidebar-item selected"></c:when><c:otherwise><li class="sidebar-item"></c:otherwise></c:choose>
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="departs" aria-expanded="false"><i class="mdi mdi-chart-bubble"></i><span class="hide-menu"><s:message code="home.departs" /></span></a></li>
                        <c:choose><c:when test="${mn == 'records'}"><li class="sidebar-item selected"></c:when><c:otherwise><li class="sidebar-item"></c:otherwise></c:choose>
                        <a class="sidebar-link has-arrow waves-effect waves-dark" onclick="openMenu();" aria-expanded="false"><i class="mdi mdi-receipt"></i><span class="hide-menu"><s:message code="home.aad" /></span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="records/staffs" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> <s:message code="home.staffs" /> </span></a></li>
                                <li class="sidebar-item"><a href="records/departs" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> <s:message code="home.departs" /> </span></a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div class="body-wrapper">
    <div class="container-fluid">
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
           <div class="card-body px-4 py-3">
             <div class="row align-items-center" style="margin-top:20px;">
               <div class="col-9">
                 <h4 class="fw-semibold mb-8">조직도</h4>
                 <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                       <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                     </li>
                     <li class="breadcrumb-item" aria-current="page">조직도</li>
                   </ol>
                 </nav>
               </div>
               <div class="col-3">
                 <div class="text-center mb-n4">
                   <img src="${pageContext.request.contextPath }/resources/assets/images/logos/symbol-01.png" alt="modernize-img" class="img-fluid" style="width: 120px; height: auto;">
                 </div>
               </div>
             </div>
           </div>
        </div>
        <div class="card w-100 position-relative overflow-hidden">
		    <div class="card-header text-bg-primary">
		        <h5 class="mb-0 text-white">조직도</h5>
		    </div>
		    <div class="card-body text-center">
		        <img src="${pageContext.request.contextPath }/resources/assets/images/management/organize.png" alt="organize" class="img-fluid" style="margin-left: 15px; margin-right: 15px; max-width: 100%;">
		    </div>
		</div>
    </div>
</div>


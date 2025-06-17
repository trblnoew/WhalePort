<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Sidebar Start -->
<aside class="left-sidebar with-vertical">
    <div><!-- ---------------------------------- -->
      <!-- Start Vertical Layout Sidebar -->
      <!-- ---------------------------------- -->
      <div class="brand-logo d-flex align-items-center justify-content-between">
        <a href="/partner/home" class="text-nowrap logo-img">
          <img src="${pageContext.request.contextPath }/resources/assets/images/logos/headertype-01.png" class="dark-logo" alt="Logo-Dark" style="width: 180px; height: auto;" />
<%--           <img src="${pageContext.request.contextPath }/resources/assets/images/logos/light-logo.svg" class="light-logo" alt="Logo-light" /> --%>
        </a>
        <a href="javascript:void(0)" class="sidebartoggler ms-auto text-decoration-none fs-5 d-block d-xl-none">
          <i class="ti ti-x"></i>
        </a>
      </div>


      <nav class="sidebar-nav scroll-sidebar" data-simplebar>
        <ul id="sidebarnav">
          <!-- ---------------------------------- -->
          <!-- Dashboard -->
          <!-- ---------------------------------- -->
          <li class="nav-small-cap">
            <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
            <span class="hide-menu">Main</span>
          </li>
         
          <li class="sidebar-item">
<!--             <a class="sidebar-link" href="/partner/home" id="" aria-expanded="false"> -->
            <a class="sidebar-link" href="/partner/home" id="get-url" aria-expanded="false">
              <span>
                <i class="ti ti-aperture"></i>
              </span>
              <span class="hide-menu">DashBoard</span>
            </a>
          </li>
       
          <!-- ---------------------------------- -->
          <!-- 협력업체 공통 -->
          <!-- ---------------------------------- -->
          <li class="nav-small-cap">
            <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
            <span class="hide-menu">Apps</span>
          </li>
          <li class="sidebar-item">
            <a href="./main/page-user-profile.html" class="sidebar-link">
              <i class="ti ti-user-circle"></i>
              <span class="hide-menu">My Page</span>
            </a>
          </li>
          <li class="sidebar-item">
            <a href="/partner/qna/list" class="sidebar-link">
              <i class="ti ti-help"></i>
              <span class="hide-menu">QnA / FAQ</span>
            </a>
          </li>
          
          <!-- ---------------------------------- -->
          <!-- 협력업체별 -->
          <!-- ---------------------------------- -->

         <li class="nav-small-cap">
           <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
           <span class="hide-menu">partner company</span>
         </li>
         
          <!-- 항공사 PRM01 시작 -->
<%--          <c:if test="${partnerVO.ptCode eq 'PRM01' || partnerVO.ptCode eq 'PRM' }"> --%>
          <li class="sidebar-item">
            <a href="/partner/airline/schedule" class="sidebar-link">
              <i class="ti ti-box-multiple"></i>
              <span class="hide-menu">항공편 스케줄 정보</span>
            </a>
          </li>
<%--           </c:if> --%>
          <!-- 항공사 PRM01 끝-->
          
          <!-- 입점업체 PRM04 시작-->
<%--          <c:if test="${partnerVO.ptCode eq 'PRM04' || partnerVO.ptCode eq 'PRM' }"> --%>
          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
              <span class="d-flex">
                <i class="ti ti-box-multiple"></i>
              </span>
              <span class="hide-menu">물류창고 관리</span>
            </a>
            <ul aria-expanded="false" class="collapse first-level">
              <li class="sidebar-item">
                <a href="/partner/warehouse" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </div>
                  <span class="hide-menu">물류창고 조회</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="/partner/warehouse/list" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </div>
                  <span class="hide-menu">물류창고 신청</span>
                </a>
              </li>
            </ul>
          </li>
          <li class="sidebar-item">
            <a href="/partner/event/list" class="sidebar-link">
              <i class="ti ti-box-multiple"></i>
              <span class="hide-menu">이벤트 관리</span>
            </a>
          </li>
<%--           </c:if> --%>
          <!-- 입점업체 PRM04 끝-->
          
          <!-- 시설업체 PRM03 시작-->
<%--          <c:if test="${partnerVO.ptCode eq 'PRM03' || partnerVO.ptCode eq 'PRM' }"> --%>
          <li class="sidebar-item">
            <a href="/partner/facilities/scheduleList" class="sidebar-link">
              <i class="ti ti-box-multiple"></i>
              <span class="hide-menu">시설 점검 관리</span>
            </a>
          </li>
          <li class="sidebar-item">
            <a href="/partner/facilities/reportList" class="sidebar-link">
              <i class="ti ti-box-multiple"></i>
              <span class="hide-menu">시설 보고서 관리</span>
            </a>
          </li>
<%--           </c:if> --%>
          <!-- 시설업체 PRM03 끝-->

          <!-- 보안업체 PRM02 시작-->
<%--          <c:if test="${partnerVO.ptCode eq 'PRM02' || partnerVO.ptCode eq 'PRM' }"> --%>
          <li class="sidebar-item">
            <a href="/partner/security/scheduleList" class="sidebar-link">
              <i class="ti ti-box-multiple"></i>
              <span class="hide-menu">보안 점검 관리</span>
            </a>
          </li>
          <li class="sidebar-item">
            <a href="/partner/security/reportList" class="sidebar-link">
              <i class="ti ti-box-multiple"></i>
              <span class="hide-menu">보안 보고서 관리</span>
            </a>
          </li>
<%--           </c:if> --%>
          <!-- 보안업체 PRM02 끝-->
          
          
         
          
      
      </nav>
      <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->

  </aside>
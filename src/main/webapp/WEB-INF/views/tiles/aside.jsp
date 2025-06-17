<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
   $(".sidebar-item").on("click",function(){
         $("#sidebarnav").children("li").removeClass("selected");
   });
});
</script>
<!-- Sidebar Start -->
<aside class="left-sidebar with-vertical">
    <div><!-- ---------------------------------- -->
      <!-- Start Vertical Layout Sidebar -->
      <!-- ---------------------------------- -->
      <div class="brand-logo d-flex align-items-center justify-content-between">
        <a href="/common/home" class="text-nowrap logo-img">
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
            <a class="sidebar-link" href="${pageContext.request.contextPath }/common/home" id="get-url" aria-expanded="false">
              <span>
                <i class="ti ti-aperture"></i>
              </span>
              <span class="hide-menu">DashBoard</span>
            </a>
          </li>
         
       
          <!-- ---------------------------------- -->
          <!-- 직원 공통 -->
          <!-- ---------------------------------- -->
          <li class="nav-small-cap">
            <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
            <span class="hide-menu">Apps</span>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="${pageContext.request.contextPath }/common/chat/chat" aria-expanded="false">
              <span>
                <i class="ti ti-message-dots"></i>
              </span>
              <span class="hide-menu">메신저</span>
            </a>
          </li>
         
         <!-- div를 span으로 변경 (a태그 안에 div는 일반적으로 사용되지 않음) -->          
         <li class="sidebar-item">
             <a href="javascript:void(0)" aria-expanded="false" class="sidebar-link has-arrow">
                 <i class="ti ti-user-circle"></i>
                 <span class="hide-menu">마이페이지</span>
             </a>
             <ul aria-expanded="false" class="collapse first-level">
                 <li class="sidebar-item">
                     <a href="/common/attendance" class="sidebar-link">
                         <span class="round-16 d-flex align-items-center justify-content-center">
                             <i class="ti ti-circle"></i>
                         </span>
                         <span class="hide-menu">근태 현황</span>
                     </a>
                 </li>
                 <li class="sidebar-item">
                     <a href="/common/profile" class="sidebar-link">
                         <span class="round-16 d-flex align-items-center justify-content-center">
                             <i class="ti ti-circle"></i>
                         </span>
                         <span class="hide-menu">내 정보 수정</span>
                     </a>
                 </li>
             </ul>
         </li>

          <li class="sidebar-item">
            <a class="sidebar-link" href="/common/calendar" aria-expanded="false">
              <span>
                <i class="ti ti-calendar"></i>
              </span>
              <span class="hide-menu">일정 관리</span>
            </a>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="#" aria-expanded="false">
              <span>
                <i class="ti ti-star"></i>
              </span>
              <span class="hide-menu">즐겨찾기</span>
            </a>
          </li>
          
          <!-- ---------------------------------- -->
          <!-- 부서별 -->
          <!-- ---------------------------------- -->
          
         <li class="nav-small-cap">
           <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
           <span class="hide-menu">Position</span>
         </li>
         
         <!-- 인사 관리 -->
         
       <li class="sidebar-item">
           <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
               <span class="d-flex">
                   <i class="ti ti-notes"></i>
               </span>
               <span class="hide-menu">인사 관리</span>
           </a>
           <ul aria-expanded="false" class="collapse first-level">
               <li class="sidebar-item">
                   <a href="/management/list" class="sidebar-link ${empListActive }">
                       <span class="round-16 d-flex align-items-center justify-content-center">
                           <i class="ti ti-circle"></i>
                       </span>
                       <span class="hide-menu">직원 정보</span>
                   </a>
               </li>
               <li class="sidebar-item">
                   <a href="/group/orgChart" class="sidebar-link">
                       <span class="round-16 d-flex align-items-center justify-content-center">
                           <i class="ti ti-circle"></i>
                       </span>
                       <span class="hide-menu">조직도</span>
                   </a>
               </li>
               <li class="sidebar-item">
                   <a href="/etc/attendanceChart" class="sidebar-link">
                       <span class="round-16 d-flex align-items-center justify-content-center">
                           <i class="ti ti-circle"></i>
                       </span>
                       <span class="hide-menu">근태 현황</span>
                   </a>
               </li>
           </ul>
       </li>

        <!-- 전산 관리 -->
          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
              <span class="d-flex">
                <i class="ti ti-layout"></i>
              </span>
              <span class="hide-menu">전산 관리</span>
            </a>
            <ul aria-expanded="false" class="collapse first-level">
              <li class="sidebar-item">
                <a href="/info/empInsertList" class="sidebar-link ${empInsertListActive }">
                  <span class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </span>
                  <span class="hide-menu">직원 등록 내역 관리</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="/info/accessRight1" class="sidebar-link">
                  <span class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </span>
                  <span class="hide-menu">접근 권한 관리</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="/info/notice/list" class="sidebar-link ${empNoticeListActive }">
                  <span class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </span>
                  <span class="hide-menu">공지사항</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="/info/accessRight" class="sidebar-link">
                  <span class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </span>
                  <span class="hide-menu">부서 일정 관리</span>
                </a>
              </li>
            </ul>
          </li>
          
         <li class="sidebar-item">
              <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
                <span class="d-flex">
                  <i class="ti ti-box-multiple"></i>
                </span>
                <span class="hide-menu">협력업체 관리</span>
              </a>
              <ul aria-expanded="false" class="collapse first-level">
                <li class="sidebar-item">
                  <a href="/management/partner/account/accountList" class="sidebar-link">
                    <div class="round-16 d-flex align-items-center justify-content-center">
                      <i class="ti ti-circle"></i>
                    </div>
                    <span class="hide-menu">업체 목록</span>
                  </a>
                </li>
                <li class="sidebar-item">
                  <a class="sidebar-link has-arrow ${partnerActive }" href="javascript:void(0)" aria-expanded="false">
                    <div class="round-16 d-flex align-items-center justify-content-center">
                      <i class="ti ti-circle"></i>
                    </div>
                    <span class="hide-menu">업체 관리</span>
                  </a>
                  <ul aria-expanded="false" class="collapse two-level">

                    <li class="sidebar-item">
                      <a class="sidebar-link has-arrow ${airlineActive }" href="javascript:void(0)" aria-expanded="false">
                        <div class="round-16 d-flex align-items-center justify-content-center">
                          <i class="ti ti-circle"></i>
                        </div>
                        <span class="hide-menu">항공사</span>
                      </a>
                      <ul aria-expanded="false" class="collapse three-level">
                        <li class="sidebar-item">
                          <a href="/management/airport/schedule" class="sidebar-link ${airlineScheduleActive }">
                            <div class="round-16 d-flex align-items-center justify-content-center">
                              <i class="ti ti-circle"></i>
                            </div>
                            <span class="hide-menu">항공편 관리</span>
                          </a>
                        </li>
                      </ul>
                    </li>
                    
                    <li class="sidebar-item">
                      <a class="sidebar-link has-arrow ${storeActive }" href="javascript:void(0)" aria-expanded="false">
                        <div class="round-16 d-flex align-items-center justify-content-center">
                          <i class="ti ti-circle"></i>
                        </div>
                        <span class="hide-menu">입점업체</span>
                      </a>
                      <ul aria-expanded="false" class="collapse three-level">
                        <li class="sidebar-item">
                          <a href="/management/partner/warehouse/list" class="sidebar-link ${warehouseActive }">
                            <div class="round-16 d-flex align-items-center justify-content-center">
                              <i class="ti ti-circle"></i>
                            </div>
                            <span class="hide-menu">물류창고 관리</span>
                          </a>
                        </li>
                        <li class="sidebar-item">
                          <a href="/management/partner/store/list" class="sidebar-link ${storListActive }">
                            <div class="round-16 d-flex align-items-center justify-content-center">
                              <i class="ti ti-circle"></i>
                            </div>
                            <span class="hide-menu">매장 등록</span>
                          </a>
                        </li>
                      </ul>
                    </li>
                    
                    
                    <li class="sidebar-item">
                      <a class="sidebar-link has-arrow ${facilitytActive }" href="javascript:void(0)" aria-expanded="false">
                        <div class="round-16 d-flex align-items-center justify-content-center">
                          <i class="ti ti-circle"></i>
                        </div>
                        <span class="hide-menu">시설업체</span>
                      </a>
                      <ul aria-expanded="false" class="collapse three-level">
                        <li class="sidebar-item">
                          <a href="/management/facility/scheduleList" class="sidebar-link ${facilityScheduleActive }">
                            <div class="round-16 d-flex align-items-center justify-content-center">
                              <i class="ti ti-circle"></i>
                            </div>
                            <span class="hide-menu">점검 관리</span>
                          </a>
                        </li>
                        <li class="sidebar-item">
                          <a href="/management/facility/reportList" class="sidebar-link ${facilityReportActive }">
                            <div class="round-16 d-flex align-items-center justify-content-center">
                              <i class="ti ti-circle"></i>
                            </div>
                            <span class="hide-menu">보고서 관리</span>
                          </a>
                        </li>
                      </ul>
                    </li>
	                <li class="sidebar-item">
	                 <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
	                   <div class="round-16 d-flex align-items-center justify-content-center">
	                     <i class="ti ti-circle"></i>
	                   </div>
	                   <span class="hide-menu">보안업체</span>
	                 </a>
	                 <ul aria-expanded="false" class="collapse three-level">
	                   <li class="sidebar-item">
	                     <a href="/management/security/schedule" class="sidebar-link">
	                       <div class="round-16 d-flex align-items-center justify-content-center">
	                         <i class="ti ti-circle"></i>
	                       </div>
	                       <span class="hide-menu">점검 관리</span>
	                     </a>
	                   </li>
	                   <li class="sidebar-item">
	                     <a href="/management/security/report" class="sidebar-link">
	                       <div class="round-16 d-flex align-items-center justify-content-center">
	                         <i class="ti ti-circle"></i>
	                       </div>
	                       <span class="hide-menu">보고서 관리</span>
	                     </a>
	                   </li>
	                 </ul>
	               </li>                   
                  </ul>
                </li>
                 <li class="sidebar-item">
                  <a href="/management/partner/qna/qnaList" class="sidebar-link ${partnerQnaActive }">
                    <div class="round-16 d-flex align-items-center justify-content-center">
                      <i class="ti ti-circle"></i>
                    </div>
                    <span class="hide-menu">QnA/FAQ</span>
                  </a>
                </li>
                
                
              </ul>
            </li>
          
          
          
          
          
          <!-- 협력업체 관리 끝-->



        <!-- 공항서비스 관리 -->
          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
              <span class="d-flex">
                <i class="ti ti-topology-star-3"></i>
              </span>
              <span class="hide-menu">공항서비스 관리</span>
            </a>
            <ul aria-expanded="false" class="collapse first-level">
              <li class="sidebar-item">
                <a href="/management/customer/airlineReserveList" class="sidebar-link ${airlineReserveDetailActive }">
                  <span class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </span>
                  <span class="hide-menu">항공편 예약 관리</span>
                </a>
              </li>
                <li class="sidebar-item ">
               <a href="javascript:void(0)" class="sidebar-link has-arrow ${cusReserveActive }" aria-expanded="false">
                   <span class="round-16 d-flex align-items-center justify-content-center">
                       <i class="ti ti-circle"></i> 
                   </span>
                   <span class="hide-menu">시설 예약 관리</span>
               </a>
               <ul aria-expanded="false" class="collapse second-level">
                   <li class="sidebar-item">
                       <a href="/management/reserve/reserveManagement" class="sidebar-link ${reserveManagementActive }">
                           <span class="round-16 d-flex align-items-center justify-content-center">
                               <i class="ti ti-minus"></i> 
                           </span>
                           <span class="hide-menu">전체 현황</span>
                       </a>
                   </li>
                   <li class="sidebar-item">
                       <a href="/management/reserve/roungeList" class="sidebar-link ${roungeListActive }">
                           <span class="round-16 d-flex align-items-center justify-content-center">
                               <i class="ti ti-minus"></i> 
                           </span>
                           <span class="hide-menu">라운지</span>
                       </a>
                   </li>
                   <li class="sidebar-item">
                       <a href="/management/reserve/parkingList" class="sidebar-link ${parkingListActive }">
                           <span class="round-16 d-flex align-items-center justify-content-center">
                               <i class="ti ti-minus"></i> 
                           </span>
                           <span class="hide-menu">주차장</span>
                       </a>
                   </li>
                   <li class="sidebar-item">
                       <a href="/management/reserve/hotelList" class="sidebar-link ${hotelListActive }">
                           <span class="round-16 d-flex align-items-center justify-content-center">
                               <i class="ti ti-minus"></i> 
                           </span>
                           <span class="hide-menu">호텔</span>
                       </a>
                   </li>
                   <li class="sidebar-item">
                       <a href="/management/reserve/meetingList" class="sidebar-link ${meetingListActive }">
                           <span class="round-16 d-flex align-items-center justify-content-center">
                               <i class="ti ti-minus"></i> 
                           </span>
                           <span class="hide-menu">회의실</span>
                       </a>
                   </li>
               </ul>
              <li class="sidebar-item ">
               <a href="javascript:void(0)" class="sidebar-link has-arrow ${cusManaActive }" aria-expanded="false">
                   <span class="round-16 d-flex align-items-center justify-content-center">
                       <i class="ti ti-circle"></i> 
                   </span>
                   <span class="hide-menu">고객센터</span>
               </a>
               <ul aria-expanded="false" class="collapse second-level">
                   <li class="sidebar-item">
                       <a href="/management/userNotice/list" class="sidebar-link ${userNoticeActive } ">
                           <span class="round-16 d-flex align-items-center justify-content-center">
                               <i class="ti ti-minus"></i> 
                           </span>
                           <span class="hide-menu">공지사항</span>
                       </a>
                   </li>
                   <li class="sidebar-item">
                       <a href="/management/userQnA/list" class="sidebar-link ${userQnAActive }">
                           <span class="round-16 d-flex align-items-center justify-content-center">
                               <i class="ti ti-minus"></i> 
                           </span>
                           <span class="hide-menu">문의사항</span>
                       </a>
                   </li>
                   <li class="sidebar-item">
                       <a href="/management/userFAQ" class="sidebar-link ${userFAQActive }">
                           <span class="round-16 d-flex align-items-center justify-content-center">
                               <i class="ti ti-minus"></i> 
                           </span>
                           <span class="hide-menu">FAQ</span>
                       </a>
                   </li>
                   <li class="sidebar-item">
                       <a href="/management/popup/list" class="sidebar-link ${popupActive }">
                           <span class="round-16 d-flex align-items-center justify-content-center">
                               <i class="ti ti-minus"></i> 
                           </span>
                           <span class="hide-menu">이벤트 관리</span>
                       </a>
                   </li>
               </ul>
              </li>
              <li class="sidebar-item" id="customerManage">
                <a href="/management/customer/list" class="sidebar-link ${ cusDetailActive }" >
                  <span class="round-16 d-flex align-items-center justify-content-center">
                    <i class="ti ti-circle"></i>
                  </span>
                  <span class="hide-menu">회원 관리</span>
                </a>
              </li>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
      <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
  </aside>
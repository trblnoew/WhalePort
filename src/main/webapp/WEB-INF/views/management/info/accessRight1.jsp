<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>


</style>
<div class="body-wrapper">
    <div class="container-fluid">
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
                <div class="row align-items-center">
                    <div class="col-9">
                        <h4 class="fw-semibold mb-8">접근 권한 관리</h4>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                                </li>
                                <li class="breadcrumb-item" aria-current="page">접근 권한 관리</li>
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
        <!-- start Form with view only -->

        <div class="card">
            <div class="card-header text-bg-primary">
                <h5 class="mb-0 text-white">권한별 메뉴 설정</h5>
            </div>
              <div class="container-fluid d-flex justify-content-center">
			<div class="col-lg-6">
                <div class="card-body">
<!--                   <h5 class="card-title mb-3">JavaScript behavior</h5> -->
                  <div class="row">
                    <div class="col-5">
                      <div class="list-group" id="list-tab" role="tablist">
                        <a class="list-group-item list-group-item-action active" id="list-home-list" data-bs-toggle="list" href="#list-home" role="tab" aria-controls="home">최고관리자</a>
                        <a class="list-group-item list-group-item-action" id="list-profile-list" data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="profile">회원</a>
                        <a class="list-group-item list-group-item-action" id="list-messages-list" data-bs-toggle="list" href="#list-messages" role="tab" aria-controls="messages">사장</a>
                        <a class="list-group-item list-group-item-action" id="list-settings-list" data-bs-toggle="list" href="#list-settings" role="tab" aria-controls="settings">인사관리자</a>
                        <a class="list-group-item list-group-item-action" id="list-box-list" data-bs-toggle="list" href="#list-box" role="tab" aria-controls="box">전산관리자</a>
                        <a class="list-group-item list-group-item-action" id="list-inbox-list" data-bs-toggle="list" href="#list-inbox" role="tab" aria-controls="inbox">협력업체 관리자</a>
                        <a class="list-group-item list-group-item-action" id="list-spam-list" data-bs-toggle="list" href="#list-spam" role="tab" aria-controls="spam">공항서비스 관리자</a>
                      </div>
                    </div>
                    <div class="col-5">
                      <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
                          <div class="card-body" style="width:400px;">
			                <table class="table">
			                    <thead>
			                        <tr>
			                            <th>항목</th>
			                            <th>권한</th>
			                            
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <tr>
			                            <td>홈(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>공지사항(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>마이페이지(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>메신저(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>일정관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>전자결재(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>출입증관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>회원관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>항공편관리(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>조직도(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>근태현황(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>업체관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>시설관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>고객센터(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>환경설정(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                    </tbody>
			                </table>
			            </div>
                        </div>
                        <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
                          <div class="card-body" style="width:400px;">
			                <table class="table">
			                    <thead>
			                        <tr>
			                            <th>항목</th>
			                            <th>권한</th>
			                            
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <tr>
			                            <td>홈(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>공지사항(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>마이페이지(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>메신저(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>일정관리(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>전자결재(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>출입증관리(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>회원관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>항공편관리(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>조직도(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>근태현황(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>업체관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>시설관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>고객센터(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>환경설정(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                    </tbody>
			                </table>
			            </div>
                        </div>
                        <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
                          <div class="card-body" style="width:400px;">
			                <table class="table">
			                    <thead>
			                        <tr>
			                            <th>항목</th>
			                            <th>권한</th>
			                            
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <tr>
			                            <td>홈(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>공지사항(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>마이페이지(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>메신저(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>일정관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>전자결재(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>출입증관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>회원관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>항공편관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>조직도(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>근태현황(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>업체관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>시설관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>고객센터(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>환경설정(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                    </tbody>
			                </table>
			            </div>
                        </div>
                        <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
                          <div class="card-body" style="width:400px;">
			                <table class="table">
			                    <thead>
			                        <tr>
			                            <th>항목</th>
			                            <th>권한</th>
			                            
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <tr>
			                            <td>홈(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>공지사항(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>마이페이지(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>메신저(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>일정관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>전자결재(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>출입증관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>회원관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>항공편관리(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>조직도(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>근태현황(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>업체관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>시설관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>고객센터(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>환경설정(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                    </tbody>
			                </table>
			            </div>
                        </div>
                        <div class="tab-pane fade" id="list-box" role="tabpanel" aria-labelledby="list-box-list">
                          <div class="card-body" style="width:400px;">
			                <table class="table">
			                    <thead>
			                        <tr>
			                            <th>항목</th>
			                            <th>권한</th>
			                            
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <tr>
			                            <td>홈(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>공지사항(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>마이페이지(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>메신저(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>일정관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>전자결재(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>출입증관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>회원관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>항공편관리(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>조직도(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>근태현황(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>업체관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>시설관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>고객센터(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>환경설정(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                    </tbody>
			                </table>
			            </div>
                        </div>
                        <div class="tab-pane fade" id="list-inbox" role="tabpanel" aria-labelledby="list-inbox-list">
                          <div class="card-body" style="width:400px;">
			                <table class="table">
			                    <thead>
			                        <tr>
			                            <th>항목</th>
			                            <th>권한</th>
			                            
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <tr>
			                            <td>홈(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>공지사항(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>마이페이지(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>메신저(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>일정관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>전자결재(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>출입증관리(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>회원관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>항공편관리(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>조직도(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>근태현황(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>업체관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>시설관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>고객센터(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>환경설정(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                    </tbody>
			                </table>
			            </div>
                        </div>
                        <div class="tab-pane fade" id="list-spam" role="tabpanel" aria-labelledby="list-spam-list">
                          <div class="card-body" style="width:400px;">
			                <table class="table">
			                    <thead>
			                        <tr>
			                            <th>항목</th>
			                            <th>권한</th>
			                            
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <tr>
			                            <td>홈(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>공지사항(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>마이페이지(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>메신저(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>일정관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>전자결재(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>출입증관리(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>회원관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>항공편관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>조직도(0/1)</td>
			                            <td><input type="checkbox" ></td>
			                        </tr>
			                        <tr>
			                            <td>근태현황(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>업체관리(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>시설관리(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                        <tr>
			                            <td>고객센터(0/1)</td>
			                            <td><input type="checkbox"></td>
			                        </tr>
			                        <tr>
			                            <td>환경설정(1/1)</td>
			                            <td><input type="checkbox" checked></td>
			                        </tr>
			                    </tbody>
			                </table>
			            </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="text-end">
            <button type="button" id="udtBtn" name="udtBtn" class="btn btn-primary" onclick="location.href='/info/accessRight2'">수정</button> 
            </div>
                </div>
              </div>
            </div>
        </div>
        <!-- end Form with view only -->
    </div>
</div>

<script type="text/javascript">
$(function(){
	var udtBtn = $("#udtBtn");


	udtBtn.on("click", function() {
		udtBtn.submit();

    });
</script>


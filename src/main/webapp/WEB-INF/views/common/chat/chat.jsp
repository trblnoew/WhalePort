<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">
<style>
   .app-chat{
       height: 614px;
       overflow-y : auto;
   }
   .app-chat::-webkit-scrollbar {
      width: 8px;
   }
   .app-chat::-webkit-scrollbar-thumb {
      background-color : #888;
      border-radius: 10px;
   }
   .app-chat::-webkit-scrollbar-thumb:hover {
      background-color : #555;
   }
   .app-chat::-webkit-scrollbar-track {
      background : #f1f1f1;
      border-radius: 10px;
   }
   
   
   #toast_message {
    opacity: 0;
    position: fixed;
    bottom: -100px;
    left: 50%;
    transform: translate(-50%, 0);
    padding: 5px 20px; /* 패딩을 줄임 */
    background: rgba(0, 0, 0, 0.70);
    border-radius: 100px;
    color: #fff;
    box-shadow: 3px 4px 11px 3px #00000040;
    transition: all 0.5s;
}
/*토스트 메시지 활성화 되었을 때*/
   #toast_message.active {
       opacity: 100%;
       bottom: 50px;
   }
   
   .select2-container{
      z-index : 9999;
   }
      /* 스크롤바 스타일 */
   .chat-box-inner::-webkit-scrollbar {
       width: 8px; /* 스크롤바 너비 */
   }
   
   .chat-box-inner::-webkit-scrollbar-thumb {
       background-color: #888; /* 스크롤바 색상 */
       border-radius: 10px; /* 스크롤바 둥글게 */
   }                 
   
   .chat-box-inner::-webkit-scrollbar-thumb:hover {
       background-color: #555; /* 스크롤바 호버 색상 */
   }
   
   .chat-box-inner::-webkit-scrollbar-track {
       background: #f1f1f1; /* 스크롤바 배경 색상 */
       border-radius: 10px; /* 스크롤바 트랙 둥글게 */
   }
   
   
</style>
<script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/forms/select2.init.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/select2/dist/css/select2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<div class="body-wrapper">
        <div class="container-fluid">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">메신저</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">메신저</li>
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
          <div class="card chat-application" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); width:80%; margin: 20px auto;"> 
            <div class="d-flex align-items-center justify-content-between gap-6 m-3 d-lg-none">
              <button class="btn btn-primary d-flex" type="button" data-bs-toggle="offcanvas" data-bs-target="#chat-sidebar" aria-controls="chat-sidebar">
                <i class="ti ti-menu-2 fs-5"></i>
              </button>
              <form class="position-relative w-100">
                <input type="text" class="form-control search-chat py-2 ps-5" id="" placeholder="Search Contact" />
                <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
              </form>
            </div>
            <div class="d-flex">
              <div class="w-30 d-none d-lg-block border-end user-chat-box">
                <div class="px-4 pt-9 pb-6">
                  <div class="d-flex align-items-center justify-content-between mb-3">
                    <div class="d-flex align-items-center">
                      <div class="position-relative">
                        <img src="${user.empImage }" alt="user1" width="54" height="54" class="rounded-circle" />
                        <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-success">
                          <span class="visually-hidden">New alerts</span>
                        </span>
                      </div>
                      <div class="ms-3">
                        <h6 class="fw-semibold mb-2" id="userName">${user.empName }</h6>
                        <p class="mb-0 fs-2">${user.empDept }</p>
                      </div>
                    </div>

                  </div>
                  <form class="position-relative mb-4">
                    <input type="text" class="form-control search-chat py-2 ps-5 searchChat" id="text-srh" placeholder="Search Contact"/>
                    <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3 searchChats"></i>
                  </form>
                  <div class="dropdown">
                    <a class="text-muted fw-semibold d-flex align-items-center" href="javascript:void(0)" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Chatting Type<i class="ti ti-chevron-down ms-1 fs-5"></i>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a class="dropdown-item" href="javascript:void(0)" id="sgChat" data-type="s">Single Chat</a>
                      </li>
                      <li>
                        <a class="dropdown-item border-bottom" href="javascript:void(0)" id="mtChat" data-type="m">Multi Chat</a>
                      </li>
                    </ul>
                  </div>
                 
                </div>
                <div class="app-chat">
                  <ul class="chat-users mb-0 mh-n100" id="singleMsg" data-simplebar>
                  </ul>
                </div>
              </div>
              <div class="w-70 w-xs-100 chat-container">
                <div class="chat-box-inner-part h-100">

                  <div class="chatting-box d-block">
                    <div class="p-9 border-bottom chat-meta-user d-flex align-items-center justify-content-between">
                      <div class="other">
                         <div class="hstack gap-3 current-chat-user-name">
                           <div class="position-relative">
                           </div>
                           <div>
                             <h6 class="mb-1 name fw-semibold"></h6>
                             <p class="mb-0" class=""></p>
                           </div>
                         </div>
                      </div>
                      <ul class="list-unstyled mb-0 d-flex align-items-center">
                        <li>
                          <a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5" href="javascript:void(0)">
                            <i class="ti ti-phone" id="makeRoom">
                               
                            </i>
                          </a>
                        </li>
                        <li>
                          <a class="chat-menu text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5" href="javascript:void(0)">
                            <i class="ti ti-menu-2 createGroup"></i>
                          </a>
                        </li>
                      </ul>
                    </div>
                    <div class="d-flex parent-chat-box">
                      <div class="chat-box w-xs-100">
                        <div class="chat-box-inner p-9" style="overflow-y : auto;">
                          <div class="chat-list active-chat">
                           
                          </div>
                          
                        </div>
                        <div class="px-9 py-6 border-top chat-send-message-footer">
                          <div class="d-flex align-items-center justify-content-between">
                            <div class="d-flex align-items-center gap-2 w-85">
                              <a class="position-relative nav-icon-hover z-index-5" href="javascript:void(0)">
                                <i class="ti ti-mood-smile text-dark bg-hover-primary fs-7"></i>
                              </a>
                              <input type="text" class="form-control message-type-box text-muted border-0 p-0 ms-2" placeholder="Type a Message" id="msgBox"/>
                            </div>
                            <ul class="list-unstyledn mb-0 d-flex align-items-center">
                              <li>
                                <a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5" href="javascript:void(0)">
                                  <i class="ti ti-photo-plus"></i>
                                </a>
                              </li>
                              <li>
                                <a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5" href="javascript:void(0)">
                                  <i class="ti ti-paperclip"></i>
                                </a>
                              </li>
                              <li>
                                <a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5" href="javascript:void(0)">
                                  <i class="ti ti-microphone"></i>
                                </a>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <div class="app-chat-offcanvas border-start">
                        <div class="custom-app-scroll mh-n100" data-simplebar>
                          <div class="p-3 d-flex align-items-center justify-content-between">
                            <h6 class="fw-semibold mb-0 text-nowrap">
                              Online User <span class="text-muted" id="liveUsers"></span>
                            </h6>
                            <a class="chat-menu d-lg-none d-block text-dark fs-6 bg-hover-primary nav-icon-hover position-relative z-index-5" href="javascript:void(0)">
                              <i class="ti ti-x"></i>
                            </a>
                          </div>
                          <div class="offcanvas-body p-9">
                     <div id="userList"></div>
                           
                            <div class="files-chat">
                              <h6 class="fw-semibold mb-3 text-nowrap">
                                Offline User <span class="text-muted" id="unLiveUsers"></span>
                              </h6>
                              <div id="unUserList"></div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
   
   
   <div class="modal fade" id="rejectContactModal" role="dialog" aria-labelledby="rejectContactModalTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header d-flex align-items-center">
                                        <h5 class="modal-title">그룹채팅 생성</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>방 제목</p>
                                        <textarea class="form-control" id="roomName" name="empReject" rows="1" placeholder="방 제목을 입력해주세요."></textarea>
                                        <div id="employees" style="z-index: -1;">
                                        </div>
                                        <div class="card-body">
                                         <p>메신저 초대</p>
                                         <select class="select2 form-control" id="select2" multiple="multiple">
                                         
											    <optgroup label="인사부">
											        <c:forEach items="${mems}" var="member">
											        <c:if test="${member.empId ne user.empId}">
											            <c:if test="${fn:contains(member.empDept, '인사')}">
											                <option value="${member.empId}">${member.empName}</option>
											            </c:if>
											        </c:if>
											        </c:forEach>
											    </optgroup>
											    
											    <optgroup label="전산부">
											        <c:forEach items="${mems}" var="member">
											        <c:if test="${member.empId ne user.empId}">
											            <c:if test="${fn:contains(member.empDept, '전산')}">
											                <option value="${member.empId}">${member.empName}</option>
											            </c:if>
											        </c:if>
											        </c:forEach>
											    </optgroup>
											    
											    <optgroup label="협력업체 관리부">
											        <c:forEach items="${mems}" var="member">
											        <c:if test="${member.empId ne user.empId}">
											            <c:if test="${fn:contains(member.empDept, '협력')}">
											                <option value="${member.empId}">${member.empName}</option>
											            </c:if>
											        </c:if>
											        </c:forEach>
											    </optgroup>
											    
											    <optgroup label="공항서비스 관리부">
											        <c:forEach items="${mems}" var="member">
											            <c:if test="${fn:contains(member.empDept, '공항')}">
											                <option value="${member.empId}">${member.empName}</option>
											            </c:if>
											        </c:forEach>
											        
											    </optgroup>
											</select>

                                       </div>

                                        
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-outline-primary" data-bs-dismiss="modal">취소</button>
                                        <button id="crRoom" class="btn btn-primary" >확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="member">
                           <c:forEach var="mem" items="${mems }">
                           <div class="memLists"> 
                              <div class="mpId">${mem.empId }</div>
                              <div class="mpDept">${mem.empDept }</div>
                           </div>
                           </c:forEach>
                        </div>
                        <div id="toast_message">토스트 메시지 입니다!</div>
                        
<script type="text/javascript">

$(function(){
   $('.member').hide();
   let myId = '${user.empId}';
   console.log('myId::'+myId);
   let webSocket;
   let chatList = $('.app-chat');
   let chatBox = $('.active-chat');
   let msgBox = $('#msgBox');
   var roomType = "s";
   var roomNo;
   var rejectModal = new bootstrap.Modal($("#rejectContactModal")[0]);
   var myImage = '${user.empImage }';
   

   // 채팅메시지가 있으면 보낸다.
   msgBox.on('keyup', enterKey);
   
   $('.searchChats').on('click',function(){
      singleRecentMsg();
   });
   
   // websocket 연결
   connect();
   
   $('#myId').html(myId);
   
   //onlineUser, offlineUser on/off button
   $("body").on("click", ".chat-menu", function () {
      
        $(".parent-chat-box").toggleClass("app-chat-right");
        $(this).toggleClass("app-chat-active");
   });
   
   // OnlineUser, OfflineUser를 클릭했을때 실행되는 function
   $('#rejectBtn').on('click',function(){
      
      
           
    });
   
   $(this).on('change','.selBox', function(){
        var booseo = $(this).val();
        console.log('booseo :: '+booseo);
      if(booseo == "0") {
         $(this).closest('tr').find('.memText').attr('disabled', true);
      } else {
         $(this).closest('tr').find('.memText').attr('disabled', false);
      }
      $('.memText').val('');   
      
     
   });

   $(this).on('click','#crRoom',function(){
      
      
      
      rejectModal.hide();
      $.ajax({
         type : 'post',
         url : '/common/createMtRoom',
         data : JSON.stringify({
            myId : myId,
            userId : JSON.stringify($('#select2').val()),
            roomName : $('#roomName').val() 
         }),
         contentType : 'application/json; charset=utf-8',
         success : function(res){
                webSocket.send(JSON.stringify({ type: "alarm", userId: res}));
            
         }
         
      });
      
   });
   
   

   
   
//    $(this).on('click', '.addMem', function(){
      
//       var appendHtml = `<li class="select2-selection__choice" title="South Dakota" data-select2-id="select2-data-4-ado8">
//       <button type="button" class="select2-selection__choice__remove" tabindex="-1" title="Remove item" aria-label="Remove item" aria-describedby="select2-we1r-container-choice-53o7-SD">
//          <span aria-hidden="true">×</span>
//       </button>
//       <span class="select2-selection__choice__display" id="select2-we1r-container-choice-53o7-SD">\${$('.memText').val()}</span>
//                   </li>`;
      
//       var inlineHtml = '<option value="SD" selected="" data-select2-id="select2-data-3-g5a8">' + $('.memText').val() +'</option>';
      
//       $('.mems').append(inlineHtml);
//       $('.select2-selection__rendered').append(appendHtml);
      
//    });
   
   // group room create
   $(this).on('click','#makeRoom',function(){
      
        rejectModal.show();
        
   });
   
   $(this).on('click','#sgChat',function(){
      roomType = $(this).data('type');
      singleRecentMsg();
   });
   
   // 멀티채팅방을 불러오는 field
   $(this).on('click','#mtChat',function(){
      roomType = $(this).data('type');
      multiRecentMsg();
      
   });
   
   $(this).on('click','.selectUser',function(){
      var empNo = $(this).data('empno');
      var empId = $(this).data('empid');
      roomNo = $(this).data('roomno');
      var otherImage = $(this).data('otherimage');
      var uName = $(this).data('username');
      
//       console.log('roomNO ::: ' + roomNo);

      // 이 사람과 1:1채팅방이 있는가?
      if(roomNo === 0){
         let userList = [];
         userList.push(myId);
         userList.push(empId);
         console.log('create room');
         
         $.ajax({
            url : '/common/createRoom',
            type : 'post',
            data : JSON.stringify(userList),
            contentType : 'application/json; charset=utf-8',
            success : function(res){
               webSocket.send(JSON.stringify({type : "refresh"}));
               console.log('res ::: '+ res);
               roomNo = res;
            }
            
         });
      } else {
         
        
      }
      getMsg(roomNo, otherImage, uName);
   });
   
   function getMsg(roomNo, otherImage, uName){
	   $.ajax({
           url : '/common/getMsg',
           type : 'get',
           data : { roomNo : roomNo },
           success : function(res){
              if(res.length == 0){
                 chatBox.html('');
              } else {
                 var chatHtml = "";
                 var appendImage = "";
                 for(var i = 0 ; i < res.length; i++){
                    if(res[i].chatSender === myId){
                       chatHtml += `<div class="hstack gap-3 align-items-start mb-7 justify-content-end">
                                 <div class="text-end">
                                   <h6 class="fs-2 text-muted">\${res[i].chatDate}</h6>
                                   <div class="p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3">
                                     \${res[i].chatMsg}
                                   </div>
                                 </div>
                               </div>`;
                               
                    } else {
                       chatHtml += `<div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                                   <img src="\${res[i].userImage}\" alt="user8" width="40" height="40" class="rounded-circle" />
                                   <div>
                                     <h6 class="fs-2 text-muted">
                                       \${res[i].userName}, \${res[i].chatDate}
                                     </h6>
                                     <div class="p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3">
                                       \${res[i].chatMsg}
                                     </div>
                                   </div>
                                 </div>`;
                    }
                 }
                 
                 chatBox.html(chatHtml);
                 $(".user-chat-box .chat-user").removeClass("bg-light-subtle");
                  $(this).addClass("bg-light-subtle");
              }
              appendImage = `
                  <div class="hstack gap-3 current-chat-user-name">
                      <div class="position-relative">
                      <img src="\${otherImage}\" alt="X" width="48" height="48" class="rounded-circle" />
                    </div>
                    <div>
                      <h6 class="mb-1 name fw-semibold"></h6>
                      <p class="mb-0" class="">\${uName}</p>
                    </div>
                  </div>`;
              $('.other').html(appendImage);
           }
           
           
        });
   }   
   // 엔터키 이벤트 생성
   function enterKey(event) {
        if(msgBox.val().trim() == "") {
            return false;
        }
        if (event.keyCode == 13) {
            send();
        }
    }
   function multiRecentMsg(){
      $.ajax({
         type : 'get',
         url : '/common/multiRecentMsg',
         data : { userId : myId },
         success : function(res){
            var multiHtml = "";
            for(var i = 0; i < res.length ; i++){
               multiHtml += `<li>
                      <a href="javascript:void(0)" class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user selectUser" data-roomno="\${res[i].roomNo}">
                        <div class="d-flex align-items-center">
                          <span class="position-relative">
                            <img src="${pageContext.request.contextPath }/resources/assets/images/profile/default.png" alt="user-8" width="48" height="48" class="rounded-circle" />
                          </span>
                          <div class="ms-3 d-inline-block w-75">
                            <h6 class="mb-1 fw-semibold chat-title">
                              \${res[i].roomName}
                            </h6>
                            <span class="fs-3 text-truncate text-body-color d-block">\${res[i].chatSender} : \${res[i].chatMsg}</span>
                          </div>
                        </div>
                        <p class="fs-2 mb-0 text-muted">\${res[i].chatDate}</p>
                      </a>
                    </li>`
            }
            $('#singleMsg').html(multiHtml);
            
         }
         
      });
   }
   
   function singleRecentMsg(){
      $.ajax({
         type : 'post',
         url : '/common/singleRecentMsg',
         data : JSON.stringify({ 
            userId : myId,
            searchWord : $('.searchChat').val()
         }),
         contentType : 'application/json; charset=utf-8',
         success : function(res){
            var singleHtml = "";
//             singleHtml = "<ul class='chat-users mb-0 mh-n100 simplebar-scrollable-y'>";
            for(var i = 0; i < res.length ; i++){
               singleHtml += `<li>
                      <a href="javascript:void(0)" class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user selectUser" data-roomno="\${res[i].roomNo}" data-user="\${res[i].otherUserId}" data-otherimage="\${res[i].userImage}" data-username="\${res[i].userName}\">
                        <div class="d-flex align-items-center">
                          <span class="position-relative">
                            <img src="\${res[i].userImage}\" alt="user" width="48" height="48" class="rounded-circle" />
                          </span>
                          <div class="ms-3 d-inline-block w-75">
                            <h6 class="mb-1 fw-semibold chat-title sgId">
                              \${res[i].userName} \${res[i].userPosition}
                            </h6>
                            <span class="fs-3 text-truncate text-body-color d-block sgContent">\${res[i].chatMsg}</span>
                          </div>
                        </div>
                        <p class="fs-2 mb-0 text-muted">\${res[i].chatDate}</p>
                      </a>
                    </li>`
            }
//             singleHtml += "</ul>";
            $('#singleMsg').html(singleHtml);
         }
         
      });   
   }
   
   // 메시지를 websocket으로 보내고, db에도 넣는 function
   function send() {
        let msg = msgBox.val();
        var msgData = JSON.stringify({
            chatSender : myId,
            chatMsg : msg,
            roomNo : roomNo
        });
        
        var today = new Date();   

        var hours = ('0' + today.getHours()).slice(-2); 
        var minutes = ('0' + today.getMinutes()).slice(-2);
        var seconds = ('0' + today.getSeconds()).slice(-2); 

        var timeString = hours + ':' + minutes  + ':' + seconds;
        
        $.ajax({
            type: 'post',
            url: '/common/sendMsg',
            data: msgData,
            contentType: 'application/json; charset=utf-8',
            success: function(res) {
                  // JSON 형식으로 메시지를 전송
               webSocket.send(JSON.stringify({ type: "chat", userId: myId , message: msg , date : timeString, senderRoom : res, myImage : myImage, userName : $('#userName').text() }));          
               console.log('Message sent and stored.');
            }
        });
        msgBox.val('');
    }
   
   
   let userData;
   function fMessage(event) {
      let data;    
        try {
            data = JSON.parse(event.data); // JSON 형식으로 파싱
        } catch (error) {
            console.error("Error parsing JSON:", error);
            return; // 파싱 에러 발생 시 함수 종료
        }
        
        if (data.type === "userList") {
         userData = data.list;
         sessionUser(userData);
         singleRecentMsg();
        } else if (data.type === "chat") {
            // 일반 메시지 처리
            if(data.senderRoom === roomNo){
            var msgHtml = "";
           if(data.userId === myId){
              msgHtml = `<div class="hstack gap-3 align-items-start mb-7 justify-content-end">
                    <div class="text-end">
                      <h6 class="fs-2 text-muted">\${data.date}</h6>
                      <div class="p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3">
                        \${data.message}
                      </div></div></div>`;
         } else {
            msgHtml = `<div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                      <img src="\${data.myImage}\" alt="user" width="40" height="40" class="rounded-circle" />
                      <div>
                        <h6 class="fs-2 text-muted">
                          \${data.userName}, \${data.date}
                        </h6>
                        <div class="p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3">
                          \${data.message}
                        </div></div></div>`;
         } 
			chatBox.append(msgHtml);
			$('.chat-box-inner.p-9').scrollTop($('.chat-box-inner.p-9')[0].scrollHeight);
        }
         
        } else if(data.type === "refresh") {
			sessionUser(userData);
        } else if(data.type === "alarm") {
			toastOn(data.userId);   
        } 
        
      //메시지 최신화
        if(roomType === "s"){
			singleRecentMsg();
        } else if(roomType === "m"){
			multiRecentMsg();
        }
        
    }

   function toastOn(res){
      if(res === myId){
         $('#toast_message').html('방 생성이 완료되었습니다.');
      } else {
         $('#toast_message').html(res + '님이 방을 생성하셨습니다.');
      }
      
      $('#toast_message').addClass('active');
       
       setTimeout(function(){
          $('#toast_message').removeClass('active');
       },2000);
   }
   
   function sessionUser(userData){
      $.ajax({
           url : '/common/sessionUser',
           type : 'post',
           data : JSON.stringify({
              userList : userData,
              sessionUserId : myId
           }),
           contentType : 'application/json; charset=utf-8',
           success : function(res){
              updateUserList(res.users);
              updateUnUserList(res.unUsers);
           }
        });
   }
   
   // 유저 리스트 업데이트 함수(OnlineUser)
    function updateUserList(users) {
        let userListHtml = "";
      let memInviteHtml = "";
        users.forEach(user => {
         userListHtml += "<div class='hstack gap-3 file-chat-hover justify-content-between text-nowrap mb-9 selectUser' style='cursor: pointer;' data-empno='"+ user.empNo + "' data-empid='"+ user.empId + "' data-roomno='"+ user.roomNo + "' data-otherimage='"+ user.empImage +"' data-username='"+ user.empName +"'>"; 
         userListHtml += "<div class='d-flex align-items-center gap-3'>"; 
         userListHtml +=    "<div class='rounded-1 text-bg-light p-6'>"; 
         userListHtml +=       "<img src='" + user.empImage + "' alt='no-image' width='24' height='24' />";
         userListHtml +=    "</div>";
         userListHtml += "<div>";
         userListHtml += "<h6 class='fw-semibold'>" + user.empName + "</h6>";
         userListHtml += "<div class='d-flex align-items-center gap-3 fs-2 text-muted'>";
         userListHtml += "<span>" + user.empDept + "</span>";
         userListHtml += "<span>" + user.empPosition + "</span>";
         userListHtml += "</div>";
         userListHtml += "</div>";
         userListHtml += "</div>";
         userListHtml += "<span class='position-relative nav-icon-hover download-file'>";
//          unUserListHtml += "<i class='ti ti-download text-dark fs-6 bg-hover-primary'></i>";
         userListHtml += "</span></div>";
      });
        $('#userList').html(userListHtml);
        $('#liveUsers').html("("+users.length+")");
   }
   
    // 유저 리스트 업데이트 함수(OfflineUser)
   function updateUnUserList(unUsers){
   let unUserListHtml = "";
   let unMemInviteHtml = "";
      unUsers.forEach(unUser => {
         unUserListHtml += "<div class='hstack gap-3 file-chat-hover justify-content-between text-nowrap mb-9 selectUser' style='cursor: pointer;' data-empno='"+ unUser.empNo + "' data-empid='"+ unUser.empId + "' data-roomno='"+ unUser.roomNo + "' data-otherimage='"+ unUser.empImage +"' data-username='"+ unUser.empName +"'>"; 
         unUserListHtml += "<div class='d-flex align-items-center gap-3'>"; 
         unUserListHtml +=    "<div class='rounded-1 text-bg-light p-6'>"; 
         unUserListHtml +=       "<img src='" + unUser.empImage + "' alt='no-image' width='24' height='24' />";
         unUserListHtml +=    "</div>";
         unUserListHtml += "<div>";
         unUserListHtml += "<h6 class='fw-semibold'>" + unUser.empName + "</h6>";
         unUserListHtml += "<div class='d-flex align-items-center gap-3 fs-2 text-muted'>";
         unUserListHtml += "<span>" + unUser.empDept + "</span>";
         unUserListHtml += "<span>" + unUser.empPosition + "</span>";
         unUserListHtml += "</div>";
         unUserListHtml += "</div>";
         unUserListHtml += "</div>";
         unUserListHtml += "<span class='position-relative nav-icon-hover download-file'>";
//          unUserListHtml += "<i class='ti ti-download text-dark fs-6 bg-hover-primary'></i>";
         unUserListHtml += "</span></div>";
         
      });
      
        // 유저 리스트를 표시할 HTML 요소에 삽입
        
        $('#unUserList').html(unUserListHtml);
        $('#unLiveUsers').html("("+unUsers.length+")");
    }
   
   function connect() {
        webSocket = new WebSocket("ws://192.168.36.61/ws-chat?userId=" + myId);
        
        webSocket.onopen = function() {
            console.log("WebSocket connection established");
            singleRecentMsg();
        };

        webSocket.onmessage = fMessage;

        webSocket.onerror = function(event) {
            console.error("WebSocket error observed:", event);
            disconnect();
        };
      
        
        webSocket.onclose = function(event) {
            console.log("WebSocket connection clo11sed:", event);
            
        };
    }
   
   function disconnect() {
        if (webSocket) {
            webSocket = null;
            
        }
    }
});

</script>
</html>
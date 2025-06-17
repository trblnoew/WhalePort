<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<style>
  body {
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* 전체 화면 높이를 채우기 위해 설정 */
  }

  footer {
    margin-top: auto; /* 푸터를 아래로 밀어내기 위해 추가 */
  }
</style>
 <footer>
    <div class="container-fluid">
      <div class="border-bottom">
      <div class="d-flex justify-content-between py-7 flex-md-nowrap flex-wrap gap-sm-0 gap-3">
        <div class="d-flex gap-3 align-items-center">
          <img src="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" alt="icon" width="50" height="auto">
          <p class="fs-4 mb-0">All rights reserved by WhalePort. </p>
        </div>
      </div>
    </div>
    </div>
  </footer>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/quill/dist/quill.snow.css">
<div class="body-wrapper">
	<div class="container-fluid">
		<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
			<div class="card-body px-4 py-3">
				<div class="row align-items-center">
					<div class="col-9">
						<h4 class="fw-semibold mb-8">WhalePort Email</h4>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
								</li>
								<li class="breadcrumb-item" aria-current="page">WhalePort Email</li>
							</ol>
						</nav>
					</div>
					<div class="col-3">
						<div class="text-center mb-n5">
							<img src="${pageContext.request.contextPath }/resources/assets/images/breadcrumb/ChatBc.png"
								alt="modernize-img" class="img-fluid mb-n4" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card overflow-hidden chat-application">
			<div class="d-flex align-items-center justify-content-between gap-6 m-3 d-lg-none">
				<button class="btn btn-primary d-flex" type="button" data-bs-toggle="offcanvas" data-bs-target="#chat-sidebar"
					aria-controls="chat-sidebar">
					<i class="ti ti-menu-2 fs-5"></i>
				</button>
				<form class="position-relative w-100">
					<input type="text" class="form-control search-chat py-2 ps-5" id="text-srh" placeholder="Search Contact" />
						<i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
				</form>
			</div>
			<div class="d-flex w-100">
				<div class="left-part border-end w-20 flex-shrink-0 d-none d-lg-block">
                <div class="px-9 pt-4 pb-3">
                  <button type="button" class="btn btn-primary fw-semibold py-8 w-100" id="writeEmail">메일 쓰기</button>
                </div>
                <ul class="list-group mh-n100" data-simplebar>
                  <li class="list-group-item border-0 p-0 mx-9">
                    <a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/common/email">
                      <i class="ti ti-file-text fs-5"></i>전체 메일함
                    </a>
                  <li class="list-group-item border-0 p-0 mx-9">
                    <a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="javascript:void(0)">
                      <i class="ti ti-inbox fs-5"></i>받은 메일함
                    </a>
                  </li>
                  <li class="list-group-item border-0 p-0 mx-9">
                    <a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="javascript:void(0)">
                      <i class="ti ti-brand-telegram fs-5"></i>보낸 메일함
                    </a>
                  </li>
                  <li class="list-group-item border-0 p-0 mx-9">
                    <a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="javascript:void(0)">
                      <i class="ti ti-star fs-5"></i>중요 메일함
                    </a>
                  </li>
                  <li class="list-group-item border-0 p-0 mx-9">
                    <a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="javascript:void(0)">
                      <i class="ti ti-trash fs-5"></i>휴지통
                    </a>
                  </li>
                </ul>
              </div>
				<div class="d-flex w-100">
					<div class="card flex-fill">
						<!-- Changed here to flex-fill -->
						<div class="border-bottom title-part-padding">
							<h4 class="card-title mb-0">메일 쓰기</h4>
						</div>
						<div class="card-body">
							<form class="mt-0" method="post">
								<input type="text" class="form-control" placeholder="whaleport@naver.com" readonly="readonly" disabled="disabled"><br/>
								<input type="text" class="form-control" placeholder="송신자 메일을 입력하세요."><br/>
								<input type="text" class="form-control" placeholder="제목을 입력하세요."><br/>
								<div id="editor">
									<p>내용을 입력하세요.</p>
								</div>
								<br/> 
								<input class="form-control" type="file" id="formFile">
								<br/>
								<div class="d-flex justify-content-end">
								<a href="${pageContext.request.contextPath }/common/email" class="btn btn-outline-primary me-3">이전</a>
								<a href="" class="btn btn-primary">등록</a>
							</div>
							</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
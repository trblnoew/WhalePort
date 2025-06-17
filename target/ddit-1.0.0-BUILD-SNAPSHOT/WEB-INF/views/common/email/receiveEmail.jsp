<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">
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
									<a class="text-muted text-decoration-none" href="../main/index.html">Home</a></li>
								<li class="breadcrumb-item" aria-current="page">받은 메일함</li>
							</ol>
						</nav>
					</div>
					<div class="col-3">
						<div class="text-center mb-n5">
							<img src="${pageContext.request.contextPath }/resources/assets/images/breadcrumb/ChatBc.png" alt="modernize-img" class="img-fluid mb-n4" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card overflow-hidden chat-application">
			<div class="d-flex align-items-center justify-content-between gap-6 m-3 d-lg-none">
				<button class="btn btn-primary d-flex" type="button" data-bs-toggle="offcanvas" data-bs-target="#chat-sidebar" aria-controls="chat-sidebar">
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
							<a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/common/entireEmail">
								<i class="ti ti-file-text fs-5"></i>
									전체 메일함
							</a>
						<li class="list-group-item border-0 p-0 mx-9">
							<a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/common/receiveEmail"> 
								<i class="ti ti-inbox fs-5"></i>
									받은 메일함
							</a>
						</li>
						<li class="list-group-item border-0 p-0 mx-9">
							<a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/common/sendEmail">
								<i class="ti ti-brand-telegram fs-5"></i>
									보낸 메일함
							</a>
						</li>
						<li class="list-group-item border-0 p-0 mx-9">
							<a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/common/importantEmail">
								<i class="ti ti-star fs-5"></i>
									중요 메일함
							</a>
						</li>
						<li class="list-group-item border-0 p-0 mx-9">
							<a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/common/trashEmail">
								<i class="ti ti-trash fs-5"></i>
									휴지통
							</a>
						</li>
					</ul>
				</div>
				<div class="d-flex w-100">
					<div class="min-width-340">
						<div class="border-end user-chat-box h-100">
							<div class="px-4 pt-9 pb-6 d-none d-lg-block">
								<form class="position-relative">
									<input type="text" class="form-control search-chat py-2 ps-5"
										id="text-srh" placeholder="Search" /> <i
										class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
								</form>
							</div>
							<div class="app-chat">
								<ul class="chat-users mh-n100" data-simplebar>
									<li><a href="javascript:void(0)"
										class="px-4 py-3 bg-hover-light-black d-flex align-items-start chat-user bg-light-subtle"
										id="chat_user_1" data-user-id="1">
											<div class="form-check mb-0">
												<input class="form-check-input" type="checkbox" value=""
													id="flexCheckDefault" />
											</div>
											<div class="position-relative w-100 ms-2">
												<div
													class="d-flex align-items-center justify-content-between mb-2">
													<h6 class="mb-0">James Smith</h6>
												</div>
												<h6 class="fw-semibold text-dark">Kindly check this
													latest updated</h6>
												<div
													class="d-flex align-items-center justify-content-between">
													<div class="d-flex align-items-center">
														<span> <i class="ti ti-star fs-4 me-2 text-dark"></i>
														</span>
													</div>
													<p class="mb-0 fs-2 text-muted">04:00pm</p>
												</div>
											</div>
									</a></li>
									<li><a href="javascript:void(0)"
										class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user"
										id="chat_user_2" data-user-id="2">
											<div class="form-check mb-0">
												<input class="form-check-input" type="checkbox" value=""
													id="flexCheckDefault1" />
											</div>
											<div class="position-relative w-100 ms-2">
												<div
													class="d-flex align-items-center justify-content-between mb-2">
													<h6 class="mb-0">Katherine Flintoff</h6>
												</div>
												<h6 class="fw-semibold text-dark">Newsletter from
													AdminMart Team</h6>
												<div
													class="d-flex align-items-center justify-content-between">
													<div class="d-flex align-items-center">
														<span> <i class="ti ti-star fs-4 me-2 text-warning"></i>
														</span>
													</div>
													<p class="mb-0 fs-2 text-muted">04:00pm</p>
												</div>
											</div>
									</a></li>
									<li><a href="javascript:void(0)"
										class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user"
										id="chat_user_3" data-user-id="3">
											<div class="form-check mb-0">
												<input class="form-check-input" type="checkbox" value=""
													id="flexCheckDefault2" />
											</div>
											<div class="position-relative w-100 ms-2">
												<div
													class="d-flex align-items-center justify-content-between mb-2">
													<h6 class="mb-0">Bianca Macdowells</h6>
												</div>
												<h6 class="text-dark">Kindly check this latest updated
												</h6>
												<div
													class="d-flex align-items-center justify-content-between">
													<div class="d-flex align-items-center">
														<span> <i class="ti ti-star fs-4 me-2 text-muted"></i>
														</span>
													</div>
													<p class="mb-0 fs-2 text-muted">04:00pm</p>
												</div>
											</div>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="w-100">
						<div class="chat-container h-100 w-100">
							<div class="chat-box-inner-part h-100">
								<div class="chatting-box app-email-chatting-box">
									<div class="p-9 py-3 border-bottom chat-meta-user">
										<ul class="list-unstyled mb-0 d-flex align-items-center">
											<li class="d-lg-none d-block"><a
												class="text-dark back-btn px-2 fs-5 bg-hover-primary nav-icon-hover position-relative z-index-5"
												href="javascript:void(0)"> <i class="ti ti-arrow-left"></i>
											</a></li>
											<li class="position-relative" data-bs-toggle="tooltip"
												data-bs-placement="top" data-bs-title="Star"><a
												class="text-dark px-2 fs-5 bg-hover-primary nav-icon-hover position-relative z-index-5"
												href="javascript:void(0)"> <i class="ti ti-star"></i>
											</a></li>
											<li class="position-relative" data-bs-toggle="tooltip"
												data-bs-placement="top" data-bs-title="Delete"><a
												class="text-dark px-2 fs-5 bg-hover-primary nav-icon-hover position-relative z-index-5"
												href="javascript:void(0)"> <i class="ti ti-trash"></i>
											</a></li>
										</ul>
									</div>
									<div class="position-relative overflow-hidden">
										<div class="position-relative">
											<div class="chat-box email-box mh-n100 p-9"
												data-simplebar="init">
												<div class="chat-list chat active-chat" data-user-id="1">
													<div
														class="hstack align-items-start mb-7 pb-1 align-items-center justify-content-between flex-wrap gap-6">
														<div class="d-flex align-items-center gap-2">
															<img
																src="${pageContext.request.contextPath }/resources/assets/images/profile/user-8.jpg"
																alt="user8" width="48" height="48"
																class="rounded-circle" />
															<div>
																<h6 class="fw-semibold mb-0">James Smith</h6>
																<p class="mb-0">hello@loremipsum.com</p>
															</div>
														</div>
													</div>
													<div class="border-bottom pb-7 mb-7">
														<h4 class="fw-semibold text-dark mb-3">Kindly check
															this latest updated</h4>
														<p class="mb-3 text-dark">Hello Andrew,</p>
														<p class="mb-3 text-dark">Lorem ipsum dolor sit amet,
															consectetur adipiscing elit. Quisque bibendum hendrerit
															lobortis. Nullam ut lacus eros. Sed at luctus urna, eu
															fermentum diam. In et tristique mauris.</p>
														<p class="mb-3 text-dark">Ut id ornare metus, sed
															auctor enim. Pellentesque nisi magna, laoreet a augue
															eget, tempor volutpat diam.</p>
														<p class="mb-0 text-dark">Regards,</p>
														<h6 class="fw-semibold mb-0 text-dark pb-1">James
															Smith</h6>
													</div>
													<div class="mb-3">
														<h6 class="fw-semibold mb-0 text-dark mb-3">
															Attachments</h6>
														<div class="d-block d-sm-flex align-items-center gap-4">
															<a href="javascript:void(0)"
																class="hstack gap-3 mb-2 mb-sm-0">
																<div class="d-flex align-items-center gap-3">
																	<div class="rounded-1 text-bg-light p-6">
																		<img
																			src="${pageContext.request.contextPath }/resources/assets/images/chat/icon-adobe.svg"
																			alt="matdash-img" width="24" height="24" />
																	</div>
																	<div>
																		<h6 class="fw-semibold">service-task.pdf</h6>
																		<div
																			class="d-flex align-items-center gap-3 fs-2 text-muted">
																			<span>2 MB</span> <span>2 Dec 2024</span>
																		</div>
																	</div>
																</div>
															</a> <a href="javascript:void(0)"
																class="hstack gap-3 file-chat-hover">
																<div class="d-flex align-items-center gap-3">
																	<div class="rounded-1 text-bg-light p-6">
																		<img src="../assets/images/chat/icon-zip-folder.svg"
																			alt="matdash-img" width="24" height="24" />
																	</div>
																	<div>
																		<h6 class="fw-semibold">work-project.zip</h6>
																		<div
																			class="d-flex align-items-center gap-3 fs-2 text-muted">
																			<span>2 MB</span> <span>2 Dec 2024</span>
																		</div>
																	</div>
																</div>
															</a>
														</div>
													</div>
												</div>
												<div class="chat-list chat" data-user-id="2">
													<div
														class="hstack align-items-start mb-7 pb-1 align-items-center justify-content-between flex-wrap gap-6">
														<div class="d-flex align-items-center gap-2">
															<img
																src="${pageContext.request.contextPath }/resources/assets/images/profile/user-5.jpg"
																alt="user8" width="48" height="48"
																class="rounded-circle" />
															<div>
																<h6 class="fw-semibold mb-0">Katherine Flintoff</h6>
																<p class="mb-0">hello@loremipsum.com</p>
															</div>
														</div>
													</div>
													<div class="border-bottom pb-7 mb-7">
														<h4 class="fw-semibold text-dark mb-3">Kindly check
															this latest updated</h4>
														<p class="mb-3 text-dark">Hello Andrew,</p>
														<p class="mb-3 text-dark">Lorem ipsum dolor sit amet,
															consectetur adipiscing elit. Quisque bibendum hendrerit
															lobortis. Nullam ut lacus eros. Sed at luctus urna, eu
															fermentum diam. In et tristique mauris.</p>
														<p class="mb-3 text-dark">Ut id ornare metus, sed
															auctor enim. Pellentesque nisi magna, laoreet a augue
															eget, tempor volutpat diam.</p>
														<p class="mb-0 text-dark">Regards,</p>
														<h6 class="fw-semibold mb-0 text-dark pb-1">
															Katherine Flintoff</h6>
													</div>
													<div class="mb-3">
														<h6 class="fw-semibold mb-0 text-dark mb-3">
															Attachments</h6>
														<div class="d-block d-sm-flex align-items-center gap-4">
															<a href="javascript:void(0)"
																class="hstack gap-3 mb-2 mb-sm-0">
																<div class="d-flex align-items-center gap-3">
																	<div class="rounded-1 text-bg-light p-6">
																		<img src="../assets/images/chat/icon-adobe.svg"
																			alt="matdash-img" width="24" height="24" />
																	</div>
																	<div>
																		<h6 class="fw-semibold">service-task.pdf</h6>
																		<div
																			class="d-flex align-items-center gap-3 fs-2 text-muted">
																			<span>2 MB</span> <span>2 Dec 2024</span>
																		</div>
																	</div>
																</div>
															</a> <a href="javascript:void(0)"
																class="hstack gap-3 file-chat-hover">
																<div class="d-flex align-items-center gap-3">
																	<div class="rounded-1 text-bg-light p-6">
																		<img src="../assets/images/chat/icon-zip-folder.svg"
																			alt="matdash-img" width="24" height="24" />
																	</div>
																	<div>
																		<h6 class="fw-semibold">work-project.zip</h6>
																		<div
																			class="d-flex align-items-center gap-3 fs-2 text-muted">
																			<span>2 MB</span> <span>2 Dec 2024</span>
																		</div>
																	</div>
																</div>
															</a>
														</div>
													</div>
												</div>
												<div class="chat-list chat" data-user-id="3">
													<div
														class="hstack align-items-start mb-7 pb-1 align-items-center justify-content-between flex-wrap gap-6">
														<div class="d-flex align-items-center gap-2">
															<img
																src="${pageContext.request.contextPath }/resources/assets/images/profile/user-3.jpg"
																alt="user8" width="48" height="48"
																class="rounded-circle" />
															<div>
																<h6 class="fw-semibold mb-0">Bianca Macdowells</h6>
																<p class="mb-0">hello@loremipsum.com</p>
															</div>
														</div>
													</div>
													<div class="border-bottom pb-7 mb-7">
														<h4 class="fw-semibold text-dark mb-3">Kindly check
															this latest updated</h4>
														<p class="mb-3 text-dark">Hello Andrew,</p>
														<p class="mb-3 text-dark">Lorem ipsum dolor sit amet,
															consectetur adipiscing elit. Quisque bibendum hendrerit
															lobortis. Nullam ut lacus eros. Sed at luctus urna, eu
															fermentum diam. In et tristique mauris.</p>
														<p class="mb-3 text-dark">Ut id ornare metus, sed
															auctor enim. Pellentesque nisi magna, laoreet a augue
															eget, tempor volutpat diam.</p>
														<p class="mb-0 text-dark">Regards,</p>
														<h6 class="fw-semibold mb-0 text-dark pb-1">Bianca
															Macdowells</h6>
													</div>
													<div class="mb-3">
														<h6 class="fw-semibold mb-0 text-dark mb-3">
															Attachments</h6>
														<div class="d-block d-sm-flex align-items-center gap-4">
															<a href="javascript:void(0)"
																class="hstack gap-3 mb-2 mb-sm-0">
																<div class="d-flex align-items-center gap-3">
																	<div class="rounded-1 text-bg-light p-6">
																		<img
																			src="${pageContext.request.contextPath }/resources/assets/images/chat/icon-adobe.svg"
																			alt="matdash-img" width="24" height="24" />
																	</div>
																	<div>
																		<h6 class="fw-semibold">service-task.pdf</h6>
																		<div
																			class="d-flex align-items-center gap-3 fs-2 text-muted">
																			<span>2 MB</span> <span>2 Dec 2024</span>
																		</div>
																	</div>
																</div>
															</a> <a href="javascript:void(0)"
																class="hstack gap-3 file-chat-hover">
																<div class="d-flex align-items-center gap-3">
																	<div class="rounded-1 text-bg-light p-6">
																		<img
																			src="${pageContext.request.contextPath }/resources/assets/images/chat/icon-zip-folder.svg"
																			alt="matdash-img" width="24" height="24" />
																	</div>
																	<div>
																		<h6 class="fw-semibold">work-project.zip</h6>
																		<div
																			class="d-flex align-items-center gap-3 fs-2 text-muted">
																			<span>2 MB</span> <span>2 Dec 2024</span>
																		</div>
																	</div>
																</div>
															</a>
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
		</div>
	</div>
</div>
</div>


<!--  Search Bar -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content rounded-1">
          <div class="modal-header border-bottom">
            <input type="search" class="form-control fs-3" placeholder="Search here" id="search" />
            <a href="javascript:void(0)" data-bs-dismiss="modal" class="lh-1">
              <i class="ti ti-x fs-5 ms-3"></i>
            </a>
          </div>
          <div class="modal-body message-body" data-simplebar="">
            <h5 class="mb-0 fs-5 p-1">Quick Page Links</h5>
            <ul class="list mb-0 py-2">
              <li class="p-1 mb-1 bg-hover-light-black">
                <a href="javascript:void(0)">
                  <span class="d-block">Modern</span>
                  <span class="text-muted d-block">/dashboards/dashboard1</span>
                </a>
              </li>
              <li class="p-1 mb-1 bg-hover-light-black">
                <a href="javascript:void(0)">
                  <span class="d-block">Dashboard</span>
                  <span class="text-muted d-block">/dashboards/dashboard2</span>
                </a>
              </li>
              <li class="p-1 mb-1 bg-hover-light-black">
                <a href="javascript:void(0)">
                  <span class="d-block">Contacts</span>
                  <span class="text-muted d-block">/apps/contacts</span>
                </a>
              </li>
              <li class="p-1 mb-1 bg-hover-light-black">
                <a href="javascript:void(0)">
                  <span class="d-block">Posts</span>
                  <span class="text-muted d-block">/apps/blog/posts</span>
                </a>
              </li>
              <li class="p-1 mb-1 bg-hover-light-black">
                <a href="javascript:void(0)">
                  <span class="d-block">Detail</span>
                  <span class="text-muted d-block">/apps/blog/detail/streaming-video-way-before-it-was-cool-go-dark-tomorrow</span>
                </a>
              </li>
              <li class="p-1 mb-1 bg-hover-light-black">
                <a href="javascript:void(0)">
                  <span class="d-block">Shop</span>
                  <span class="text-muted d-block">/apps/ecommerce/shop</span>
                </a>
              </li>
              <li class="p-1 mb-1 bg-hover-light-black">
                <a href="javascript:void(0)">
                  <span class="d-block">Modern</span>
                  <span class="text-muted d-block">/dashboards/dashboard1</span>
                </a>
              </li>
              <li class="p-1 mb-1 bg-hover-light-black">
                <a href="javascript:void(0)">
                  <span class="d-block">Dashboard</span>
                  <span class="text-muted d-block">/dashboards/dashboard2</span>
                </a>
              </li>
              <li class="p-1 mb-1 bg-hover-light-black">
                <a href="javascript:void(0)">
                  <span class="d-block">Contacts</span>
                  <span class="text-muted d-block">/apps/contacts</span>
                </a>
              </li>
              <li class="p-1 mb-1 bg-hover-light-black">
                <a href="javascript:void(0)">
                  <span class="d-block">Posts</span>
                  <span class="text-muted d-block">/apps/blog/posts</span>
                </a>
              </li>
              <li class="p-1 mb-1 bg-hover-light-black">
                <a href="javascript:void(0)">
                  <span class="d-block">Detail</span>
                  <span class="text-muted d-block">/apps/blog/detail/streaming-video-way-before-it-was-cool-go-dark-tomorrow</span>
                </a>
              </li>
              <li class="p-1 mb-1 bg-hover-light-black">
                <a href="javascript:void(0)">
                  <span class="d-block">Shop</span>
                  <span class="text-muted d-block">/apps/ecommerce/shop</span>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var writeEmail = $("#writeEmail");
	
	writeEmail.on("click", function(){
		 window.location.href = "${pageContext.request.contextPath }/common/emailForm";
	});
});
</script>
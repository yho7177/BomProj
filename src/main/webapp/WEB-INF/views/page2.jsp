<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>Soft UI Dashboard by Creative Tim</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	
</script>
<style>
</style>
</head>
<body class="g-sidenav-show  bg-gray-100">
	<jsp:include page="nav/nav2.jsp"></jsp:include>
	<div class="container-fluid py-1 px-3">
		<div class="d-flex">
			<div>
				<ul class="pagination pagination-info">
					<li class="page-item"><a class="page-link"
						href="/bomProcess?pageNo=1&recipeno=${recipeno}&qty=${qty}"><i
							class="ni ni-bold-left" aria-hidden="true"></i><i
							class="ni ni-bold-left" aria-hidden="true"></i></a></li>
					<c:if test="${param.pageNo != 1 }">
						<li class="page-item"><a class="page-link"
							href="/bomProcess?pageNo=${param.pageNo - 1 }&recipeno=${recipeno}&qty=${qty}"
							aria-label="Previous"> <span aria-hidden="true"><i
									class="ni ni-bold-left" aria-hidden="true"></i></span>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${pi.startPageNoOfBlock }"
						end="${pi.endPageNoOfBlock }">
						<li class="page-item" id="${i }"><a class="page-link"
							href="/bomProcess?pageNo=${i }&recipeno=${recipeno}&qty=${qty}">${i }</a></li>
					</c:forEach>
					<c:if test="${param.pageNo != pi.totalPage }">
						<li class="page-item"><a class="page-link"
							href="/bomProcess?pageNo=${param.pageNo + 1 }&recipeno=${recipeno}&qty=${qty}"
							aria-label="Next"> <span aria-hidden="true"><i
									class="ni ni-bold-right" aria-hidden="true"></i></span>
						</a></li>
					</c:if>
					<li class="page-item"><a class="page-link"
						href="/bomProcess?pageNo=${pi.totalPage}&recipeno=${recipeno}&qty=${qty}"><i
							class="ni ni-bold-right" aria-hidden="true"></i><i
							class="ni ni-bold-right" aria-hidden="true"></i></a></li>
				</ul>
			</div>
			<div>
				<button type="button" class="btn bg-gradient-success"
					data-bs-toggle="modal" data-bs-target="#orderButton">주문하기</button>
			</div>
		</div>
		<div class="row my-4">
			<div class="col-lg-3 col-md-6" style="min-height: 700px;">
				<div class="card h-100">
					<div class="card-header pb-0">
						<h6>완성품 List</h6>
						<div class="timeline timeline-one-side">
							<div class="timeline-block mb-3">
								<span class="timeline-step"> <i
									class="ni ni-bell-55 text-success text-gradient"></i>
								</span>
								<div class="timeline-content">
									<h6 class="text-dark text-sm font-weight-bold mb-0">제품을
										선택해주세요!</h6>
								</div>
							</div>
						</div>
						<div class="card-body p-3">
							<div class="timeline timeline-one-side">
								<c:forEach var="i" items="${finished }">
									<form action="/bomProcess?pageNo=1&recipeno=${i.recipeno }" method="get">
										<div class="timeline-block mb-3 finished">
											<span class="timeline-step"> <i
												class="ni ni-html5 text-danger text-gradient"></i>
											</span>
											<div class="timeline-content">
												<h6 class="text-dark text-sm font-weight-bold mb-0 name">${i.productno},${i.title }</h6>
												<input type="hidden" value="${i.recipeno }" name="recipeno" />
												<p
													class="text-secondary font-weight-bold text-xs mt-1 mb-0 series">${i.series }</p>
												<p
													class="text-secondary font-weight-bold text-xs mt-1 mb-0 series"
													style="display: inline-block;">
													<label for="qtyProcess" class="form-control-label">수량</label>
												<div class="d-flex">
													<div>
														<input class="form-control" type="number" value="1"
															id="qtyProcess" name="qty" style="width: 100px;" />
													</div>
													<div>
														<button type="submit" class="btn bg-gradient-success">계산</button>
													</div>
												</div>
												</p>
											</div>
										</div>
									</form>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-8 col-md-6 mb-md-0 mb-4">
				<div class="card" style="min-height: 700px;">
					<div class="card-header pb-0">
						<div class="row">
							<div class="col-lg-6 col-7">
								<h6>BOM(소요량) 계산</h6>
								<p class="text-sm mb-0">
									<c:if test="${finishedOne == null }">
										<span class="font-weight-bold ms-1">오른쪽에 제품을 먼저 선택해주세요</span>
									</c:if>
									<c:if test="${finishedOne != null }">
										<i class="fa fa-check text-info" aria-hidden=true></i>
										<span class="font-weight-bold ms-1">선택된 제품 :
											${finishedOne.productno }, ${finishedOne.title },
											${finishedOne.series }</span>
									</c:if>

								</p>
							</div>
							<div class="col-lg-6 col-5 my-auto text-end">
								<div class="dropdown float-lg-end pe-4">
									<a class="cursor-pointer" id="dropdownTable"
										data-bs-toggle="dropdown" aria-expanded="false"> <i
										class="fa fa-ellipsis-v text-secondary"></i>
									</a>
									<ul class="dropdown-menu px-2 py-3 ms-sm-n4 ms-n5"
										aria-labelledby="dropdownTable">
										<li><a class="dropdown-item border-radius-md"
											href="javascript:;">Action</a></li>
										<li><a class="dropdown-item border-radius-md"
											href="javascript:;">Another action</a></li>
										<li><a class="dropdown-item border-radius-md"
											href="javascript:;">Something else here</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="card-body px-0 pb-2">
						<div class="table-responsive">
							<table class="table align-items-center mb-0">
								<thead>
									<tr>
										<th class="text-secondary opacity-7">이름</th>
										<th class="text-secondary opacity-7">분류</th>
										<th class="text-secondary opacity-7">현재 재고</th>
										<th class="text-secondary opacity-7">소요량</th>
										<th class="text-secondary opacity-7">현재 재고 - 소요량</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${bom !=null }">
										<c:forEach var="i" items="${bom }">
											<tr class="proInfo">
												<td><div class="d-flex px-2 py-1">
														<div>
															<img src="resources/uploads${i.img }"
																class="avatar avatar-sm me-3" />
														</div>
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${i.name }</h6>
															<p class="text-xs font-weight-bold mb-0">제품 번호 :
																${i.productno }</p>
														</div>
													</div></td>
												<td><p class="text-xs font-weight-bold mb-0"
														style="text-align: center">
														<c:choose>
															<c:when test="${i.category == 'A' }">
														완제품		
													</c:when>
															<c:when test="${i.category == 'C' }">
														반제품
													</c:when>
															<c:otherwise>
														브릭
													</c:otherwise>
														</c:choose>
													</p></td>
												<td><p class="text-xs font-weight-bold mb-0"
														style="text-align: center">${i.stock }</p></td>
												<td><p class="text-xs font-weight-bold mb-0"
														style="text-align: center">${i.qty }</p></td>
												<td><p class="text-xs font-weight-bold mb-0"
														style="text-align: center">${i.stock - i.qty }</p></td>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="nav/footer.jsp"></jsp:include>
	<jsp:include page="nav/fixed.jsp"></jsp:include>
	<form action="/orderProcess" method="get">
		<div class="modal fade" id="orderButton" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">

				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">주문하기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						부족한 수량의 제품이 자동으로 주문됩니다 (소요기간은 브릭하나당 10분이 소요됩니다)<br /> 주문하기 버튼을 눌러
						주문을 완료해주세요
					</div>
					<div class="modal-footer">
						<input type="hidden" id="orderNo" name="recipeno" value= "${param.recipeno }"/>
						<input type="hidden" id="orderqty" name="qty" value= "${param.qty }"/>
						<button type="button" class="btn bg-gradient-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn bg-gradient-primary">주문하기</button>
					</div>

				</div>
			</div>
		</div>
	</form>

	<script src="../resources/assets/js/core/popper.min.js"></script>
	<script src="../resources/assets/js/core/bootstrap.min.js"></script>
	<script src="../resources/assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="../resources/assets/js/plugins/smooth-scrollbar.min.js"></script>

	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="../resources/assets/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
</body>
</html>
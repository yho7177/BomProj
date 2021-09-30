<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(function() {
		$(".searchType").change(function() {
			let searchType = $(this).val();
			let url = "/searchType";
			$.ajax({
				url : url, // ajax와 통신 할 곳
				data : {
					searchType : searchType
				}, // 서블릿에 보낼 데이터
				dataType : "text", // 수신될 데이터의 타입
				type : "get", // 통신 방식
				success : function(data) {
					console.log(data);
				},
				error : function() { // 통신 실패시 수행될 콜백 함수

				}

			});
		});
	});

	function orderSuccess() {

	}
</script>
<style>
</style>
</head>
<body>
	<jsp:include page="nav/nav4.jsp"></jsp:include>
	<div class="container-fluid py-4">
		<div>
			<label for="cancel">취소</label> <input type="radio" class="searchType"
				id="cancel" name="searchType" value="취소" /> <label for="ing">진행중</label>
			<input type="radio" class="searchType" id="ing" name="searchType"
				value="진행중" /> <label for="complete">완료</label> <input type="radio"
				class="searchType" id="complete" name="searchType" value="완료" />
		</div>
		<div class="row">
			<div class="col-12">
				<div class="card mb-4">
					<div class="card-header pb-0">
						<h6>주문서</h6>
					</div>
					<div class="card-body px-0 pt-0 pb-2">
						<div class="table-responsive p-0">
							<table
								class="table align-items-center justify-content-center mb-0">
								<thead>
									<tr>
										<th
											class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">주문서</th>
										<th
											class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">총비용</th>
										<th
											class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">상태</th>
										<th
											class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">완료
											예정 시간</th>
										<th
											class="text-uppercase text-secondary text-xxs font-weight-bolder text-center opacity-7 ps-2">진행도</th>
										<th></th>
									</tr>
								</thead>
								<tbody class="billBody">
									<c:forEach var="i" items="${billing }" varStatus="statusn">
										<tr>
											<td>
												<div class="d-flex px-2">
													<div>
														<img src="resources/assets/img/order.jpg"
															class="avatar avatar-sm rounded-circle me-2">
													</div>
													<div class="my-auto">
														<h6 class="mb-0 text-sm">주문번호 : ${i.no }</h6>
														<p class="text-xs font-weight-bold mb-0"">주문 시간
															:<fmt:formatDate value="${i.orderdate }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></p>
													</div>
												</div>
											</td>
											<td>
												<div class="d-flex px-2">
													<div>
														<img src="resources/assets/img/won.jpg"
															class="avatar avatar-sm rounded-circle me-2">
													</div>
													<div class="my-auto">
														<p class="text-sm font-weight-bold mb-0">${i.totcost }</p>
													</div>
												</div>
											</td>
											<td><span class="text-xs font-weight-bold">${i.status }</span>
											</td>
											<td><span class="text-xs font-weight-bold"><fmt:formatDate value="${i.duration }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></span>
											</td>
											<td class="align-middle text-center">
												<div
													class="d-flex align-items-center justify-content-center">
													<span class="me-2 text-xs font-weight-bold">${percent[statusn.index] }%</span>
													<div>
														<div class="progress">
															<div class="progress-bar bg-gradient-info"
																role="progressbar"
																aria-valuenow="${percent[statusn.index] }"
																aria-valuemin="0" aria-valuemax="100"
																style="width: ${percent[statusn.index] }%;"></div>
														</div>
													</div>
												</div>
											</td>

											<td class="align-middle">
												<button type="button" class="btn bg-gradient-info"
													onclick="orderSuccess()">확인</button>
												<button type="button" class="btn bg-gradient-info">취소</button>
											</td>
										</tr>
									</c:forEach>
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
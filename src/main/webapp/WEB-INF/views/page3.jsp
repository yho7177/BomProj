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
		active();

		$(".proInfo").click(function() {
			let no = $(this).find("p").prop("id");
			proInfo(no);
		});

		$(".img").change(function(evt) {
			let url = "/upload";
			let file = $(this)[0].files[0];
			let formData = new FormData();
			formData.append("upFile", file);

			$.ajax({
				url : url, // ajax와 통신 할 곳
				data : formData, // 서블릿에 보낼 데이터
				dataType : "text", // 수신될 데이터의 타입
				type : "post", // 통신 방식
				processData : false, // 전송하는 데이터를 쿼리 스트링 형태로 변환하는지를 결정
				contentType : false, // 기본값 (application/x-www-form-urlencoded)
				success : function(data) { // 통신 성공시 수행될 콜백 함수
					console.log(data);
					$("#upFileName1").val(data);
				},
				error : function() { // 통신 실패시 수행될 콜백 함수

				}

			});
		});

	});

	function active() {
		$(".page-item").removeClass("active");
		$("#${param.pageNo}").addClass("active");
	}

	function proInfo(no) {
		let url = "/proInfo";

		$
				.ajax({
					url : url, // ajax와 통신 할 곳
					dataType : "json", // 수신될 데이터의 타입
					data : {
						no : no
					},
					type : "get", // 통신 방식
					success : function(data) { // 통신 성공시 수행될 콜백 함수
						console.log(data.category);
						$("#cardname").html(data.name);
						$("#edittitle").val(data.name);

						$("#cardno").html(data.productno);
						$("#editNo").val(data.productno);

						$("#cardstock").html(data.stock);
						$("#editstock").val(data.stock);
						if (data.category == 'A') {
							data.category = "완제품";
						} else if (data.category == "C") {
							data.category = "반제품";
						} else if (data.category == "E") {
							data.category = "브릭";
						}
						console.log(data.category);
						$("#cardcategory").html(data.category);
						$("#cardimg")
								.html(
										"<img src='resources/uploads" + data.img + "' id='fi' class='img-fluid border-radius-lg' />");
						$("#thumb")
								.html(
										"<img src='resources/uploads" + data.img + "' class='img-fluid border-radius-lg' />")
					},
					error : function(data) { // 통신 실패시 수행될 콜백 함수
						console.log(data);
					},
				});
	}

	function proDel() {
		let no = $("#cardno").html();
		$("#productno").val(no);
		console.log(no);
		if (no == "") {
			$(".delbody").html("먼저 제품을 선택한 후에 진행해주세요");
			$(".delpro").hide();
		} else {
			$(".delbody").html(
					"정말로 제품 번호 : " + no
							+ "인 브릭을 삭제하시겠습니까?<br />삭제된 브릭의 정보는 완전히 삭제됩니다");
			$(".delpro").show();
		}
	}

	function editProduct() {
		$("#exampleModalLabel2").html("브릭 수정");
		let img = $("#cardimg").find("img").prop("src");
		if (img != null) {
			img = img.substr(39);
		}
		$("#upFileName").val(img);
		/* let result = $("#edittitle").val();
		if (result == "") {
			$(".editbody").hide();
			$(".editError").html("먼저 제품을 선택한 후에 진행해주세요");
		} else {
			$(".editbody").show();
		} */
	}
</script>
<style>
#fi {
	width: 150px;
	height: 100px;
	display: block;
	margin: 0px auto;
	object-fit: contain;
}
</style>
</head>
<body>

	<jsp:include page="nav/nav3.jsp"></jsp:include>
	<div class="container-fluid py-4">
		<div class="row">
			<div class="col col-lg-5">
				<div class="card">
					<div class="card-header pb-0 px-3">
						<h6 class="mb-0">Product Information</h6>
					</div>
					<div class="card-body pt-4 p-3">
						<ul class="list-group">
							<li
								class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
								<div class="d-flex flex-column">
									<h6 class="mb-3 text-sm" id="cardname"></h6>
									<span class="mb-2 text-xs">제품번호: <span
										class="text-dark font-weight-bold ms-sm-2" id="cardno"></span></span>
									<span class="mb-2 text-xs">분류: <span
										class="text-dark ms-sm-2 font-weight-bold" id="cardcategory"></span></span>
									<span class="mb-2 text-xs">재고: <span
										class="text-dark ms-sm-2 font-weight-bold" id="cardstock"></span></span>
								</div>
								<div class="ms-auto text-end">
									<button type="button" class="btn bg-gradient-info"
										data-bs-toggle="modal" data-bs-target="#exampleModaldel"
										onclick="proDel();">
										<i class="far fa-trash-alt me-2"></i>제품 삭제
									</button>
									<button type="button" class="btn bg-gradient-info"
										data-bs-toggle="modal" data-bs-target="#exampleModaledit"
										onclick="editProduct();">
										<i class="fas fa-pencil-alt text-dark me-2" aria-hidden="true"></i>제품
										수정
									</button>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col col-lg-3">
				<div class="card h-100 mb-4">
					<div class="card-header pb-0 px-3">
						<div class="row">
							<div class="col-md-6">
								<h6 class="mb-0 ">Product Image</h6>
							</div>
						</div>
					</div>
					<div class="card-body pt-4 p-3" id="cardimg"></div>
				</div>
			</div>
		</div>
		<hr />
		<div class="d-flex">
			<div>
				<ul class="pagination pagination-info">
					<li class="page-item"><a class="page-link"
						href="/page3?pageNo=1&searchText=${param.searchText}&searchType=${param.searchType}"><i
							class="ni ni-bold-left" aria-hidden="true"></i><i
							class="ni ni-bold-left" aria-hidden="true"></i></a></li>
					<c:if test="${param.pageNo != 1 }">
						<li class="page-item"><a class="page-link"
							href="/page3?pageNo=${param.pageNo - 1 }&searchText=${param.searchText}&searchType=${param.searchType}"
							aria-label="Previous"> <span aria-hidden="true"><i
									class="ni ni-bold-left" aria-hidden="true"></i></span>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${pi.startPageNoOfBlock }"
						end="${pi.endPageNoOfBlock }">
						<li class="page-item" id="${i }"><a class="page-link"
							href="/page3?pageNo=${i }&searchText=${param.searchText}&searchType=${param.searchType}">${i }</a></li>
					</c:forEach>
					<c:if test="${param.pageNo != pi.totalPage }">
						<li class="page-item"><a class="page-link"
							href="/page3?pageNo=${param.pageNo + 1 }&searchText=${param.searchText}&searchType=${param.searchType}"
							aria-label="Next"> <span aria-hidden="true"><i
									class="ni ni-bold-right" aria-hidden="true"></i></span>
						</a></li>
					</c:if>
					<li class="page-item"><a class="page-link"
						href="/page3?pageNo=${pi.totalPage}&searchText=${param.searchText}&searchType=${param.searchType}"><i
							class="ni ni-bold-right" aria-hidden="true"></i><i
							class="ni ni-bold-right" aria-hidden="true"></i></a></li>
				</ul>
			</div>
			<div>
				<button type="button" class="btn bg-gradient-info"
					data-bs-toggle="modal" data-bs-target="#addProduct1"">
					<i class="fas fa-pencil-alt text-dark me-2" aria-hidden="true"></i>제품
					추가
				</button>
			</div>
			<div>
				<form action="/page3" method="get">
					<div class="d-flex">
						<div>
							<select class="form-control" id="searchType" name="searchType"
								style="width: 85px;">
								<option class="text-center" value="">제품 분류</option>
								<option class="text-center" value="A">완제품</option>
								<option class="text-center" value="C">반제품</option>
								<option class="text-center" value="E">브릭</option>
							</select>
						</div>
						<div>
							<input type="hidden" name="pageNo" value="1" /> <input
								type="text" class="form-control"
								placeholder="제품번호나 제품 이름을 입력해주세요" style="width: 300px"
								id="searchText" name="searchText" />
						</div>
						<div>
							<button type="submit" class="btn bg-gradient-info">
								<i class="ni ni-zoom-split-in"></i>검색
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="card mb-4">
					<div class="card-header pb-0">
						<h6>Product Table</h6>
					</div>
					<div class="card-body px-0 pt-0 pb-2">
						<div class="table-responsive p-0">
							<table class="table align-items-center mb-0">
								<thead>
									<tr>
										<th
											class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">이름</th>
										<th class="text-secondary opacity-7">분류</th>
										<th class="text-secondary opacity-7">등록 시간</th>
										<th class="text-secondary opacity-7">재고</th>
										<th class="text-secondary opacity-7"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product" items="${product }">
										<tr class="proInfo">
											<td><div class="d-flex px-2 py-1">
													<div>
														<img src="resources/uploads${product.img }"
															class="avatar avatar-sm me-3" />
													</div>
													<div class="d-flex flex-column justify-content-center">
														<h6 class="mb-0 text-sm">${product.name }</h6>
														<p class="text-xs font-weight-bold mb-0"
															id="${product.productno }">제품 번호 :
															${product.productno }</p>
													</div>
												</div></td>
											<td><p class="text-xs font-weight-bold mb-0">
													<c:choose>
														<c:when test="${product.category == 'A' }">
														완제품		
													</c:when>
														<c:when test="${product.category == 'C' }">
														반제품
													</c:when>
														<c:otherwise>
														브릭
													</c:otherwise>
													</c:choose>
												</p></td>
											<td><p class="text-xs font-weight-bold mb-0"><fmt:formatDate value="${product.registerdate }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></p></td>
											<td><p class="text-xs font-weight-bold mb-0">${product.stock }</p></td>
											<td class="align-middle"><a
												class="text-secondary font-weight-bold text-xs"
												data-toggle="tooltip" data-original-title="Edit user">Edit</a></td>
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

	<!-- Modal -->
	<form action="/delPro" method="get">
		<div class="modal fade" id="exampleModaldel" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Brick 삭제</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p class="text-xs font-weight-bold mb-0 delbody"></p>
						<input type="hidden" id="productno" name="productno" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn bg-gradient-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn bg-gradient-info delpro">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<form action="/upadateProduct" method="get">
		<div class="modal fade" id="exampleModaledit" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel2"></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<p class="text-xs font-weight-bold mb-0 editError"></p>
					<div class="modal-body editbody">
						<label class="form-control-label" for="ctitle">제품 분류</label>
						<div class="dropdown">
							<select class="btn bg-gradient-info dropdown-toggle" id="ctitle"
								name="category">제품 분류
								<span class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<option class="categoryli" value="A"><span
											class="dropdown-item">완제품</span></option>
									<option class="categoryli" value="C"><span
											class="dropdown-item">반제품</span></option>
									<option class="categoryli" value="E"><span
											class="dropdown-item">브릭</span></option>
							</span>
							</select>
						</div>
						<span id="editbody"></span> <label class="form-control-label"
							for="editNo">제품번호</label>
						<div class="input-group mb-3">
							<input type="text" id="editNo" name="productno"
								class="form-control " placeholder="Recipient's username"
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<button class="btn btn-outline-info mb-0" type="button">중복확인</button>
						</div>

						<label class="form-control-label" for="edittitle">제품 이름</label>
						<div class="input-group">
							<input type="text" id="edittitle" name="name"
								class="form-control" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default">
						</div>

						<label class="form-control-label" for="editimg">이미지</label>
						<div id="thumb"></div>
						<div class="input-group">
							<input type="file" class="img" id="editimg" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default"> <input
								type="hidden" id="upFileName" name="img" />
						</div>
						<label class="form-control-label" for="editstock">재고</label>
						<div class="input-group">
							<input type="text" id="editstock" name="stock"
								class="form-control" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn bg-gradient-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn bg-gradient-info">수정</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<form action="/addProduct" method="get">
		<div class="modal fade" id="addProduct1" tabindex="-1" role="dialog"
			aria-labelledby="addProduct1Label" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="addProduct1Label"></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body editbody">
						<label class="form-control-label" for="ctitle1">제품 분류</label>
						<div class="dropdown">
							<select class="btn bg-gradient-info dropdown-toggle" id="ctitle1"
								name="category">제품 분류
								<span class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<option class="categoryli" value="A"><span
											class="dropdown-item">완제품</span></option>
									<option class="categoryli" value="C"><span
											class="dropdown-item">반제품</span></option>
									<option class="categoryli" value="E"><span
											class="dropdown-item">브릭</span></option>
							</span>
							</select>
						</div>
						<label class="form-control-label" for="addNo">제품번호</label>
						<div class="input-group mb-3">
							<input type="text" id="addNo" name="productno"
								class="form-control " aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<button class="btn btn-outline-info mb-0" type="button">중복확인</button>
						</div>

						<label class="form-control-label" for="addTitle">제품 이름</label>
						<div class="input-group">
							<input type="text" id="addTitle" name="name" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default">
						</div>

						<label class="form-control-label" for="addImg">이미지</label>
						<div id="thumb1"></div>
						<div class="input-group">
							<input type="file" class="img" id="addImg" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default"> <input
								type="hidden" id="upFileName1" name="img" />
						</div>
						<label class="form-control-label" for="addStock">재고</label>
						<div class="input-group">
							<input type="text" id="addStock" name="stock"
								class="form-control" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn bg-gradient-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn bg-gradient-info">추가</button>
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
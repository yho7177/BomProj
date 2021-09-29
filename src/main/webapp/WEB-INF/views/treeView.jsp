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
	$(function() {

		$('#treeset')
				.bind(
						'select_node.jstree',
						function(event, data) {
							// 노드를 선택했을 때 적용할 코드 작성
							let no = data.instance.get_node(data.selected).id;
							let url = "/selectedTree"
							$
									.ajax({
										url : url, // ajax와 통신 할 곳
										dataType : "json", // 수신될 데이터의 타입
										data : {
											no : no
										},
										type : "get", // 통신 방식
										success : function(data) { // 통신 성공시 수행될 콜백 함수
											console.log(data);
											$(".finished").hide();
											$(".lov").show();
											$("#cardname").html(data.name);
											$("#cardno").html(data.productno);
											let category = "";
											if (data.category == 'A') {
												category = "완제품"
											} else if (data.category == "C") {
												category = "반제품";
											} else if (data.category == "E") {
												category = "브릭";
											}
											$("#cardcategory").html(category);
											$("#cardstock").html(data.stock);
											$(".cardimg")
													.html(
															"<img src='resources/uploads" + data.img + "' id = 'fi'/>");
										},
										error : function(data) { // 통신 실패시 수행될 콜백 함수
											console.log(data);
										},
									});
						});

		// 제품 선택했을떄 완제품 정보 가져오기
		$(".prolist")
				.click(
						function() {
							let no = $(this).prop("id");
							let url = "/finishedInfo"
							$
									.ajax({
										url : url, // ajax와 통신 할 곳
										dataType : "json", // 수신될 데이터의 타입
										data : {
											no : no
										},
										async : false,
										type : "get", // 통신 방식
										success : function(data) { // 통신 성공시 수행될 콜백 함수
											console.log(data);
											$(".lov").hide();
											$(".finished").show();
											$(".title").html(data.title);
											$(".brick").html(data.brick);
											$(".no").html(data.no);
											$(".release").html(data.release);
											$(".series").html(data.series);
											$(".imgout")
													.html(
															"<img src='resources/uploads" + data.img + "'  class='img-fluid border-radius-lg' />");
											receiveData(data.recipe);

										},
										error : function(data) { // 통신 실패시 수행될 콜백 함수
											console.log(data);
										},
									});
						});

		$("#img").change(function(evt) {
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
					$("#upFileName").val(data);
				},
				error : function() { // 통신 실패시 수행될 콜백 함수

				}

			});
		});

		$("#imgs").change(function(evt) {
			let url = "/upload";
			let file = $(this)[0].files[0];
			let formData = new FormData();
			formData.append("upFile", file);
			console.log(file);
			$.ajax({
				url : url, // ajax와 통신 할 곳
				data : formData, // 서블릿에 보낼 데이터
				dataType : "text", // 수신될 데이터의 타입
				type : "post", // 통신 방식
				processData : false, // 전송하는 데이터를 쿼리 스트링 형태로 변환하는지를 결정
				contentType : false, // 기본값 (application/x-www-form-urlencoded)
				success : function(data) { // 통신 성공시 수행될 콜백 함수
					console.log(data);
					$("#upFileName2").val(data);
				},
				error : function() { // 통신 실패시 수행될 콜백 함수

				}

			});

		});

	});

	// 제품 드롭다운으로 뽑기
	/* function productAll() {
			let url = "/productAll"
			$.ajax({
				url : url, // ajax와 통신 할 곳
				dataType : "json", // 수신될 데이터의 타입
				type : "get", // 통신 방식
				success : function(data) { // 통신 성공시 수행될 콜백 함수
					console.log(data);
				},
				error : function(data) { // 통신 실패시 수행될 콜백 함수
					console.log(data);
				},
			});
	} */

	function checkSeries(series) {
		let result = false;
		if (series == "") {
			$("#series").removeClass("is-valid");
			$("#series").removeClass("is-invalid");
			$("#series").addClass("is-invalid");
		} else {
			$("#series").removeClass("is-valid");
			$("#series").removeClass("is-invalid");
			$("#series").addClass("is-valid");
			result = true;
		}
		return result;
	}

	function checked() {
		let result = false;
		let recipeChe = recipeCheck();
		let noChe = noCheck();
		let series = $("#series").val();
		let seriesCheck = checkSeries(series);
		console.log(seriesCheck);

		let name = $("#title").val();
		let nameCheck = false;
		if (name != null) {
			$("#title").removeClass("is-valid");
			$("#title").removeClass("is-invalid");
			$("#title").addClass("is-valid");
			nameCheck = true;
		} else if (name == null || name == "") {
			$("#title").removeClass("is-valid");
			$("#title").removeClass("is-invalid");
			$("#title").addClass("is-invalid");
		}
		let brick = $("#brick").val();
		let brickCheck = false;
		if (brick != null) {
			brickCheck = true;
		}
		let release = $("#release").val();
		let releaseCheck = false;
		if (release != null) {
			releaseCheck = true;
		}
		let img = $("#upFileName").val();
		let imgCheck = false;
		if (img != null) {
			imgCheck = true;
		}

		console.log(recipeChe, noChe, seriesCheck, nameCheck, brickCheck,
				releaseCheck, imgCheck)
		/* if(recipeChe && noChe && seriesCheck && nameCheck && brickCheck && releaseCheck && imgCheck) {
			result = true;
			return result;
		} else {
			return result;
		} */
		return true;
	}

	function recipeCheck() {
		let result = false;
		let recipe = ""
		recipe = $("#recipe").val();
		let url = "/recipeCheck";
		$.ajax({
			url : url, // ajax와 통신 할 곳
			dataType : "json", // 수신될 데이터의 타입
			data : {
				recipe : recipe
			},
			type : "get", // 통신 방식
			success : function(data) { // 통신 성공시 수행될 콜백 함수
				if (recipe != "") {
					if (data.result == "success") {
						$("#recipe").removeClass("is-valid");
						$("#recipe").removeClass("is-invalid");
						$("#recipe").addClass("is-valid");
						result = true;
						return result;
					} else {
						$("#recipe").removeClass("is-valid");
						$("#recipe").removeClass("is-invalid");
						$("#recipe").addClass("is-invalid");
					}
				} else {
					$("#recipe").removeClass("is-valid");
					$("#recipe").removeClass("is-invalid");
					$("#recipe").addClass("is-invalid");
				}

			},
			error : function(data) { // 통신 실패시 수행될 콜백 함수
				console.log(data);
			},
		});
	}

	function noCheck() {
		let result = false;
		let no = $("#productno").val();
		let url = "/noCheck";
		$.ajax({
			url : url, // ajax와 통신 할 곳
			dataType : "json", // 수신될 데이터의 타입
			data : {
				no : no
			},
			type : "get", // 통신 방식
			success : function(data) { // 통신 성공시 수행될 콜백 함수
				if (no != "") {
					if (data.result == "success") {
						$("#productno").removeClass("is-valid");
						$("#productno").removeClass("is-invalid");
						$("#productno").addClass("is-valid");
						result = true;
					} else {
						$("#productno").removeClass("is-valid");
						$("#productno").removeClass("is-invalid");
						$("#productno").addClass("is-invalid");
					}
				} else {
					$("#productno").removeClass("is-valid");
					$("#productno").removeClass("is-invalid");
					$("#productno").addClass("is-invalid");
				}

				return result;
			},
			error : function(data) { // 통신 실패시 수행될 콜백 함수
				console.log(data);
			},

		});
	}

	function receiveData(rno) {
		let url = "/tree";
		$.ajax({
			url : url, // ajax와 통신 할 곳
			dataType : "json", // 수신될 데이터의 타입
			data : {
				rno : rno
			},
			type : "post", // 통신 방식
			success : function(data) { // 통신 성공시 수행될 콜백 함수
				let json = data.items;
				console.log(json);
				createJSTree(json);

			},
			error : function() { // 통신 실패시 수행될 콜백 함수

			},
		});
	}

	function createJSTree(json) {
		
		
		$('#treeset').jstree({
			"conditionalselect" : function(node, event) {
				return true;
			},
			'core' : {
				'data' : json
			},
			"plugins" : [ "types", "wholerow" ]
		});
	}
</script>
<style>
#fi {
	width: 450px;
	height: 350px;
	object-fit: contain;
	display: block;
	margin: 0px auto;
}

#treeset::-webkit-scrollbar {
	width: 10px;
}

#treeset::-webkit-scrollbar-track {
	background: #eeeeee;
}

#treeset::-webkit-scrollbar-thumb {
	background: linear-gradient(#c2e59c, #64b3f4);
}

#treeset {
	overflow: scroll;
	display: flex;
	height: 600px;
	scrollbar-color: gray;
	scrollbar-width: thin;
	overflow-x: hidden;
}
</style>
</head>
<body class="g-sidenav-show  bg-gray-100">
	<jsp:include page="nav/nav.jsp"></jsp:include>
	<div class="container-fluid py-4">
		<div>
			<div class="dropdown">
				<button class="btn bg-gradient-info dropdown-toggle" type="button"
					id="dropdownMenuButton" data-bs-toggle="dropdown"
					aria-expanded="false">제품 선택</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<c:forEach var="i" items="${finished }">
						<li><span class="dropdown-item prolist" id="${i.productno }">${i.title }</span></li>
					</c:forEach>
				</ul>
				<button type="button" class="btn bg-gradient-primary"
					data-bs-toggle="modal" data-bs-target="#exampleModal2">부품
					추가</button>
				<button type="button" class="btn btn-outline-dark btn-sm">수정</button>
				<button type="button" class="btn btn-outline-dark btn-sm">삭제</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 mb-lg-0 mb-4">
				<div class="card mt-4">
					<div class="card-header pb-0 p-3">
						<div class="row">
							<div class="col-6 d-flex align-items-center">

								<h6 class="text-center mb-0 title">상단의 제품 선택 버튼을 눌러 제품을
									선택해주세요</h6>


							</div>
							<div class="col-6 text-end">
								<button type="button" class="btn bg-gradient-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									<i class="fas fa-plus"></i>&nbsp;&nbsp; 새로운 완제품 추가
								</button>

							</div>
						</div>
					</div>
					<div class="card-body p-3">
						<div class="row"></div>
					</div>
				</div>
			</div>
			<hr class="horizontal dark my-3">
			<div class="col-lg-4" style="height: 700px;">
				<div class="card h-100">
					<div class="card-header pb-0 p-3">
						<div class="row">
							<div class="col-6 d-flex align-items-center">
								<h6 class="text-center mb-0">트리</h6>
							</div>
							<div class="col-6 text-end"></div>
						</div>
					</div>
					<div class="card-body p-3 pb-0 treediv" >
						<div id="treeset"></div>
					</div>
				</div>
			</div>

			<div class="col-lg-8 finished">
				<div class="row">
					<div class="col-xl-6 mb-xl-0 mb-4">
						<div class="card bg-transparent shadow-xl">
							<div class="overflow-hidden position-relative border-radius-xl"
								style="height: 440px">
								<div class="card-body position-relative z-index-1 p-3 imgout">

								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="row">
							<div class="col-md-6" style="height: 250px;">
								<div class="card">
									<div class="card-header mx-4 p-3 text-center">
										<div
											class="icon icon-shape icon-lg bg-gradient-primary shadow text-center border-radius-lg">
											<i class="ni ni-app" style="width: 24px; height: 24px;"></i>
										</div>
									</div>
									<div class="card-body pt-0 p-3 text-center">
										<h6 class="text-center mb-0" id="treename">부품수</h6>

										<hr class="horizontal dark my-3">
										<h5 class="mb-0 brick"></h5>
									</div>
								</div>
							</div>
							<div class="col-md-6 mt-md-0 mt-4" style="height: 250px;">
								<div class="card">
									<div class="card-header mx-4 p-3 text-center">
										<div
											class="icon icon-shape icon-lg bg-gradient-primary shadow text-center border-radius-lg">
											<i class="ni ni-trophy" style="width: 24px; height: 24px;"></i>
										</div>
									</div>
									<div class="card-body pt-0 p-3 text-center">
										<h6 class="text-center mb-0 ">제품번호</h6>

										<hr class="horizontal dark my-3">
										<h5 class="mb-0 no"></h5>
									</div>
								</div>
							</div>
							<div class="col-md-6" style="height: 250px;">
								<div class="card">
									<div class="card-header mx-4 p-3 text-center">
										<div
											class="icon icon-shape icon-lg bg-gradient-primary shadow text-center border-radius-lg">
											<i class="ni ni-app" style="width: 24px; height: 24px;"></i>
										</div>
									</div>
									<div class="card-body pt-0 p-3 text-center">
										<h6 class="text-center mb-0 category">출시일</h6>

										<hr class="horizontal dark my-3">
										<h5 class="mb-0 release"></h5>
									</div>
								</div>
							</div>
							<div class="col-md-6 mt-md-0 mt-4" style="height: 250px;">
								<div class="card">
									<div class="card-header mx-4 p-3 text-center">
										<div
											class="icon icon-shape icon-lg bg-gradient-primary shadow text-center border-radius-lg">
											<i class="ni ni-trophy" style="width: 24px; height: 24px;"></i>
										</div>
									</div>
									<div class="card-body pt-0 p-3 text-center">
										<h6 class="text-center mb-0">시리즈 분류</h6>

										<hr class="horizontal dark my-3">
										<h5 class="mb-0 series"></h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-8 lov">
				<div class="row">
					<div class="col-md-6"><br /><br /><br /><br />
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
												class="text-dark ms-sm-2 font-weight-bold" id="cardstock"></span>
											</span>
										</div>
										<div class="ms-auto text-end">
											<button type="button" class="btn bg-gradient-primary"
												data-bs-toggle="modal" data-bs-target="#exampleModaldel"
												onclick="proDel();">
												<i class="far fa-trash-alt me-2"></i>Delete
											</button>
											<button type="button" class="btn bg-gradient-primary"
												data-bs-toggle="modal" data-bs-target="#exampleModaledit"
												onclick="editProduct();">
												<i class="fas fa-pencil-alt text-dark me-2"
													aria-hidden="true"></i>Edit
											</button>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-6 lov">
						<div class="card">
							<div class="card-header pb-0 px-3">
								<h6 class="mb-0">Product Information</h6>
							</div>
							<div class="card-body pt-4 p-3 cardimg"></div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="nav/footer.jsp"></jsp:include>
	<jsp:include page="nav/fixed.jsp"></jsp:include>

	<!-- modal////////////////////////////////////////////////////////////////////////////// -->
	<form action="/addProduct" method="post">
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">완제품 추가</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<label class="form-control-label" for="productno">제품번호</label>
						<div class="input-group mb-3">
							<input type="text" id="productno" name="productno"
								class="form-control " placeholder="Recipient's username"
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<button class="btn btn-outline-primary mb-0" type="button"
								id="button-addon2" onclick="noCheck();">중복확인</button>
						</div>
						<label class="form-control-label" for="series">시리즈 분류</label>
						<div class="input-group">
							<input type="text" id="series" name="series" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default">
						</div>
						<label class="form-control-label" for="title">제품 이름</label>
						<div class="input-group">
							<input type="text" id="title" name="title" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default">
						</div>
						<label class="form-control-label" for="brick">브릭의 개수</label>
						<div class="input-group">
							<input type="text" id="brick" name="brick" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default">
						</div>
						<label class="form-control-label" for="release">출시년도</label>
						<div class="input-group">
							<input type="date" id="release" name="release"
								class="form-control" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default">
						</div>
						<label class="form-control-label" for="img">이미지</label>
						<div class="input-group">
							<input type="file" id="img" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default"> <input
								type="hidden" id="upFileName" name="img" />
						</div>
						<label class="form-control-label" for="recipe">레시피 번호</label>
						<div class="input-group mb-3">
							<input type="text" id="recipe" name="recipeno"
								class="form-control " placeholder="Recipient's username"
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<button class="btn btn-outline-primary mb-0" type="button"
								id="button-addon2" onclick="recipeCheck();">중복확인</button>
						</div>
					</div>


					<div class="modal-footer">
						<button type="button" class="btn bg-gradient-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn bg-gradient-primary"
							onclick="return checked()">저장</button>
					</div>

				</div>
			</div>
		</div>
	</form>

	<form action="/forrecipe" method="post">
		<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel2">부품 추가</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<label class="form-control-label" for="productno2">제품번호</label>
						<div class="input-group mb-3">
							<input type="text" id="productno2" name="productno"
								class="form-control " placeholder="Recipient's username"
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<button class="btn btn-outline-primary mb-0" type="button">중복확인</button>
						</div>

						<label class="form-control-label" for="title2">제품 이름</label>
						<div class="input-group">
							<input type="text" id="title2" name="name" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default">
						</div>

						<label class="form-control-label" for="parent">상위 항목</label>
						<div class="input-group mb-3">
							<input type="text" id="parent" name="parent"
								class="form-control " placeholder="Recipient's username"
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<button class="btn btn-outline-primary mb-0" type="button">중복확인</button>
						</div>

						<label class="form-control-label" for="img2">이미지</label>
						<div class="input-group">
							<input type="file" id="imgs" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default"> <input
								type="hidden" id="upFileName2" name="img" />
						</div>
						<label class="form-control-label" for="recipe2">레시피 번호</label>
						<div class="input-group mb-3">
							<input type="text" id="recipe2" name="recipeno"
								class="form-control " placeholder="Recipient's username"
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<button class="btn btn-outline-primary mb-0" type="button"
								id="button-addon2">중복확인</button>
						</div>
					</div>


					<div class="modal-footer">
						<button type="button" class="btn bg-gradient-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn bg-gradient-primary">저장</button>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="../resources/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="../resources/assets/img/favicon.png">
<title>Soft UI Dashboard by Creative Tim</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<link rel="stylesheet"
	href="../resources/dist/themes/default/style.min.css" />

<link href="../resources/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="../resources/assets/css/nucleo-svg.css" rel="stylesheet" />
<link href="../resources/assets/css/nucleo-svg.css" rel="stylesheet" />
<link id="pagestyle"
	href="../resources/assets/css/soft-ui-dashboard.css?v=1.0.3"
	rel="stylesheet" />
<script src="../resources/dist/jstree.min.js"></script>
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
</head>
<body>
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
						<button type="submit" class="btn bg-gradient-primary delpro">삭제</button>
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
							<select class="btn bg-gradient-info dropdown-toggle" id="ctitle" name = "category">제품
								분류
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
							<button class="btn btn-outline-primary mb-0" type="button">중복확인</button>
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
						<button type="submit" class="btn bg-gradient-primary">수정</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<form action="/addProduct" method="get">
		<div class="modal fade" id="addProduct1" tabindex="-1"
			role="dialog" aria-labelledby="addProduct1Label" aria-hidden="true">
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
							<select class="btn bg-gradient-info dropdown-toggle" id="ctitle1" name="category">제품
								분류
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
						<label class="form-control-label"
							for="addNo">제품번호</label>
						<div class="input-group mb-3">
							<input type="text" id="addNo" name="productno"
								class="form-control " 
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<button class="btn btn-outline-primary mb-0" type="button">중복확인</button>
						</div>

						<label class="form-control-label" for="addTitle">제품 이름</label>
						<div class="input-group">
							<input type="text" id="addTitle" name="name"
								class="form-control" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default">
						</div>

						<label class="form-control-label" for="addImg">이미지</label>
						<div id="thumb1"></div>
						<div class="input-group">
							<input type="file" class = "img" id="addImg" class="form-control"
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
						<button type="submit" class="btn bg-gradient-primary">추가</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
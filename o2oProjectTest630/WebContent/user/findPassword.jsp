<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<link rel="stylesheet" type="text/css" href="../css/style.css" />
		<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="https://s3.amazonaws.com/codecademy-content/projects/bootstrap.min.css">
		<script>

		</script>

		<style type="text/css">
			tr {
				height: 50px;
			}

			td {
				line-height: 60px;
			}

			body {
				/*background: url(../image/bgImage/g.jpg) no-repeat;*/
			}

			.forbtn {
				align-content: center;
				font-family: Arial;
				font-size: larger;
				width: 30%;
				/*height: ;*/
			}
		</style>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>找回密码</title>
	</head>

	<body>
		<hr style="width: auto; color: aquamarine; height: auto; display: block" />

		<!--<div class="header">
			<div class="container">
				<img src="https://s3.amazonaws.com/codecademy-content/projects/pocketbook/logo.svg">
			</div>
		</div>-->

		<div class="main">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<h1 style="color:black">找回密码</h1>
						<form>
							<div class="form-group">
								<label style="color:black">请输入您的学号：</label> <input type="text" class="form-control" id="first">
							</div>
							<div class="form-group">
								<label style="color:black">请输入您的验证问题：</label> <input type="text" class="form-control" id="last">
							</div>
							<div class="form-group">
								<label style="color:black">请输入您问题的答案：</label> <input type="text" class="form-control" id="email">
							</div>

							<br />
							<button type="submit" class="btn btn-info col-lg-3" style="color:black">确认</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<hr style="width: auto; color: aquamarine; height: auto; display: block" />
		<jsp:include page="../footer.jsp" flush="true" />
	</body>

	</html>
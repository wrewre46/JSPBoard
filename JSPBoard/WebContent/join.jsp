<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="main.jsp">JSP Board</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#board-navbar" aria-controls="board-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="board-navbar">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="main.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="board.jsp">Board</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">접속하기</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="login.jsp">로그인</a></li>
                                <li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
                                <%-- <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>--%>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
        	<div class="offset-lg-4"></div>
        	<div class="offset-lg-4">
        		<div class="col-lg-6" style="padding-top: 100px">
        			<form method="post" action ="joinAction.jsp">
        				<h3 style="text-align: center;">회원가입</h3>
        				<div style="padding-bottom: 10px"></div>
        				<div class="form-group">
        					<input type="text" class="form-control" placeholder="아이디" name = "userID" maxlength="20">
        				</div>
        				<div style="padding-bottom: 10px"></div>
        				<div class="form-group">
        					<input type="password" class="form-control" placeholder="비밀번호" name ="userPassword" maxlength="20">
        				</div>
        				<div style="padding-bottom: 10px"></div>
        				<div class="form-group">
        					<input type="text" class="form-control" placeholder="이름" name ="userName" maxlength="20">
        				</div>
        				<div style="padding-bottom: 10px"></div>
        				<div class="form-group">
        					<input type="email" class="form-control" placeholder="이메일" name ="userEmail" maxlength="20">
        				</div>
        				<div style="padding-bottom: 10px"></div>
        				<input type="submit" class="btn btn-primary form-control" value="회원가입">
        		   </form>
        	   </div>
        	</div>
        </div>
        <div class="offset-lg-4"></div>
          
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
        
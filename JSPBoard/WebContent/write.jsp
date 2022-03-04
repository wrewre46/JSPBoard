<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>
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
        <%
        	String userID =null;
        	if(session.getAttribute("userID") !=null){
        		userID = (String) session.getAttribute("userID");
        	}
        %>
        	
            <% 
        		if(userID==null){
        			
        	 %>
        	 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="main.jsp">JSP Board</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#board-navbar" aria-controls="board-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="board-navbar">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="active"><a class="nav-link active" aria-current="page" href="main.jsp">Home</a></li>
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
        	<%
        		}else{
        	%>
        	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="main.jsp">JSP Board</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#board-navbar" aria-controls="board-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="board-navbar">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="active"><a class="nav-link active" aria-current="page" href="main.jsp">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="board.jsp">Board</a></li>
                        	<li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">회원관리</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
                              
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        	<% 
        		}        	
        	%>        
        <!-- Page content-->
        <form method="post" action="writeAction.jsp">
        	<div class="container">
            <div class="row">
            	<table class = "table table-striped" style="text-align: center; border: 1px solid #dddddd">
            		<thead>
            			<tr>
            				<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
            				          				
            			</tr>
            		</thead>
            		<tbody>
            			<tr>            			
            				<td><input type="text" class="form-control" placeholder="글 제목" name = "boardTitle" maxlength= "50"></td>
            				</tr>
            				<tr>
            				<td><textarea  class="form-control" placeholder="글 내용" name = "boardContent" maxlength= "2048" style="height:350px"></textarea></td>
            				
            			</tr>
            		</tbody>
            	</table>              
                      
            </div>
            <input type="submit" class="btn btn btn-primary" style="float: right;" value="글쓰기">
            	
        </div>
        </form>
        
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>

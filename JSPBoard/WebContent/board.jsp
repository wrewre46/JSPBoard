<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>
<%@page import="Board.BoardDAO" %>
<%@page import="Board.Board" %>
<%@page import="java.util.*" %>
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
    <style type ="text/css">
		a, a:hover{
			coler:#000000;
			text-decoration:none;
		}
	</style>	
    <body>
        <!-- Responsive navbar-->
        <%
        	String userID =null;
        	if(session.getAttribute("userID") !=null){
        		userID = (String) session.getAttribute("userID");
        	}
        	int pageNumber =1;
        	if(request.getParameter("pageNumber") !=null){
        		pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
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
        <div class="container">
            <div class="row">
            	<table class = "table table-striped" style="text-align: center; border: 1px solid #dddddd">
            		<thead>
            			<tr>
            				<th style="background-color: #eeeeee; text-align: center;">번호</th>
            				<th style="background-color: #eeeeee; text-align: center;">제목</th>
            				<th style="background-color: #eeeeee; text-align: center;">작성자</th>
            				<th style="background-color: #eeeeee; text-align: center;">작성일</th>            				
            			</tr>
            		</thead>
            		<tbody>
            			
            			<%
            				BoardDAO boardDAO = new BoardDAO();
            				ArrayList<Board> list = boardDAO.getList(pageNumber);
            				for(int i =0; i<list.size(); i++){
            					
            			%>
            			<tr>
            				<td><%= list.size()-i%></td>
            				<td><a href="view.jsp?BoardID=<%= list.get(i).getBoardID() %>"><%=list.get(i).getBoardTitle() %></a></td>
            				<td><%= list.get(i).getUserID() %></td>
            				<td><%= list.get(i).getBoardDate().substring(0,11)+list.get(i).getBoardDate().substring(11,13)+"시 "+ list.get(i).getBoardDate().substring(14,16)+"분" %></td>
            			</tr>
            			<%
            				}
            			%>
            		</tbody>
            	</table>  
            	<div class="pagination justify-content-center">           
                      <% 
                        if(pageNumber !=1){
                       %>
                         <a href="board.jsp?pageNumber=<%=pageNumber -1%>" class="btn btn-success" >이전</a>
                       <%
                        }if(boardDAO.nextPage(pageNumber+1)){
                       %>
                         <a href="board.jsp?pageNumber=<%=pageNumber +1%>" class="btn btn-success">다음</a>
                      <%
                        }
                      %>
              </div> 
            </div>
            <a href="write.jsp" class="btn btn-primary" style="float: right;">글쓰기</a>
            	
        </div>
        
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>

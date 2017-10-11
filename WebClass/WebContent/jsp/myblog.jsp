<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.dimigo.vo.UserVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>유민의 블로그</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	<link rel="stylesheet" href="/WebClass/myblog/myblog.css">
</head>
<body>

   <!-- Navbar   -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="myblog-home.html">Blog</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#navbarSupportedContent"
         aria-controls="navbarSupportedContent" aria-expanded="false"
         aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav mr-auto">
            <li class="nav-item" onmouseover="menu_over(this);"
               onmouseout="menu_out(this);"><a class="nav-link"
               href="myblog.html">소개 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item" onmouseover="menu_over(this);"
               onmouseout="menu_out(this);"><a class="nav-link"
               href="favoritefood.html">좋아하는 음식</a></li>
            <li class="nav-item" onmouseover="menu_over(this);"
               onmouseout="menu_out(this);"><a class="nav-link"
               href="hobby.html">취미</a></li>
         </ul>
         
         <%-- 세션이 없는 경우 --%>
          <%
             UserVO user = (UserVO) session.getAttribute("user");
             if(user == null){
          %>

         <form class="form-inline my-2 my-lg-0" action="/WebClass/bloglogin" method="post" id="loginForm">
            <input class="form-control mr-sm-2" type="email" name="id" placeholder="ID" aria-label="ID" id="id" required
            <%if(request.getParameter("id")==null){ %>
            value=""
            <%}
            else{%>
            value="<%=request.getParameter("id") %>"
            <%} %>
            >
            <input class="form-control mr-sm-2" type="password" name="pwd" placeholder="PASSWORD" aria-label="Password" id="pw" required>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="login">Login</button>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="signup" onclick="location.href='myblog-signup.html'">
            Sign Up</button>
         </form>
         <%-- 세션이 있는 경우 --%>
         <%} 
           else{
           %>

         <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
            <li class="nav-item dropdown"><a
               class="nav-item nav-link dropdown-toggle mr-md-2" href="#"
               id="bd-versions" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <%=user.getName()%> 님
            </a>
               <div class="dropdown-menu dropdown-menu-right"
                  aria-labelledby="bd-versions">
                  <form action="/WebClass/bloglogout" method="post">
                     <button type="submit" class="dropdown-item">Sign out</button>
                  </form>
                  <div class="dropdown-divider"></div>
                  <button type="button" class="dropdown-item">Action1</button>
                  <button type="button" class="dropdown-item">Action2</button>

               </div>
            </li>
         </ul>

         <%
            }
         %>
      </div>
   </nav>

   <!-- Modal -->
   <div class="modal" id="myModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">로그인 결과</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>


 	<div id="container">
        <h1>저의 블로그에 오신 것을 환영합니다.</h1> 한번 둘러보고 가세요
    </div>

   <!-- Optional JavaScript -->

   <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
      integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
      crossorigin="anonymous"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
      integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
      crossorigin="anonymous"></script>
    </script>
    <script>
   <%
   
   if ("error".equals(request.getAttribute("msg"))) {
   
   %>
   
   var myModal = $('#myModal');
  	 	myModal.find('.modal-title').text('로그인 에러!');
  		myModal.find('.modal-body').text('틀린 아이디 입니다!');
  	 	myModal.modal();
   <%
   }
   %>
   
    </script>

</body>
</html>
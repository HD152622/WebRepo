<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
   integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
   crossorigin="anonymous">
  
   <link rel="stylesheet" herf = "../css.footer.css">
<style>
div.container {
   padding-top: 30px;
   padding-bottom: 20px;
}
</style>
<script>
   function menu_over(e) {
      e.setAttribute("calss", "nav-item active");
   }
   function menu_out(e) {
      e.setAttribute("calss", "nav-item"); // <li class="nav-item">
   }
</script>
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="#">Home</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#navbarSupportedContent"
         aria-controls="navbarSupportedContent" aria-expanded="false"
         aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <%@ include file="menu.jsp"%>
         <form class="form-inline my-2 my-lg-0" id="loginForm">
            <input class="form-control mr-sm-2" type="text" placeholder="ID"
               aria-label="ID" id="id" required> <input
               class="form-control mr-sm-2" type="password" placeholder="PWD"
               aria-label="PWD" id="pwd" required>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">로그인</button>
         </form>
      </div>
   </nav>
   
   <%@ include file = "modal.jsp"%>
  
   <div class="container">
      <h1>Hello, Bootstrap!</h1>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem
         accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae
         ab illo inventore veritatis et quasi architecto beatae vitae dicta
         sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit
         aspernatur aut odit aut fugit, sed quia consequuntur magni dolores
         eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est,
         qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,
         sed quia non numquam eius modi tempora incidunt ut labore et dolore
         magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis
         nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut
         aliquid ex ea commodi consequatur? Quis autem vel eum iure
         reprehenderit qui in ea voluptate velit esse quam nihil molestiae
         consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla
         pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus
         qui blanditiis praesentium voluptatum deleniti atque corrupti quos
         dolores et quas molestias excepturi sint occaecati cupiditate non
         provident, similique sunt in culpa qui officia deserunt mollitia
         animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis
         est et expedita distinctio. Nam libero tempore, cum soluta nobis est
         eligendi optio cumque nihil impedit quo minus id quod maxime placeat
         facere</p>
         
          <%@ include file = "footer.jsp"%>
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

   <script>
      $(document).ready(function() {
         $('#loginForm').submit(function(event) {
            // ìëì¼ë¡ submit ëë ê±¸ ë§ê¸°
            event.preventDefault();

            // id, pwdê° ê°ì ¸ì¤ê¸°
            // document.getElementById("id").value
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            console.log(id, pwd);

            // ìë²ë¡ post ì ì¡(ajax)
            $.post( "/WebClass/login", 
               {"id" : id, "pwd" : pwd }, 
               function(data) {
                  //alert(data.form.id + 로그인 되었습니다');
                  var myModal = $('#myModal');
                  myModal.modal();
                  myModal.find('.modal-body').text(data.id + '닫기');
               });
            });
      });


      $(function() {

      });
   </script>
</body>
</html>
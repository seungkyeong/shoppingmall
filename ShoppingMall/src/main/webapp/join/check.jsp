<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align:center">
<form method="post" name="form" action="IdCheck.jsp" >
아이디 : <input type="text" name="id" maxlength="20" placeholder="아이디 입력(5-11자)" autofocus>
<input type="button" value="중복확인"onclick="Check()">
</form>
</div>

<script type="text/javascript">
   function Check() {
      var id=form.id.value;
      id=id.trim();
      if(id.length<5 || id.length>12) {
         alert("아이디는 5-11 글자로 해주세요.");
         return;
      }
      else form.submit();
   }
   
</script>
</body>
</html>
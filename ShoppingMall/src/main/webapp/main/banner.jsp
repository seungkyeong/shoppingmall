<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE HTML>
<html>
<head><title>롤링 배너</title>
<meta http-equiv="Content-Type" Content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<style type="text/css">
   body {font-size:11pt; padding:0; margin:0; text-align: center;}
   h3 {color: #85144b; font-size: 14pt; margin:10 auto; padding: 10px;}
   
   /* banner */
   .banner {position: relative; width: 580px; height: 420px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
   .banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
   .banner ul li {float: left; width: 580px; height: 420px; margin:0; padding:0;}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
   $(document).ready(function() {
      //사용할 배너
      var $banner = $(".banner").find("ul");

      var $bannerWidth = $banner.children().outerWidth();//배너 이미지의 폭
      var $bannerHeight = $banner.children().outerHeight(); // 높이
      var $bannerLength = $banner.children().length;//배너 이미지의 갯수
      var rollingId;

      //정해진 초마다 함수 실행
      rollingId = setInterval(function() { rollingStart(); }, 4000);//다음 이미지로 롤링 애니메이션 할 시간차
            
      function rollingStart() {
         $banner.css("width", $bannerWidth * $bannerLength + "px");
         $banner.css("height", $bannerHeight + "px");
         //alert(bannerHeight);
         //배너의 좌측 위치를 옮겨 준다.
         $banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
            //첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
            $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
            //뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
            $(this).find("li:first").remove();
            //다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
            $(this).css("left", 0);
            //이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
         });
      }
   }); 
</script>

</head>
<body>
      <div class="banner">
         <ul>
            <li><img src="../main/bannerimg/AWARD.jpg" width="580" height="420px"></li>
            <li><img src="../main/bannerimg/EVENT.jpg" width="580" height="420px"></li>
            <li><img src="../main/bannerimg/STORE.jpg" width="580" height="420px"></li>
         </ul>
      </div>
   </body>
</html>
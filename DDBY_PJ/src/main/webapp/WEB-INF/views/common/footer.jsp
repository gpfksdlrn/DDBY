<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<title>footer</title>

<style>
	.qnaBtn{
		width: 55px;
    	position: absolute;
    	left: 1700px;
    	cursor: pointer;
	}
	
	.chat_wrap{
		left: 1550px;
	    position: absolute;
	    top: -318px;
	    border-radius: 5px;
	    height: 326px;
	    display: block;
	    background: beige;
	    width: 327px;
	}
	
	.sendBtn{
	    height: 30px;
    	font-size: 14px;
    	font-weight: 600;
    	margin: 5px 0 0 4px;
	}
	
	.messageArea{
		height: 327px;
    	width: 327px;
    	padding: 10px;
    	font-size: 14px;
	}
	
	.message{
		width:276px;
		height:30px;
		font-size: 14px;
	}
	
</style>
</head>
<body>
<footer class="footer">
    <div class="page-up">
        <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="footer__logo">
                    <a href="./index.html"><img src="resources/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="footer__nav">
                    <ul>
                        <li class="active"><a href="javascript:;">회사소개</a></li>
                        <li><a href="chat.do">이용약관</a></li>
                        <li><a href="javascript:;">개인정보처리방침</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3">
                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | 대표이사:천동민, 문혜란
                  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>

              </div>
          	  <img alt="" src="resources/img/chat.png" class="qnaBtn">
          	  <div class="chat_wrap">
          	  	<div id="msg_frame">
					<div id="msg_div">
						<div class="messageArea"></div>
						<input type="text" class="message" style=""/>
						<input type="button" class="sendBtn" value="전송" onclick="send(this);"/>
					</div>
				</div> 
          	  </div>
          </div>
      </div>
  </footer>
  
  <!-- Js Plugins -->
<script  type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script  type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script  type="text/javascript" src="resources/js/player.js"></script>
<script  type="text/javascript" src="resources/js/jquery.nice-select.min.js"></script>
<script  type="text/javascript" src="resources/js/mixitup.min.js"></script>
<script  type="text/javascript" src="resources/js/jquery.slicknav.js"></script>
<script  type="text/javascript" src="resources/js/owl.carousel.min.js"></script>
<script  type="text/javascript" src="resources/js/main.js"></script>
<script>
	var userId = "${loginUser.user_email}";
	
	$(document).ready(function(){
		$('.chat_wrap').hide();
	});
	
	let sock = new SockJS("http://ddby.asuscomm.com:8898/ddby/echo/");
	sock.onmessage = onMessage;
	
	
	$('.qnaBtn').click(function(){
		sock.onclose = onClose;
		
		if(userId=="admin@ddby.com"){
			location.href='chat.do';
		}else{
			$('.chat_wrap').toggle();
		}
	});
	
	
	// 메시지 전송
	function send(obj){
		var id = $(obj).parents().attr("id");
		$("#"+id).find(".messageArea").append("나 : "+$("#"+id).find(".message").val()+"<br/>");
		$.ajax({
        	url: "sendMessage.do",
        	data: {id:id},
        	type: "GET",
        	contentType : "application/json; charset:UTF-8",
        	async:false,	// 비동기식 ajax를 동기식으로 설정하여 순차적 접근을 할 수 있게 한다.
        	success: function(data){
        		sendMessage(id);
        	}
        });
		
		$('.message').val('');
	}
		
	
	function sendMessage(id) {
		sock.send($("#"+id).find(".message").val());
	}
	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var Message = msg.data;
		$.ajax({
	        	url: "onMessage.do",
	        	type: "GET",
	        	contentType : "application/json; charset:UTF-8",
	        	async:false,	// 비동기식 ajax를 동기식으로 설정하여 순차적 접근을 할 수 있게 한다.
	        	success: function(data){
	        		// 관리자 측에서 메시지를 받았을 경우
	        		 if(data=="ok"){
	        			 	//메세지 뒤에 붙어있는 8자리의 아이디를 잘라 저장한다.
		        			var id = Message.slice(-8);
		        			Message = Message.slice(0,-8);
		        			
		        			// 웹 소켓 id로 되어있는 div id가 존재 할 경우(이미 대화창이 존재 할 경우)
		        			if($("#"+id).length>0){
			        			$("#"+id).find(".messageArea").append(id+": " +Message + "<br/>");
		        			}else{
		        				$("#msg_frame").append("<div id='"+id+"'style='float:left; border: 1px solid black; height: auto'><div class='messageArea'></div><input type='text' class='message'/><input type='button' class='sendBtn' value='submit' onclick='send(this);'/></div>");
		        				$("#"+id).find(".messageArea").append(id+": " + Message + "<br/>");
		        			}
		        		}else{
		        			//유저측에서 받으면 그냥 메세지창에 받은 메세지 추가
		        			$(".messageArea").append("관리자 : "+Message + "<br/>");
		        		} 
	        	}
	    });
	}
	
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$(".messageArea").append("연결 끊김"+"<br/>");
	}
</script>

</body>
</html>
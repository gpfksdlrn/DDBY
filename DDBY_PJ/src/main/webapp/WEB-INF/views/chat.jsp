<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>
<style>
	#msg_frame{
		font-size: 14px;
	    width: 1170px;
	    margin: 20px auto;
	    display: grid;
	    grid-template-columns: 327px 327px 1fr;
	    row-gap: 35px;
	    column-gap: 95px;
	}
	.messageArea{
		background: beige;
	    color: black;
	    width: 327px;
	    height: 327px;
	    overflow-y: scroll;
	    padding: 10px;
	}
</style>
<body>
    <!-- Header Section Begin -->
    <%@ include file="common/header.jsp" %>
    <!-- Header End -->
    
	<div id="msg_frame">
		
	</div>    
</body>

<script type="text/javascript">
	
	/* 동적으로 추가된 div에 이벤트 추가 */
	$(document).on("keyup", '.message', function(){
		if(window.event.keyCode==13){
    		$(this).parent().find('.sendBtn').trigger("click");
    	}
	});
	
	
	let sock = new SockJS("http://ddby.asuscomm.com:8898/ddby/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
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
		        				$("#msg_frame").append("<div id='"+id+"'style='float:left; border: 1px solid black; height: auto'><div class='messageArea'></div><input type='text' class='message'/><input type='button' class='sendBtn' value='전송' onclick='send(this);'/></div>");
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
		$("#messageArea").append("연결 끊김"+"<br/>");
	}
</script>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOBOYUNG</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
 <form action="payResult.do" method="post">
    <input type="hidden" name="coupon" value="${ coupon }">
    <input type="hidden" name="point" value="${ point }">
    <input type="hidden" name="total_pay" value="${ total_pay }">
    <input type="hidden" name="dc_pay" value="${ dc_pay }">
    <input type="hidden" name="cost_pay" value="${ cost_pay }">
    <input type="hidden" name="total_age" value="${ total_age }">
    <input type="hidden" name="select_Seat" value="${ select_Seat }">
    <input type="hidden" name="ms_no" value="${ ms_no }">
    <input type="hidden" name="mShowTime" value="${ mShowTime }">
 	
	 <button class="amount_button_form" style="visibility: hidden;"></button>
 </form>
 
<script>
 $(function(){
     var IMP = window.IMP; // 생략가능
     IMP.init('imp87152259'); // 대신 부여받은 "가맹점 식별코드"를 사용
     var msg;
     
     IMP.request_pay({
         pg : 'kakaopay',
         pay_method : 'card',
         merchant_uid : 'merchant_' + new Date().getTime(),
         name : '또보영 영화 결제',
         amount : '${total_pay}',
         buyer_email : '${loginUser.user_email}',
         buyer_name : '${loginUser.user_name}'
         //m_redirect_url : 'http://www.naver.com'
     }, function(rsp) {
         if ( rsp.success ) {
             //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
             jQuery.ajax({
                 url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의
                 type: 'POST',
                 dataType: 'json',
                 data: {
                     imp_uid : rsp.imp_uid
                     //기타 필요한 데이터가 있으면 추가 전달
                 }
             })
             
             //성공시 표시할 메세지와 성공 페이지 이동
           	msg = '\n결제가 완료되었습니다.'
             msg += '\n결제 금액 : ' + rsp.paid_amount;
             alert(msg);
             $('.amount_button_form').trigger("click");
                
         } else {
             msg = '결제에 실패하였습니다.\n';
             msg += '에러내용 : ' + rsp.error_msg;
             alert(msg);
             //실패시 이동할 페이지
             location.href="showtime.do";
         }
     });
 });
</script>
</body>
</html>
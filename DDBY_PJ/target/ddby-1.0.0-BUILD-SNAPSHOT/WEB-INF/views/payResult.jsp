<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<head>
    <meta charset="UTF-8">
    <title>DDOBOYUNG</title>

    <style>
        .wrap_payResult {
            display: grid;
            grid-template-columns: 76px 1fr;
            border: 1px solid white;
            overflow: hidden;
            position: relative;
            width: 1170px;
            height: 865px;
            margin: 0 auto;
        }

        .article_result {
            position: relative;
            float: left;
            box-sizing: border-box;
        }

        .movie_li {
            border-bottom: 1px solid #666666;
            border-right: 1px solid #666666;
            background-color: #333333;
            width: 76px;
            height: 216px;
            text-align: center;
            line-height: 208px;
            font-size: 14px;
            color: white;
        }

        .article_result .group_top {
            overflow: hidden;
            position: relative;
            height: 55px;
            border-right: 1px solid #222;
            text-align: center;
            background-color: #000;
        }

        .article_result .group_top .tit {
            font-size: 18px;
            line-height: 55px;
            color: #FFF;
        }

        .article_result .inner_result {
            overflow: hidden;
            height: 810px;
        }

        .article_result .inner_result .payment_fin_wrap {
            width: 685px;
            margin: 0 auto;
        }

        .article_result .inner_result .payment_fin_wrap .top_notice {
            margin: 30px 0 20px;
            font-size: 15px;
            text-align: center;
            background-repeat: no-repeat;
            background-position: center top;
        }

        .article_result .inner_result .payment_fin_wrap .paycard {
            width: 70px;
            height: 50px;
            margin: 0 auto;
        }

        .article_result .inner_result .payment_fin_wrap p {
            color: white;
            margin-top: 17px;
            font-size: 14px;
            font-weight: 600;
        }

        .article_result .inner_result .payment_fin_wrap .result_wrap {
            position: relative;
            padding: 40px 20px 25px;
            border-radius: 4px;
            border: 1px solid #DDD;
        }

        .result_wrap .info_wrap .bx_thm {
            overflow: hidden;
            float: left;
            width: 150px;
            height: 215px;
            margin-right: 50px;
            border-radius: 4px;
        }

        .result_wrap .info_wrap .bx_thm img {
            width: 150px;
            height: 214px;
        }

        .group_infor {
            margin-top: 20px;
        }

        .group_infor dl {
            float: left;
            margin: 0 0 10px 0;
        }

        .group_infor dl:first-child {
            color: white;
            padding-bottom: 10px;
            border-bottom: 1px solid beige;
        }

        .group_infor dl dt {
            clear: both;
            float: left;
            width: 86px;
            line-height: 1.4;
            margin: 4px 0;
            font-size: 15px;
            color: #fff;
        }

        .group_infor dl dd {
            float: left;
            width: 315px;
            line-height: 1.4;
            margin: 4px 0;
            font-size: 15px;
            color: #fff;
        }

        .group_infor dl dd strong.txt_num {
            font-family: 'Roboto';
            color: #fff;
        }

        /* 결제정보 */
        .result_wrap .payment_wrap {
            display: inline-flex;
            margin-top: 30px;
            padding-top: 20px;
            width: -webkit-fill-available;
            border-top: 1px solid #DDD;
            color: white;
        }

        .payment_wrap .group_price {
            border-right: 0;
            position: relative;
            float: left;
            padding: 0 25px;
        }

        .payment_wrap svg {
            font-size: 15px;
            margin-top: 3px;
        }

        .payment_wrap dl:after {
            content: "";
            display: block;
            clear: both;
        }

        .payment_wrap dl dt {
            clear: both;
            float: left;
            line-height: 1.4;
            margin: 2px 0 6px;
            font-size: 13px;
        }

        .payment_wrap dl dd {
            float: right;
            line-height: 1.4;
            margin: 2px 0 6px;
            font-size: 13px;
        }

        .payment_wrap dl dd strong {
            font-family: 'Roboto';
        }

        .payment_wrap .group_price.case1 {
            width: 160px;
            padding-left: 0;
            margin-left: 22px;
        }

        .payment_wrap .group_price.case2 {
            width: 170px;
        }

        .payment_wrap .group_price.case3 {
            width: 215px;
            padding-right: 0;
            border-right: 0;
        }

        /* 유의사항 */
        .list_txt {
            font-size: 11px;
            color: white;
            padding: 20px;
        }

        .list_txt li {
            margin-bottom: 3px;
            list-style-type: disc;
        }

        .list_txt strong {
            font-size: 11px;
            color: #D6554E;
        }

        /* 결제완료 버튼 */
        .payment_fin_wrap .btn_wrap {
            margin: 5px 0 0;
            text-align: center;
        }

        .btn_payresult {
            margin-left: 10px;
            background-color: #0B0C2A;
            border: 1px solid #fff;
            color: beige;
            text-align: center;
            font-size: 16px;
            border-radius: 5px;
            transition: 0.3s;
            padding: 6px;
            cursor: pointer;
        }

        .btn_payresult:hover {
            margin-left: 10px;
            background-color: #E53637;
            font-weight: 500;
            color: white;
            outline: none;
            height: 35px;
            line-height: 0px;
        }
    </style>
</head>

<body>

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
	<%@ include file="common/header.jsp" %>
    <!-- Header End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="index.do"><i class="fa fa-home"></i> Home</a>
                        <span>상영시간표</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="wrap_payResult">
            <div style="float: left;">
                <ul>
                    <li class="movie_li">
                        상영시간
                    </li>
                    <li class="movie_li">
                        인원/좌석
                    </li>
                    <li class="movie_li">
                        결제
                    </li>
                    <li class="movie_li sel_li">
                        결제완료
                    </li>
                </ul>
            </div>
            <div class="article_result article_movie">
                <div class="group_top">
                    <h4 class="tit movie_name">결제완료</h4>
                </div>
                <div class="inner_result">
                    <div class="payment_fin_wrap">
                        <div class="top_notice">
                            <img class="paycard" src="resources/img/paycard.png">
                            <p>${ loginUser.user_name } 회원님, 결제가 성공적으로 완료되었습니다.</p>
                        </div>
                        <div class="result_wrap">
                            <!-- 영화정보 -->
                            <div class="info_wrap">
                                <div class="bx_thm">
                                    <img src="resources/img/poster/${ mv.movie_poster }"
                                        alt="${ mv.movie_title }">
                                </div>
                                <div class="group_infor">
                                    <dl>
                                        <dt>예매번호</dt>
                                        <dd>
                                            <strong class="txt_num">${ reserNum }</strong>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>상영일시</dt>
                                        <dd>${ mShowTime }</dd>
                                        <dt>상영관</dt>
                                        <dd>또보영 ${ getMs_theater }관</dd>
                                        <dt>관람인원</dt>
                                        <dd>${ total_age }</dd>
                                        <dt>좌석</dt>
                                        <dd>${ select_Seat }</dd>
                                    </dl>
                                </div>
                            </div>
                            <!-- 결제정보 -->
                            <div class="payment_wrap">
                                <div class="group_price case1">
                                    <dl>
                                        <dt>주문금액</dt>
                                        <dd>
                                            <strong>${ cost_pay }</strong>원
                                        </dd>
                                    </dl>
                                </div>
                                <i class="fas fa-minus" style="font-size: 15px;"></i>
                                <div class="group_price case2">
                                    <dl>
                                        <dt>할인금액</dt>
                                        <dd><strong>${ dc_pay }</strong>원</dd>
                                    </dl>
                                </div>
                                <i class="fas fa-equals" style="font-size: 15px;"></i>
                                <div class="group_price case3">
                                    <dl>
                                        <dt>총 결제 금액</dt>
                                        <dd><strong>${ total_pay }</strong>원</dd>
                                    </dl>
                                    <div class="pay_method">
                                        <dl class="sml">
                                            <dt>카드번호</dt>
                                            <c:if test="${ total_pay eq '0'}">
                                            	<dd class="sml last">포인트 결제</dd>
                                            </c:if>
                                             <c:if test="${ total_pay ne '0'}">
                                            	<dd class="sml last">카카오페이 온라인 </dd>
                                            </c:if>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <ul class="list_txt">
                            <li><strong>온라인 예매 및 추가상품 구매 취소는 상영 시작 20분 전까지 온라인에서 가능합니다.</strong></li>
                            <li><strong>상영시작 20분전 이후 부터는 영화관 현장에서만 취소 가능합니다.</strong></li>
                            <li><strong>반드시 전체 취소만 가능하며, 예매나 추가상품중 부분 취소는 불가능합니다.</strong></li>
                            <li><strong>추가상품 수령 완료 시 예매 및 상품 취소 모두 불가능합니다.</strong></li>
                            <li><strong>무대인사 예매 취소는 상영시작 24시간 전까지 가능합니다.</strong></li>
                            <li>예고편 상영 등 사정에 의해 본 영화 시작이 10여분 정도 차이 날 수 있습니다.</li>
                            <li>개인정보 보호 정책에 따라 주민번호로 예매 티켓을 찾을 수 없습니다. 꼭 예매번호를 확인해 주세요.</li>
                        </ul>
                        <div class="btn_wrap">
                            <a class="btn_payresult" href="my_buyList.do">결제내역</a>
                            <a class="btn_payresult" href="index.do">홈으로</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $('.tit_wrap').click(function () {
                $('.tit_wrap').removeClass('movie_select_active');
                $(this).addClass('movie_select_active');
            });
        </script>
    </section>
    <!-- Product Section End -->
	<%@ include file="common/footer.jsp" %>
</body>

</html>
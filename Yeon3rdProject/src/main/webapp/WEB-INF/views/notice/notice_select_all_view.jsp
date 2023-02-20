<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 국민 은행 공지 사항 </title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" >
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<link rel="stylesheet" href="./css/Yeon_KBmenu.css" />
</head>
<body>
<section style="width:1000px; margin: 0 auto;">
<header>
		<h1>
			<a href="./index.jsp"><img src="./img/main_title.png"
				width="101" height="24" border="0"></a> <br>&nbsp;&nbsp;&nbsp;<a
				href="./index.jsp"><img
				src="./img/notice_title.png" width="142" height="31" border="0"></a>

			</h1>
	</header>
<div id="menu1">
		<ul>
			<li><a href="#">커밋</a></li>
			<li><a href="#">신상품</a></li>
			<li><a href="#">매거진</a></li>
		</ul>
</div>

         <br><div align="left">
			<strong style="font-size: 20px;">공지사항</strong>
			</div> <br>
<table class="table">
	<thead>
		<tr>
			<th></th><th scope="col"> 작성일 </th> <th scope="col"> 제목</th>
			<th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th>
		</tr>
	</thead>
	<%-- 객체를 호출하고 파라미터에 저장하여 반복한다.--%>
	 <c:forEach var="list" items="${list}">
	<tbody>
		<tr>
			<td></td><td><small class="form-text text-muted" style="font-size: 12px;">
			<fmt:parseDate var="dateTempParse" value="${list.writeday}" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${dateTempParse}" pattern="yyyy/MM/dd"/></small> </td> 
			  <td style="color: black; text-decoration: none;">
             <%-- 글 제목을 클릭했을 때 글 내용 보기 요청한다.--%>
             <b><a href="./NoticeSelectDetail.three?num=${list.num}" style="color: black; text-decoration: none;" >${list.subject}</a></b>
            </td>
		</tr>
		<%-- 객체값이 null일 경우에 반환한다.--%>
				<c:if test="${empty list}">
					<tr>
						<td colspan="4">등록된 공지가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
	</c:forEach>
</table>

    <p align="right">
        전체:
        <strong>${listcount}</strong>
        개
       </p>
	<%-- 관리자만 글쓰기 가능하도록 <c:if test="${sessionScope.id == 'admin'}"> 추가 --%>
<a href="./NoticeInsert">
<button type="button" style="float: right; background: white; border: 1px solid #dee2e6; color: #5f584c; font-size: 15px; margin:10spx;"
>글등록</button></a>
</section>


<%-- 페이징 시작 --%>
<div style="width:280px; margin: 0 auto;">
  <ul class="pagination">
    <c:if test="${pageMaker.prev}">
    	<li class="page-item disabled">
    	<a class="page-link" href="NoticeSelect${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li class="page-item active"><a href="NoticeSelect${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="page-item"><a href="NoticeSelect${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
<%-- 페이징 끝 --%>
</body>
</html>
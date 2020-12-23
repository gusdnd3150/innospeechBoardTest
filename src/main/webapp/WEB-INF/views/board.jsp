<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

    <div class="container" align="center" style="padding-top: 20%">
      <h1>게시판 테스트</h1>
      <div class="row">
        <div class="col-lg-12">
          <table class="table">
             <tr>
               <th></th> <!-- rowN 들어올자리 -->
               <th>제목</th>
               <th>내용</th>
               <th>작성자</th>
               <th>작성일</th>
             </tr>
             <c:choose>
               <c:when test="${empty boardList }">
               <tr>
                <td>등록된 글이 없습니다.</td>
               </tr>
               </c:when>
               
               <c:when test="${not empty boardList }">
                 <c:forEach var="boardList" items="${boardList }">
                     <tr> 
                        <td>${boardList.rowN }</td>
                        <td><a href="#" onclick="return boardDetail(${boardList.boardNum});">${boardList.title }</a></td>
                        <td>${boardList.content }</td>
                        <td>${boardList.writer }</td>
                        <td>${boardList.updateD }</td>
                     </tr>
                 </c:forEach>
               </c:when>
             </c:choose>
             
          
          
          </table>
          
          <!-- 페이징 부분 -->
          <div style="display: block; text-align: center;">
	     <c:if test="${paging.startPage != 1 }">
			<a href="/Test/mainBoard.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/Test/mainBoard.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/Test/mainBoard.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>

           <!-- button 영역 -->          
          <div>
            <button onclick="writeBoard()">글쓰기</button>
          
          </div>
          
        </div>
      </div>
    </div>

</body>

<script>

function writeBoard(){
	var check = window.confirm("게시글을 작성하시겠습니까?");
	if(check==true){
	location.href="/Test/writeBoard.do";
	}
}


function boardDetail(boardNum){
	console.log(boardNum);
	
	location.href="/Test/boardDetail.do?boardNum="+boardNum;
}
</script>




</html>
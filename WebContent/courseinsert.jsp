<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var doc=document.form;
	if(doc.id.value==""){
		alert("교과목 코드가 입력되지 않았습니다.");
		doc.id.focus();
	}else if(doc.name.value==""){
		alert("교과목명이 입력되지 않았습니다.");
		doc.name.focus();
	}else if(doc.credit.value==""){
		alert("학점이 입력되지 않았습니다.");
		doc.credit.focus();
	}else if(doc.lecturer.value==""){
		
		alert("담당강사가 입력되지 않았습니다.");
	    doc.lecturer.focus();
	}else if(doc.start_hour.value==""){
		alert("시작시간이 입력되지 않았습니다");
		doc.start_hour.focus();
	}else if(doc.end_hour.value==""){
		alert("종료시간이 입력되지 않았습니다");
		doc.end_hour.focus();
	}else{
		alert("완료되었습니다");
		doc.submit();
		
	}
		
}
</script>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section id="sec1">
<br>
<h2>교과목  추가</h2>
<form name="form" method="post" action="courseinsertProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>교과목 코드</th>
<td>
<input type="text" name="id"></td>
</tr>
<tr>
<th>과 목 명</th>
<td>
<input type="text" name="name"></td>
</tr>
<tr>
<th>학 점</th>
<td>
<input type="text" name="credit"></td>
</tr>
<tr>
<th>담 당 강 사</th>
<td><select name="lecturer">
<option value="">담당강사 선택</option>
<option value="김교수">김교수</option>
<option value="이교수">이교수</option>
<option value="박교수">박교수</option>
<option value="우교수">우교수</option>
<option value="최교수">최교수</option>
<option value="강교수">강교수</option>
<option value="황교수">황교수</option>
</select>
</td>
<tr>
<th>요 일</th>
<td><input type="radio" value="1">월
<input type="radio" value="2">화
<input type="radio" value="3">수
<input type="radio" value="4">목
<input type="radio" value="5">금
<input type="radio" value="6">토
</td>
</tr>
<tr>
<th>시 작</th>
<td>
<input type="text" name="start_hour"></td>
</tr>
<tr>
<th>종 료</th>
<td>
<input type="text" name="end_hour"></td>
</tr>
<tr>
<td colspan="2">
<a href="courseselect.jsp"><input type="button" value="목록" ></a>
<input type="button" value="등록" onclick="check()"></td>
</table>

</form>

</section>
<%@include file="footer.jsp" %>
</body>
</html>
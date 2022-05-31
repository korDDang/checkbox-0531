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
	if(doc.studno.value==""){
		alert("학번이 입력되지 않았습니다.");
		doc.studno.focus();
	}else if(doc.name.value==""){
		alert("이름이 입력되지 않았습니다.");
		doc.name.focus();
	
	}else{
		alert("등록이 완료되었습니다");
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
<h2>학사 정보 등록 화면</h2>
<form name="form" method="post" action="studinsertProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>학번</th>
<td>
<input type="text" name="studno"></td>
</tr>
<tr>
<th>성명</th>
<td>
<input type="text" name="name"></td>
</tr>
<tr>
<th>학 과</th>
<td>
<select name="dept">
<option value="1">컴퓨터공학과</option>
<option value="2">기계공학과</option>
<option value="3">전자과</option>
<option value="4">영문학과</option>
<option value="5">일어과</option>
<option value="6">경영학과</option>
<option value="7">무역학과</option>
<option value="8">교육학과</option>
</select>
</td>
<tr>
<th>학 년</th>
<td><input type="radio" value="1" name="position">1학년
<input type="radio" value="2"  name="position">2학년
<input type="radio" value="3"  name="position">3학년
<input type="radio" value="4"  name="position">4학년
</td>
</tr>
<tr>
<th>취미</th>
<td><input type="checkbox" value="프로그램" name="hoppy">프로그램
<input type="checkbox" value="독서" name="hoppy">독서
<input type="checkbox" value="등산" name="hoppy">등산
<input type="checkbox" value="여행" name="hoppy">여행
<input type="checkbox" value="낚시" name="hoppy">낚시
<input type="checkbox" value="영화보기" name="hoppy">영화보기
<input type="checkbox" value="잠자기" name="hoppy">잠자기
<input type="checkbox" value="멍때리기" name="hoppy">멍때리기</td>
</tr>
<tr>
<th>주소</th>
<td>
<input type="text" name="address"></td>
</tr>
<tr>
<th>연락처</th>
<td>
<input type="text" name="phone"></td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="등록" onclick="check()">
<input type="reset" value="취소"></td>
</table>

</form>

</section>
<%@include file="footer.jsp" %>
</body>
</html>
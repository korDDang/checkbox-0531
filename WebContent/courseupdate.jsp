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
<%@include file="DBConn.jsp" %>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
String id=request.getParameter("id");
try{
	String sql="select * from course0530 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
	 String name=rs.getString("name");
	 String credit=rs.getString("credit");
	 String lecturer=rs.getString("lecturer");
	 String week=rs.getString("week");
	 String start_hour=rs.getString("start_hour");
	 String end_hour=rs.getString("end_hour");

%>
<br>
<h2>교과목  추가</h2>
<form name="form" method="post" action="courseupdateProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>교과목 코드</th>
<td>
<input type="text" name="id" value="<%=id %>"></td>
</tr>
<tr>
<th>과 목 명</th>
<td>
<input type="text" name="name" value="<%=name %>"></td>
</tr>
<tr>
<th>학 점</th>
<td>
<input type="text" name="credit" value="<%=credit %>"></td>
</tr>
<tr>
<th>담 당 강 사</th>
<td><select name="lecturer">
<option value="" <%if(lecturer.equals("")){%> selected <%}%>>담당강사 선택</option>
<option value="1"<%if(lecturer.equals("1")){%> selected <%}%>>김교수</option>
<option value="2"<%if(lecturer.equals("2")){%> selected <%}%>>이교수</option>
<option value="3"<%if(lecturer.equals("3")){%> selected <%}%>>박교수</option>
<option value="4"<%if(lecturer.equals("4")){%> selected <%}%>>우교수</option>
<option value="5"<%if(lecturer.equals("5")){%> selected <%}%>>최교수</option>
<option value="6"<%if(lecturer.equals("6")){%> selected <%}%>>강교수</option>
<option value="7"<%if(lecturer.equals("7")){%> selected <%}%>>황교수</option>
</select>
</td>
<tr>
<th>요 일</th>
<td><input type="radio" value="1" name=week<%if(week.equals("1")){%> checked <%}%>>월
<input type="radio" value="2" name=week<%if(week.equals("2")){%> checked <%}%>>화
<input type="radio" value="3" name=week<%if(week.equals("3")){%> checked <%}%>>수
<input type="radio" value="4" name=week<%if(week.equals("4")){%> checked <%}%>>목
<input type="radio" value="5" name=week<%if(week.equals("5")){%> checked <%}%>>금
<input type="radio" value="6" name=week<%if(week.equals("6")){%> checked <%}%>>토
</td>
</tr>
<tr>
<th>시 작</th>
<td>
<input type="text" name="start_hour" value="<%=start_hour%>"></td>
</tr>
<tr>
<th>종 료</th>
<td>
<input type="text" name="end_hour" value="<%=end_hour%>"></td>
</tr>
<tr>
<td colspan="2">
<a href="courseselect.jsp"><input type="button" value="목록" ></a>
<input type="button" value="등록" onclick="check()"></td>
<% 
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정실패");
}
%>
</table>

</form>

</section>
<%@include file="footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section id="sec1">
<%@include file="DBConn.jsp" %>
<br>
<h2>학사정보 목록</h2>
<br>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int ma=0;
try{
	String sql="select count(studno) from stud0530";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
총<%=ma %> 명의 학사정보가 있습니다.
<% 
try{
	String sql="select * from stud0530";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	System.out.println("조회성공");
	while(rs.next()){
		String studno=rs.getString("studno");
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
		String address=rs.getString("address");
		String phone=rs.getString("phone");
		String hoppy=rs.getString("hoppy");
		




%>

<table border="1" id="tab1">
<tr>
<th>학번</th>
<th>성명</th>
<th>학과</th>
<th>학년</th>
<th>주소</th>
<th>연락처</th>
<th>취미</th>
<th>관리</th>
</tr>
<tr>
<td id="td1"><%=studno %></td>
<td id="td1"><%=name %></td>
<td id="td1"><%=dept %></td>
<td id="td1"><%=position %></td>
<td id="td1"><%=address %></td>
<td id="td1"><%=phone %></td>
<td id="td1"><%=hoppy %></td>
<td><a href="update.jsp">수정</a>/<a href="delete.jsp">삭제</a></td>
</tr>
<% 
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<div style="text-align:center"><a href="studinsert.jsp" ><input type="button" value="학사정보 추가" ></a></div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>
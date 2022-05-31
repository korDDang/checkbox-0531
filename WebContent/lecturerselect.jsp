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
	String sql="select count(idx) from lecturer0530";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
총<%=ma %> 명의 강사가 있습니다.
<% 
try{
	String sql="select * from lecturer0530";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	System.out.println("조회성공");
	while(rs.next()){
		String idx=rs.getString("idx");
		String name=rs.getString("name");
		String major=rs.getString("major");
		String field=rs.getString("field");
		
		




%>

<table border="1" id="tab1">
<tr>
<th>강사코드</th>
<th>강사명</th>
<th>전공</th>
<th>세부전공</th>
<th>관리</th>
</tr>
<tr>
<td id="td1"><%=idx %></td>
<td id="td1"><%=name %></td>
<td id="td1"><%=major %></td>
<td id="td1"><%=field %></td>
<td><a href="update3.jsp">수정</a>/<a href="delete3.jsp">삭제</a></td>
</tr>
<% 
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<div style="text-align:center"><a href="leturerinsert.jsp" ><input type="button" value="작성" ></a></div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>
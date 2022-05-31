<%@page import="sun.security.krb5.Config"%>
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
<h2>교과목 목록</h2>
<br>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int ma=0;
try{
	String sql="select count(id) from course0530";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
총 <%=ma %>개의 교과목이 있습니다.
<% 
try{
	String sql="select * from course0530";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	System.out.println("조회성공");
	while(rs.next()){
		String id=rs.getString("id");
		String name=rs.getString("name");
		String credit=rs.getString("credit");
		String lecturer=rs.getString("lecturer");
		String week=rs.getString("week");
		String start_hour=rs.getString("start_hour");
		String end_hour=rs.getString("end_hour");
		




%>

<table border=1 id="tab1">
<tr>
<th>과목코드</th>
<th>과목명</th>
<th>학점</th>
<th>담당강사</th>
<th>요일</th>
<th>시작시간</th>
<th>종료시간</th>
<th>관리</th>
</tr>
<tr>
<td id="td1"><%=id %></td>
<td id="td1"><%=name %></td>
<td id="td1"><%=credit %></td>
<td id="td1"><%=lecturer %></td>
<td id="td1"><%=week %></td>
<td id="td1"><%=start_hour %></td>
<td id="td1"><%=end_hour %></td>
<td><a href="courseupdate.jsp?id=<%=id%>">수정</a>/<a href="coursedelete.jsp?id=<%=id%>"onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false">삭제</a></td>
</tr>
<% 
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<div style="text-align:center"><a href="courseinsert.jsp" ><input type="button" value="작성" ></a></div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>
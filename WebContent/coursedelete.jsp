<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
PreparedStatement pstmt=null;
String id=request.getParameter("id");
try{
	String sql="delete from course0530 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
	System.out.println("삭제성공");
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제실패");
}

%>
</body>
</html>
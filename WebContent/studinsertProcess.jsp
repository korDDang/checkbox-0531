<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
PreparedStatement pstmt=null;
String[] hoppy = request.getParameterValues("hoppy");
String hoppysum="";

try{
	String sql="insert into stud0530 values(?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, request.getParameter("studno"));
	         pstmt.setString(2, request.getParameter("name"));
	         pstmt.setString(3, request.getParameter("dept"));
	         pstmt.setString(4, request.getParameter("position"));
	         pstmt.setString(5, request.getParameter("address"));
	         pstmt.setString(6, request.getParameter("phone"));
	         for(int i=0;i<hoppy.length;i++){
	        	 if(i==0){
	        		  hoppysum=hoppy[i];
	        	 }else{
	        		  hoppysum+="/"+hoppy[i];
	         }
	         }
	         
	         pstmt.setString(7, hoppysum);
	         
	         pstmt.executeUpdate();
	         System.out.println("저장성공");
	         
	         
	         
	         
	         
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}


%>
</body>
</html>
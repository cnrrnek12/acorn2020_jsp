<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인된 아이디와 바꿀 비밀번호를 가지고온다
	String id=(String)session.getAttribute("id"); //세션 영역에서 아이디 읽어오기
	String pwd=request.getParameter("pwd"); //기존비밀번호
	String newPwd=request.getParameter("newPwd"); //새로 바꿀비밀번호
	// Dto 객체를 이용해서 담는다.
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setNewPwd(newPwd);
	//Dao 객체를 이용해서 수정반영하고 성공여부를 리턴받는다.
	boolean isSuccess=UsersDao.getInstance().updatePwd(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd_update.jsp</title>
</head>
<body>
<%if(isSuccess){ 
	session.invalidate();%>
	<p>비밀번호가 바뀌었습니다.<a href="../index.jsp">확인</a></p>	
<%}else{ %>
	<p>이전 비밀번호가 일치 하지 않습니다. <a href="${pageContext.request.contextPath}/users/pwd_update_form.jsp">다시시도</a></p>
<%} %>
</body>
</html>
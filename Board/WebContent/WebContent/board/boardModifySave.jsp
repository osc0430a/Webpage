<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/dbCon.jsp" %>

<% 
	
	String unq=request.getParameter("unq");
	String title=request.getParameter("title");
	String name=request.getParameter("name");
	String content=request.getParameter("content");
	
	if(title == null){
	%>
		<script>
		
			alert("잘못된 접근입니다.");
			location="../main/main.jsp";
			
		</script>
	<%	
		return;
	}
	
	title.trim();
	name.trim();
	
	if(title.equals("")){
	%>
		<script>
		
		alert("제목 입력 오류.");
		history.back();	
		
		</script>
		
	<%		
		return;
	}
	
	if(name.equals("")){
	%>
		
		<script>
		
		alert("이름 입력 오류.");
		history.back();	
		
		</script>
		
	<%
		return;
	}
	
	if(content.length() > 4000){
	%>
		
		<script>
		
		alert("내용이 너무 많습니다. \n4000자 미만으로 작성해 주세요.");
		history.back();	
		
		</script>
		
	<%		
		return;
	}
	
	String qry="update board1 set title='"+title+"', name='"+name+"', content='"+content+"', rdate=sysdate where unq="+unq;
	
	int result = stmt.executeUpdate(qry);
	
	if(result>0){
	%>
		<script>
		
		alert("수정 완료.");
		location = "boardList.jsp";
		
		</script>
		
	<%
	}
	else{
	%>
		<script>
		
		alert("수정 실패.");
		history.back();	
		
		</script>
		
	<%
		return;
	}	

%>

<html>
<head>
<title>Controle Online</title>
</head>
<%
	HttpSession sessao = request.getSession(true);  
    sessao.setAttribute("countSistema",request.getParameter("countSistema"));			
%>
<FRAMESET frameborder=0 ROWS="118,*">
<FRAME SRC="titulo.jsp">
<frameset COLS="260, 1080">
<FRAME SRC="menu.jsp" name="menu">
<FRAME SRC="mural.jsp" name="principal"> 

</frameset>
<noframes>
<body>
</body>
</noframes>
</FRAMESET>
</html>

<html>
<body>
<form id="myForm" name="myForm" action="tabela_mensal.html" method="POST"></form>

<%
	HttpSession sessao = request.getSession(true);  
	sessao.setAttribute("code","");
	sessao.setAttribute("countSistema","2");
	//String acess = request.getParameter("acess");	
%>
	<script>
		
		window.location='mural_page.jsp';
		return false;
	</script>

</body>
</html>
	

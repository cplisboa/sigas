
<html>
<body>
<form id="myForm" name="myForm" action="tabela_mensal.html" method="POST"></form>

<%
	HttpSession sessao = request.getSession(true);  
	//sessao.setAttribute("pocoNumber",request.getParameter("pocoNumber"));
	String acess = request.getParameter("acess");	
%>
	<script>
		window.location='<%=acess%>';		
	</script>

</body>
</html>
	

<%@ page  import="java.sql.*" %>
<%@ page  import="java.io.*" %>
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<%
		Class.forName("org.firebirdsql.jdbc.FBDriver");    
		String url = "jdbc:firebirdsql:localhost/3050:c:/juper/old_site/SIGAS.GDB";
		String pocoManut = request.getParameter("pocoManut");	
		String acaoManut = request.getParameter("acaoManut");

		Connection connection = DriverManager.getConnection (url, "sysdba", "masterkey");
					
		try{
			String sql = "update poco_gerais set manutencao = " + acaoManut + " where utm_norte = '" + pocoManut + "'"; 
			//out.println(sql + " <br>");
			Statement smtp = connection.createStatement();
			smtp.executeUpdate(sql);
			smtp.close();
		} catch (SQLException sqlex){ // Erro ao executar a Query no banco
			%>Erro setando manutencao. <%=sqlex.getMessage()%><%
		}
	%>
		<script>
			window.location.href = 'mural.jsp';
		</script>
</body>
</html>
	

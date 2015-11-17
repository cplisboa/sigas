<%@ page  import="java.sql.*" %>

<html>
<body>
<form id="myForm" name="myForm" action="tabela_mensal.html" method="POST"></form>
<%
try {	
	Connection connection = null;
	Statement stmt = null;
	ResultSet rs = null;
	
    Class.forName("org.firebirdsql.jdbc.FBDriver");    
    String url = "jdbc:firebirdsql:localhost/3050:c:/juper/old_site/SIGAS.GDB";
    connection = DriverManager.getConnection (url, "sysdba", "masterkey");
	           
	try{ // Gera a Query para o banco
		String code = request.getParameter("code");
		if (code == null) {
			code = (String) request.getSession().getAttribute("code");
		}
		
		stmt = connection.createStatement();
		String query = "select * from grandezas where code = '"+code+"' order by data desc";
        rs = stmt.executeQuery(query);

        %>
        <table  style="margin-left: 40px;" border=1>
        <tr>
            <th>Data</th>
            <th>Volume</th>
            <th>Corrente</th>			
			<th>Volume</th>			
			<th>Hidrometro</th>			
			<th>CESP</th>			
        </tr>
        <% while(rs.next()) {
        	String data = rs.getString("data");
            float vazao = rs.getFloat("vazao");
			float corrente = rs.getFloat("corrente");
			float volume = rs.getFloat("volume");
			float hidrometro = rs.getFloat("hidrometro");
			float cesp = rs.getFloat("cesp"); %>
			<tr>
				<td><%=data%></td>
				<td><%=vazao%></td>
				<td><%=corrente%></td>
				<td><%=volume%></td>
				<td><%=hidrometro%></td>
				<td><%=cesp%></td>
			</tr>
		<% } %>
		</table>
		<% rs.close();
        connection.close();
	} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
		%>Erro executando busca na base. <%=sqlex.getMessage()%><% 
	}
} catch (Exception e){ // Erro ao executar a Query no banco 
	%>Erro conectando a base. <% 

}%>
</form>
</body>
</html>
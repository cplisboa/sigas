<%@ page  import="java.sql.*" %>
<%@ page  import="java.util.StringTokenizer" %>

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
		
		HttpSession sessao = request.getSession(true);  
		String poco = (String) sessao.getAttribute("pocoNumber");
		poco = "Poço: "+poco;
		
        %>
        <table  style="margin-left: 40px;" border=1>
		<tr>
			<th colspan=4><%=poco%>
		</tr>
        <tr>
            <th>Data</th>
			<th>Hora</th>
            <th>Volume</th>
            <th>Corrente</th>			
        </tr>
        <% while(rs.next()) {
        	String data = rs.getString("data");
			
			StringTokenizer strData = new StringTokenizer(data, " ");	
			String dataPrint = strData.nextToken();
			String horaPrint = strData.nextToken();

            float vazao = rs.getFloat("vazao");
			float corrente = rs.getFloat("corrente"); %>
			<tr>
				<td><%=dataPrint%></td>
				<td><%=horaPrint%></td>
				<td><center><%=vazao%><center></td>
				<td><center><%=corrente%><center></td>
			</tr>
		<% } %>
		</table>
		<% rs.close();
        connection.close();
	} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
		%>Erro executando inserção na base. <%=sqlex.getMessage()%><% 
	}
} catch (Exception e){ // Erro ao executar a Query no banco 
	%>Erro conectando a base. <% 

}%>
</form>
</body>
</html>
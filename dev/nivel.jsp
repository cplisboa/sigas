<%@ page  import="java.sql.*" %>
<%@ page  import="java.util.StringTokenizer" %>


<html>
<body>
<form id="myForm" name="myForm" action="nivel.jsp" method="GET">
Data Inicial: <input type="text" id="dataIni" name="dataIni">  Data Final: <input type="text" id="dataFim" name="dataFim">
<input type="submit">

<%
try {	
	Connection connection = null;
	Statement stmt = null;
	ResultSet rs = null;
	
    Class.forName("org.firebirdsql.jdbc.FBDriver");    
    String url = "jdbc:firebirdsql:localhost/3050:c:/juper/old_site/SIGAS.GDB";
    connection = DriverManager.getConnection (url, "sysdba", "masterkey");
	
	if (request.getParameter("dataIni")!=null) {
		String dataIni = request.getParameter("dataIni");
		String dataFim = request.getParameter("dataFim");
		StringTokenizer stIni = new StringTokenizer(dataIni, "/");
		StringTokenizer stFim = new StringTokenizer(dataFim, "/");
		String dia = stIni.nextToken().trim();
		String mes = stIni.nextToken().trim();
		String ano = stIni.nextToken().trim();
		String formIni = mes+"/"+dia+"/"+ano;
		
		dia = stFim.nextToken().trim();
		mes = stFim.nextToken().trim();
		ano = stFim.nextToken().trim();		
		String formFim = mes+"/"+dia+"/"+ano;
		
		try{ // Gera a Query para o banco
			String code = request.getParameter("code");
			if (code == null) {
				code = (String) request.getSession().getAttribute("code");
			}
			
			stmt = connection.createStatement();
			
			String query = "select distinct (data), nivel from sigas_pocos where codigo_str = '"+code+"'"
				+ " and data > '"+formIni+"' and data < '"+formFim+"'"
				+ " order by data desc";
				
			%><br><br> Dados Recuperados entre os dias <%=dataIni%> e <%=dataFim%> <br><br> <%	
			
			rs = stmt.executeQuery(query);
			
			HttpSession sessao = request.getSession(true);  
			String poco = (String) sessao.getAttribute("pocoNumber");
			poco = "Poço: "+poco;    %>
			
			<table  style="margin-left: 40px;" border=1>
			<tr>
				<th colspan=2><%=poco%>
			</tr>
			<tr>
				<th>Data</th>
				<th>Nivel</th>
			</tr>
			<% while(rs.next()) {
				String data = rs.getString("data");
				float nivel = rs.getFloat("nivel");
			%>
				<tr>
					<td><%=data%></td>
					<td><center><%=nivel%><center></td>
				</tr>
			<% } %>
			</table>
			<% rs.close();
			connection.close();
		} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
			%>Erro executando inserção na base. <%=sqlex.getMessage()%><% 
		}
	} else {%>
		<h2> Entre com data-hora inicial e data-hora final para a pesquisa, no formato dd/mm/yyyy hh:mm:ss</h2>
	<%}
} catch (Exception e){ // Erro ao executar a Query no banco 
	%>Erro conectando a base. <% 

}%>
</form>
</body>
</html>

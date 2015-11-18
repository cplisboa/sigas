<%@ page  import="java.sql.*" %>
<%@ page  import="java.util.StringTokenizer" %>
<html>
<body>
<form id="myForm" name="myForm" action="testes.jsp" method="GET">
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
			String query = "select distinct (data), nivel, vazao, corrente, volume, hidrometro, cesp, pluviometria from grandezas where code = '"+code+"'"
				+ " and data > '"+formIni+"' and data < '"+formFim+"'"
				+ " order by data desc";
			
			%><br><br> Dados Recuperados entre os dias <%=dataIni%> e <%=dataFim%> <br><br> <%	
			
			rs = stmt.executeQuery(query);

			%>
			<table  style="margin-left: 40px;" border=1>
			<tr>
				<th>Data</th>
				<th>Nivel</th>
				<th>Vazao</th>
				<th>Corrente</th>			
				<th>Volume</th>			
				<th>Hidrometro</th>			
				<th>CESP</th>			
				<th>Pluviometria</th>			
			</tr>
			<% while(rs.next()) {
				String data = rs.getString("data");
				float nivel = rs.getFloat("nivel");
				float vazao = rs.getFloat("vazao");
				float corrente = rs.getFloat("corrente");
				float volume = rs.getFloat("volume");
				float hidrometro = rs.getFloat("hidrometro");
				float cesp = rs.getFloat("cesp"); 
				float pluviometria = rs.getFloat("pluviometria"); 
				
				%>
				<tr>
					<td><%=data%></td>
					<td><%=nivel%></td>
					<td><%=vazao%></td>
					<td><%=corrente%></td>
					<td><%=volume%></td>
					<td><%=hidrometro%></td>
					<td><%=cesp%></td>
					<td><%=pluviometria%></td>
					
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
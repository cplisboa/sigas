<%@ page  import="java.sql.*" %>

<html>
<body>
<form id="myForm" name="myForm" action="tabela_mensal.html" method="POST"></form>
<%
try {	
	Connection connection = null;
	Statement stmt = null;
	ResultSet rs = null;
	String tryUser = request.getParameter("tuser");
	String query = "select u.id_empresa, u.nome, u.senha, e.empresa from usuario u inner join empresa e on (e.empresa_id = u.id_empresa) where u.usuario='"+tryUser+"'";
	
    Class.forName("org.firebirdsql.jdbc.FBDriver");    
    String url = "jdbc:firebirdsql:localhost/3050:c:/juper/old_site/SIGAS.GDB";
    connection = DriverManager.getConnection (url, "sysdba", "masterkey");
	           
	try{ // Gera a Query para o banco
		
		stmt = connection.createStatement(); 
        rs = stmt.executeQuery(query);
        if(rs.next()) {
        	if (rs.getString("senha").equals(request.getParameter("tpasswd"))) {
            	String empresa = rs.getString("Empresa");
            	
        		HttpSession sessao = request.getSession(true);  
        		sessao.setAttribute("tuser",tryUser);
        		sessao.setAttribute("tnome",rs.getString("nome"));
				sessao.setAttribute("empresa",empresa);
				sessao.setAttribute("id_empresa",rs.getInt("id_empresa"));				
				sessao.setAttribute("code",null);

            	 %>
            	<input type="text" hidden="true" name="tuser" value="<%=request.getParameter("tuser")%>"/>            			
            	<script> document.getElementById('myForm').submit(); </script>            			
            	<%        		
        	} else {
        		%> Senha incorreta <%        	
        	}        	        			
        } else {
        	%> Usuario <%=request.getParameter("tuser")%> não encontrado <%
        }
        
	} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
		%>Erro fazendo select na base. <%=sqlex.getMessage()%><% 
	}
} catch (Exception e){ // Erro ao executar a Query no banco 
	%>Erro conectando a base. <% 
}
%>
</form>
</body>
</html>
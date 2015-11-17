<%@ page  import="java.sql.*" %>
<%@ page  import="sigas.*" %>	


<html>
<body>
<form id="myForm" name="myForm" action="tabela_mensal.html" method="POST"></form>
<%
try {	
	Connection connection = null;
	Statement stmt = null;
	ResultSet rs = null;
	String tryUser = request.getParameter("tuser");
	
	String query = "select u.id_empresa, u.nome, u.senha, u.acesso, e.empresa from usuario u inner join empresa e on (e.empresa_id = u.id_empresa) where u.usuario='"+tryUser+"'";
    Class.forName("org.firebirdsql.jdbc.FBDriver");    
    String url = "jdbc:firebirdsql:localhost/3050:c:/juper/old_site/SIGAS.GDB";
    connection = DriverManager.getConnection (url, "sysdba", "masterkey");
	
	boolean superuser = false;
	if((request.getParameter("superuser")!=null) && (request.getParameter("superuser").equals("true"))){
		superuser = true;
	}
	           
	try{ // Gera a Query para o banco
		stmt = connection.createStatement(); 
        rs = stmt.executeQuery(query);
        if(superuser || rs.next()) {
        	if (superuser ||(rs.getString("senha").equals(request.getParameter("tpasswd")))) {
        		HttpSession sessao = request.getSession(true);  				
            	
				if(superuser) {
					int id = Integer.parseInt(request.getParameter("empresa"));
					sessao.setAttribute("id_empresa",id);
					//sessao.setAttribute("id_empresa",rs.getInt("id_empresa"));  %>
					<script> document.getElementById('myForm').submit(); </script>    
					<%
				} else {
					String empresa = rs.getString("Empresa");
					sessao.setAttribute("tuser",tryUser);
					sessao.setAttribute("tnome",rs.getString("nome"));
					sessao.setAttribute("acesso",rs.getString("acesso"));
					sessao.setAttribute("empresa",empresa);
					sessao.setAttribute("id_empresa",rs.getInt("id_empresa"));				
					sessao.setAttribute("code",null); 				
				}%>
            	<input type="text" hidden="true" name="tuser" value="<%=request.getParameter("tuser")%>"/>            			
				<%
				// USUARIO CORRETO, SE FOR USUARIO SIGAS, DAR POSSIBILIDADE DE ESCOLHER QUAL EMPRESA QUER VERIFICAR
				if (tryUser.equals("SIGAS")) {
					DataRequester dr = new DataRequester("jdbc:firebirdsql:localhost/3050:C:/juper/old_site/SIGAS.GDB");
					Empresa[] emp = dr.getEmpresas(); %>
					
					<h2> Você conectou com o usuário especial SIGAS. Favor selecione a empresa cadastrada que deseja verificar </h2><br>
					<form id="form2" name="form2" action="processa_usuario2.jsp" method="POST">				
					<input type="text" hidden="true" id="superuser" name="superuser" value="true" />	
					<select name="empresa" id="empresa" tabindex="1"">
					<% for(int i=0; i<emp.length; i++) { %>
						<option text="<%=emp[i].getNome()%>" value="<%=emp[i].getId()%>"><%=emp[i].getNome()%></option>	
					<% } %>
					</select>
					
					<input type="submit" value="Acessar">
					</form>
				<% } else { %> 
					<script> document.getElementById('myForm').submit(); </script>            			
            	<% }       		
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
<%@ page  import="java.sql.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="sigas.*" %>

<html>
<head>
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/bootstrap-theme.css" rel="stylesheet" />	
	<script>
		function apaga(id, str) {
			if (confirm("Você tem certeza que deseja remover o sistema "+str+"?")) {
				document.getElementById("sysToEdit").value = str;
				document.getElementById("id_sistema").value = id;
				document.getElementById("action").value = "3";			
				document.forms["form2"].submit();		
			}
		}	

		function rename(id, str) {
			var editName=prompt("Entre com o novo nome do Sistema",str);

			if (editName!=null) {
				document.getElementById("sysToEdit").value = editName;
				document.getElementById("id_sistema").value = id;
				document.getElementById("action").value = "2";				
				document.forms["form2"].submit();
			}		
		}
</script>
</head>
<body bgcolor="" style="margin-left: 15px; margin-top: 0px; margin-right: 0px;margin-bottom: 0px;">		

	<br>	
	<%	
		HttpSession sessao = request.getSession(true);  
		String empresa = (String) sessao.getAttribute("empresa");
		int id_empresa = (Integer) sessao.getAttribute("id_empresa");
		String sysName = request.getParameter("sysToEdit");
		String id_sistema = request.getParameter("id_sistema");
		Class.forName("org.firebirdsql.jdbc.FBDriver");    
		String url = "jdbc:firebirdsql:localhost/3050:c:/juper/old_site/SIGAS.GDB";

		if((request.getParameter("action")!=null) && (request.getParameter("action").equals("3"))) {
			// Apagar sistema que vem no campo sysToEdit			
			Connection connection = DriverManager.getConnection (url, "sysdba", "masterkey");
				
			try{ // sql com delete 
				String sql = "delete from sistema where nome='"+sysName+"' and sistema_id="+id_sistema; 
				Statement smtp = connection.createStatement(); 
				smtp.executeUpdate(sql);			
				out.println("Remoção do sistema "+sysName+" ocorrida com sucesso!<br><br>");
				smtp.close(); %> 
				<script>
					window.open("menu.jsp","menu");				
				</script>
			<%
			} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
				%>Erro executando remoção de sistema na base de dados. <%=sqlex.getMessage()%><% 
			}					
			
		} else if ((request.getParameter("action")!=null) && (request.getParameter("action").equals("2"))) {
			// Edita o nome do sistema
			Connection connection = DriverManager.getConnection (url, "sysdba", "masterkey");

			try{ // sql update 
				String sql = "update sistema set nome='"+sysName+"' where sistema_id="+id_sistema; 
				Statement smtp = connection.createStatement(); 
				smtp.executeUpdate(sql);			
				out.println("Alteração do nome do sistema para "+sysName+" ocorrida com sucesso!<br><br>");
				smtp.close(); %> 
				<script>
					window.open("menu.jsp","menu");				
				</script>
			<%				
			} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
				%>Erro executando remoção de sistema na base de dados. <%=sqlex.getMessage()%><% 
			}					
		}
		
		DataRequester dr = new DataRequester("jdbc:firebirdsql:localhost/3050:C:/juper/old_site/SIGAS.GDB");		
		Sistema[] sysList = dr.getSistemas(id_empresa);
		Empresa emp = new Empresa(id_empresa);
		emp.setEmpresa(id_empresa);		
		if ((sysList.length + 1) > emp.getNum_sistemas()) { %>
			Empresa <%=empresa%> já possui <%=sysList.length%> sistemas cadastrados. O contrato atual prevê um limite de <%=emp.getNum_sistemas()%> sistemas.<br>
			Contate a Juper para aumento do número de sistemas possíveis no SIGAS.<br><br>
		<% } else { %>
			
			<% String sistema = request.getParameter("sistema");
			if (sistema != null) {
				//Cadastro já foi feito, realizar INSERT
				String nome = request.getParameter("sistema");    	
				String insertString = "insert into SISTEMA (empresa_id, sistema_id, nome) values ("+id_empresa+",GEN_ID(SISTEMA_ID, 1), '"+nome+"')"; 
				Connection connection = null;
				Statement smtp = null;
				try {	
					connection = DriverManager.getConnection (url, "sysdba", "masterkey");						   
					try{
						smtp = connection.createStatement(); 
						smtp.executeUpdate(insertString);			
						smtp.close();   %>
						<script> 
							alert("Sistema <%=nome%> cadastrado com sucesso!");
							window.open("menu.jsp","menu");	
						</script>
						
						<%						
					} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
						%>Erro executando inserção na base. <%=sqlex.getMessage()%><% 
					}
				} catch (Exception e){ // Erro ao executar a Query no banco 
					%>Erro conectando a base. <% 		
				}
			} else {
				// Apresentar página de cadastro, ele ainda não foi feito  %>
				
				<font style="font-size: 16px; text-align: center; color: #101010; font-family: Arial; margin-left: 10px;">Cadastro de Sistemas</font><br>
				<br>  
				<form action="sistema.jsp" name=myForm method="POST">
					<table border=1  cellpadding="0" cellspacing="0" style="margin-left: 10px;">
					<tr>
						<td style="width: 150px; background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold;font-family: Arial;">Empresa: </td> 
						<td><input size="20" type="text" name="empresa" value="<%=empresa%>" disabled></td>			
					</tr>	
					<tr>
						<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Nome do Sistema:</td> 
						<td><input size="20" type="text" name="sistema" value=""></td>			
					</tr>	
					</table>
					<br>
					<input style="margin-left: 110px;" type="submit" value="Cadastrar Sistema">
					<br><br>
				</form>		
			<% } %>
		<% } %>

		<form name="form2" id="form2" method="post"> 
			<input type="text" hidden="true" id="action" name="action" value="1" />	
			<input type="text" hidden="true" id="id_sistema" name="id_sistema" value="" />	
			<input type="text" hidden="true" id="sysToEdit" name="sysToEdit" value="" />	
			<%
			//Database db = new Database();					
			if ((sysList.length + 1) > emp.getNum_sistemas()) { %>
				<table class="table table-striped" style="margin-left: 20px; height: 31px; width: 400px;" cellpadding="0" cellspacing="0">
				<tbody>
				  <tr>
					<th> SISTEMA </th>
					<th> </th>
					<th> </th>
				  </tr>			
				<% for(int i=0; i<sysList.length; i++) { %>
					<tr>
						<td style="height: 20px; width: 150px;"> <%=sysList[i].getNome()%> </td>				
						<td style="height: 21px; width: 60px; text-align:center;">
							<input name="updateBtn" id="updateBtn" alt="Renomear" value="Editar" onclick="rename('<%=sysList[i].getId_sistema()%>', '<%=sysList[i].getNome()%>');" type="button">
						</td>						
						<td style="height: 21px; width: 60px; text-align:center;">
							<input name="removeBtn" id="removeBtn" alt="Remover" value="Remover" onclick="apaga('<%=sysList[i].getId_sistema()%>', '<%=sysList[i].getNome()%>');" type="button">
						</td>
					</tr>
				<% } 
			}%>
			</tbody>
			</table>	
		</form>
		
	</body>

</html>
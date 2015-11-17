<%@ page  import="java.sql.*" %>
<%@ page  import="java.io.*" %>

<html>
<head>
<script>

</script>
</head>

<body bgcolor="" style="margin-left: 0px; margin-top: 0px; margin-right: 0px;margin-bottom: 0px;">		
	<br>
	<%
	int generator=0;
    String empresa = request.getParameter("empresa");
    if(empresa != null) {
		String user = request.getParameter("tuser");
		String senha = request.getParameter("tsenha");
		String contrato = request.getParameter("contrato");    	
		String numContrato = request.getParameter("numContrato");    	
		String sistemas = request.getParameter("sistemas");
		String pocos = request.getParameter("pocos");
		String usuarios = request.getParameter("usuarios");
		String modulos = request.getParameter("modulos");
				
		//insert into EMPRESA (empresa_id, empresa, contrato, num_sistema, modulos) values (GEN_ID(EMPRESA_ID, 1), 'JUPER', '31/12/2032', 2, 2);	
		Connection connection = null;
		Statement smtp = null;
		try {		
			Class.forName("org.firebirdsql.jdbc.FBDriver");    
			String url = "jdbc:firebirdsql:localhost/3050:c:/juper/old_site/SIGAS.GDB";
			connection = DriverManager.getConnection (url, "sysdba", "masterkey");
		} catch (Exception ex){
			%> Erro conectando a base. <%=ex.getMessage()%> <%			
		}
		
		try {			
			//Recuperando valor do generator de empresa para usar em EMPRESA e USUARIO				   
			smtp = connection.createStatement();
			ResultSet rs = smtp.executeQuery("select gen_id(empresa_id, 1) from rdb$database");
			rs.next();
			generator = Integer.parseInt(rs.getString("GEN_ID"));
			rs.close();
			smtp.close();
		} catch (Exception et) {
			%> Erro recuperando generator. <%=et.getMessage()%> <%						
		}
						   
		try { // Inserindo em empresa
			String insertStr = "insert into EMPRESA (empresa_id, empresa, contrato, num_sistema, modulos, num_pocos, num_usuarios, numContrato) values ("+ generator +", '" + empresa + "', '"+contrato + "'," + sistemas +","+modulos + "," + pocos + "," + usuarios+", '"+numContrato + "')";
	
			smtp = connection.createStatement(); 
			smtp.executeUpdate(insertStr);			
			smtp.close(); 
		} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
			%> Erro executando inserção de empresa na base. <%=sqlex.getMessage()%> <% 
		}
		
		try { // Inserindo em user
			String insertUser = "insert into usuario (nome, usuario, senha, empresa, telefone, acesso, id_empresa) values ('USUARIO MASTER','"+user+"','"+senha+"','"+empresa+"','0','Diretor',"+generator+")"; 
			smtp = connection.createStatement(); 
			smtp.executeUpdate(insertUser);			
			smtp.close(); 
		} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
			%> Erro executando inserção de usuario master na base. <%=sqlex.getMessage()%> <% 
		}

		%>
			<script>
				alert("Empresa <%=empresa%> e usuário master <%=user%> cadastrados com sucesso!");
				window.location="view_clientes.jsp";				
			</script>
		<%
    }
	    	    
	%>
	<br>
	<font style="font-size: 16px; text-align: center; color: #101010; font-family: Arial; margin-left: 10px;">Cadastro de Clientes (Empresas)</font><br>
	<br>  
	<form action="cliente_interna.jsp" name=myForm method="POST">
		<table border=1  cellpadding="0" cellspacing="0" style="margin-left: 10px;">
		<tr>
			<td style="width: 150px; background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold;font-family: Arial;">Empresa: </td> 
			<td><input size="36" type="text" name="empresa" value=""></td>			
		</tr>	
		<tr>
			<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Vigência do Contrato:</td> 
			<td><input size="36" type="text" name="contrato" value=""></td>			
		</tr>	
		<tr>
			<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Número do Contrato:</td>
 			<td><input size="36" type="text" name="numContrato" value=""></td>			
		</tr>			
		<tr>
			<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Numero de Sistemas:</td> 
			<td><input size="36" type="text" name="sistemas" value=""></td>			
		</tr>	
		<tr>
			<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Numero de Poços:</td> 
			<td><input size="36" type="text" name="pocos" value=""></td>			
		</tr>			
		<tr>
			<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Numero de Usuários:</td> 
			<td><input size="36" type="text" name="usuarios" value=""></td>			
		</tr>					
		<tr>
			<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Usuário Master:</td> 
			<td><input size="36" type="text" name="tuser" value=""></td>			
		</tr>	
		<tr>
			<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Senha Master:</td> 
			<td><input size="36" type="password" name="tsenha" value=""></td>			
		</tr>			
		<tr>
			<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-family: Arial; font-weight: bold; ">Modulos Contratados:</td> 
			<td>
			<select multiple name="modulos">
			  <option value="1">SIM - Captação dos dados</option>
			  <option value="2">SOP - Sistema Operacional</option>
			</select>
			</td>
		</tr>
		<tr>
		</tr>	
		</table>
		<br><br>
		<input style="margin-left: 10px;" type="submit" value="Cadastrar">
	</form>	
	
	
</body>

</html>
<%@ page  import="java.sql.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="sigas.*" %>
<html style="margin-left: 15px;">
<head>
<script>

function selectEmp() {
	cont = document.getElementById("empresa").selectedIndex;
	document.getElementById("countEmpresa").value = cont;
	document.forms["empForm"].submit();	
	
}

function funcao(proximo)  
{  
	cont = document.getElementById("countEmpresa").value;
	total = document.getElementById("totalEmpresas").value;
	var ok = 'true';
	if (proximo == 'true') {	
		cont++;
		if(cont >= total) {
			alert('Não é possível passar para o próximo registro. Essa é a última empresa cadastrada');
			ok = 'false'
		}
	} else {
		cont--;
		if(cont < 0) {
			alert('Essa já é a primeira empresa cadastrada');
			ok = 'false';
		}
		
	}	
	if (ok == "true") {
		document.getElementById("countEmpresa").value = cont;
		document.forms["empForm"].submit();
	}
}

function insert()  
{  
	var answer = confirm ("Você deseja cadastrar um novo cliente?");
	if (answer) {
		location.href = 'cliente_interna.jsp';
	}
}

function excluir()  
{  
	var empresa = document.getElementById("empresa").value
	var answer = confirm ("Você tem certeza que deseja exceluir o cliente "+empresa+" ?");	
	if (answer) {
		alert ("Ok. Cliente excluído.")
		cont=0;
		document.getElementById("excluirHidden").value = "1";
		document.getElementById("countEmpresa").value = cont;		
		document.forms["empForm"].submit();		
	}
}

function update()  
{  
	var empresa = document.getElementById("empresa").value;
	modulos = document.getElementById("modulos");
	console.log("Modulo 1: "+modulos[0].selected);
	console.log("Modulo 2: "+modulos[1].selected);
	if ((!modulos[0].selected) && (!modulos[1].selected))
		alert("Você precisa selecionar pelo menos 1 modulo");
	else {
		var answer = confirm ("Você tem certeza que deseja atualizar os dados do cliente "+empresa+" ?");
		if (answer) {
			document.getElementById("excluirHidden").value = "2";
			document.getElementById("countEmpresa").value = cont;		
			document.forms["empForm"].submit();		
		}
	}
}


</script>
</head>

<body bgcolor="" style="margin-left: 0px; margin-top: 0px; margin-right: 0px;margin-bottom: 0px;">		
	<br>
	<%
		/* Na variável de controle excluirHidden
		   Excluir - 1
		   Update - 2 */
		//Processo de exclusão de registro, caso isso tenha sido solicitado
		String exclusao = request.getParameter("excluirHidden");		
		if ((exclusao != null) && (exclusao.equals("1"))){			
			boolean ok = Empresa.removeEmpresa(request.getParameter("empresa"));
			if(ok) {
				%> Empresa <%=request.getParameter("empresa")%> excluída com sucesso.<br> <%
			} else {
				%> Houve um erro ao excluir Empresa <%=request.getParameter("empresa")%>. Contate o administrador<br> <%			
			}
		} else if ((exclusao != null) && (exclusao.equals("2"))){			
			String empresaName = request.getParameter("empresa");
			%> Atualizando empresa <%=empresaName%>.<br> <%
			String contrato = request.getParameter("contrato");
			String numContrato = request.getParameter("numContrato");
			String sistemas = request.getParameter("sistemas");
			String pocos = request.getParameter("pocos");
			String usuarios = request.getParameter("usuarios");
			String master = request.getParameter("tuser");
			String senha = request.getParameter("tsenha");
			String[] modulos = request.getParameterValues("modulos");
			boolean ok = Empresa.updateEmpresa(empresaName, numContrato, contrato, sistemas, pocos, usuarios, master, senha, modulos);
			if(ok) {
				%> Empresa <%=request.getParameter("empresa")%> atualizada com sucesso.<br> <%
			} else {
				%> Houve um erro ao atualizar Empresa <%=request.getParameter("empresa")%>. Contate o administrador<br> <%			
			}
		}
	
		int countEmpresa = 0;  
		String countStr = request.getParameter("countEmpresa");		
		if (countStr != null) {			
			countEmpresa = Integer.parseInt(countStr);
		} 		
				
		DataRequester dr = new DataRequester("jdbc:firebirdsql:localhost/3050:C:/juper/old_site/SIGAS.GDB");
		Empresa[] emp = dr.getEmpresas();
		String senha = "";
		if (emp!=null) { %>
			<h2> Temos um total de <%=emp.length%> Empresas </h2> 
			<br>
			<font style="font-size: 16px; text-align: center; color: #101010; font-family: Arial; margin-left: 10px;">Empresa #<%=(countEmpresa+1)%></font><br>
			<br>			
			<form action="view_clientes.jsp" id="empForm" name="empForm" method="POST">
				<table border=1  cellpadding="0" cellspacing="0" style="margin-left: 10px;">
				<tr>
					<td style="width: 150px; background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold;font-family: Arial;">Empresa: </td> 
					<td>
					<select style="width: 250px;" autofocus size="1" id="empresa" name="empresa" onchange="selectEmp()">
					  <% for (int i=0; i<emp.length; i++) { %>
						 <option 
						 <% if (i==countEmpresa) { %>
								selected 
						 <% } %>
						 value="<%=emp[i].getNome()%>"><%=emp[i].getNome()%></option>
					  <%} %>
					</select>															
				</tr>	
				
				<%
					//Recupera senha do usuário master da empresa selecionada
					Class.forName("org.firebirdsql.jdbc.FBDriver");    
					String url = "jdbc:firebirdsql:localhost/3050:c:/juper/old_site/SIGAS.GDB";
					Connection connection = DriverManager.getConnection (url, "sysdba", "masterkey");
						
					try{ // Gera a Query para o banco 
						String sql = "select senha from usuario where usuario = '"+ emp[countEmpresa].getMasterUser() +"'"; 
						//out.println(insertString+"<br>");	
						Statement smtp = connection.createStatement(); 
						ResultSet rs = smtp.executeQuery(sql);
						if(rs.next()) {
						    senha = rs.getString("senha");
						}
						smtp.close(); 
					} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
						%>Erro executando sql de leitura da senha. <%=sqlex.getMessage()%><% 
					}					
				%>
				
				<tr>
					<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Vigência do Contrato:</td> 
					<td><input size="36" type="text" name="contrato" value="<%=emp[countEmpresa].getContrato()%>"></td>			
				</tr>	
				<tr>
					<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Número do Contrato:</td> 
					<td><input size="36" type="text" name="numContrato" value="<%=emp[countEmpresa].getNumContrato()%>"></td>			
				</tr>					
				<tr>
					<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Numero de Sistemas:</td> 
					<td><input size="36" type="text" name="sistemas" value="<%=emp[countEmpresa].getNum_sistemas()%>"></td>			
				</tr>	
				<tr>
					<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Numero de Poços:</td> 
					<td><input size="36" type="text" name="pocos" value="<%=emp[countEmpresa].getNum_pocos()%>"></td>			
				</tr>			
				<tr>
					<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Numero de Usuários:</td> 
					<td><input size="36" type="text" name="usuarios" value="<%=emp[countEmpresa].getNum_usuarios()%>"></td>			
				</tr>					
				<tr>
					<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Usuário Master:</td> 
					<td><input size="36" type="text" name="tuser" value="<%=emp[countEmpresa].getMasterUser()%>"></td>			
				</tr>	
				<tr>
					<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Senha Master:</td> 
					<td><input size="36" type="password" name="tsenha" value="<%=senha%>"></td>			
				</tr>			
				<tr>
					<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-family: Arial; font-weight: bold; ">Modulos Contratados:</td> 
					<td>
					<select multiple id="modulos" name="modulos">
					  <option value="1" <%=emp[countEmpresa].isModuleEnable("1")%> >SIM - Captação dos dados</option>
					  <option value="2" <%=emp[countEmpresa].isModuleEnable("2")%> >SOP - Sistema Operacional</option>
					</select>
					</td>
				</tr>
				<tr>
				</tr>	
				</table>
				<input type="text" hidden="true" id="countEmpresa" name="countEmpresa" value="<%=countEmpresa%>" />	
				<input type="text" hidden="true" id="totalEmpresas" name="totalEmpresas" value="<%=emp.length%>" />					
				<input type="text" hidden="true" id="excluirHidden" name="excluirHidden" value="false" />					
				
				&nbsp&nbsp&nbsp&nbsp
				<a href="#" onclick="funcao('false')"> Anterior </a> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<a href="#" onclick="funcao('true')"> Próximo </a>			 		 				
				<br><br>
				
				&nbsp&nbsp&nbsp&nbsp
				<input name="excluirBtn" id="excluirBtn" alt="Excluir" title="Excluir" onclick="excluir()" value="" type="image" width=32 height=32;" src="btn_excluir.png">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<input name="updateBtn" id="updateBtn" onclick="update()" value="" type="image" width=32 height=32;" src="btn_update.png">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<input name="insertBtn" id="insertBtn" onclick="insert(); return false;" value="" type="image" width=54 height=59;" src="novo_cliente.jpg">		 
			</form>				
			 
		<%} %>	
</body>
</html>
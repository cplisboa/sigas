<%@ page  import="java.sql.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="sigas.*" %>


<html>
<head>  
	<script>
	function edit(str) {
		if (str=="SIGAS") {
			alert("O usu�rio SIGAS n�o pode ser editado.");
			return;
		} 
		document.getElementById("userToEdit").value = str;
		document.getElementById("action").value = "2";
		document.forms["myForm"].submit();		
	}

	function apaga(str) {
		if (str=="SIGAS") {
			alert("O usu�rio SIGAS n�o pode ser removido.");
			return;
		} 
		
		if (confirm("Voc� tem certeza que deseja remover o usu�rio "+str+"?")) {
			document.getElementById("userToEdit").value = str;
			document.getElementById("action").value = "3";			
			document.forms["myForm"].submit();		
		}
	}	
	
	function valida() {		
		var nome = myForm.tnome.value;
		var user = myForm.tuser.value;
		var senha = myForm.tsenha.value;
		var telefone = myForm.ttelefone;
		if (nome == "") {
			alert('Preencha o campo com nome completo do usu�rio'); 
			myForm.tnome.focus(); 
			return false;
		}
		if (user == "") {
			alert('Preencha o campo com o nome do usu�rio no sistema'); 
			myForm.tuser.focus(); 
			return false;
		}
		if (senha == "") {
			alert('Preencha o campo a senha do usu�rio'); 
			myForm.tsenha.focus(); 
			return false;
		}
		if (telefone == "") {
			alert('Preencha o campo com o telefone do usu�rio'); 
			myForm.ttelefone.focus(); 
			return false;
		}		
		document.getElementById("botao").value = document.getElementById("botao").value;;
		document.forms["myForm"].submit();				
	}
	</script>
</head>

<body bgcolor="" style="margin-left: 0px; margin-top: 0px; margin-right: 0px;margin-bottom: 0px;">		
	<br>
	
		<%
		/* Na vari�vel de controle "action"
		   Inserir - 1
		   Atualizar - 2 
		   Remover - 3 
		   */
		Connection connection = null;
		Statement smtp = null;		  
		String action = request.getParameter("action");
		boolean update=false;
		boolean remove=false;
		boolean superou=false;
		String nome="";
		String usuario="";
		String passwd="";
		String telefone="";
		String acesso="";
		
		if ((action != null) && (action.equals("2"))){			
			update=true;
		} else if ((action != null) && (action.equals("3"))){			
			remove=true;
		}
		
		HttpSession sessao = request.getSession(true);  
		int id_empresa = (Integer) sessao.getAttribute("id_empresa");
		String empresa = (String) sessao.getAttribute("empresa");
		String userToEdit = request.getParameter("userToEdit");
		String btnAtualizar = request.getParameter("btnType");
		//out.println("BtnAtualizar: "+btnAtualizar+"<br>");

		//Recupera lista de usu�rios da empresa para disponibilizar para Edit e para preenhcer dados com usu�rio correto em caso de edi��o
		User[] list = null;
		Empresa emp = new Empresa(id_empresa);
		emp.setEmpresa(id_empresa);	
		int numUsers = emp.getNum_usuarios();
		
		String tnome = request.getParameter("tnome");
		String tuser = request.getParameter("tuser");
		String tacesso = "";
		if((tnome != null) && (!update) && (!remove)){
			//Fazer apenas o insert (se nao tentaram inserir um diretor)
			tacesso = request.getParameter("tacesso");
			if (tacesso.equals("Diretor")) {
			%>
			   <font style="font-size: 16px; text-align: center; color: #101010; font-family: Arial; margin-left: 10px;">Apenas administradores podem cadastrar um diretor </font><br>    	
			<%			
			} else {				
				String tsenha = request.getParameter("tsenha");
				String tempresa = empresa;
				String ttelefone = request.getParameter("ttelefone");    	
				tacesso = request.getParameter("tacesso");    	
				try {	
			
					Class.forName("org.firebirdsql.jdbc.FBDriver");    
					String url = "jdbc:firebirdsql:localhost/3050:c:/juper/old_site/SIGAS.GDB";
					connection = DriverManager.getConnection (url, "sysdba", "masterkey");
						
					if ((btnAtualizar!=null) && (btnAtualizar.equals("Cadastrar"))) {
						try{ // Gera a Query para o banco 
							String insertString = "insert into usuario values ('"+tnome+"','"+tuser+"','"+tsenha+"','"+tempresa+"','"+ttelefone+"','"+tacesso+"',"+id_empresa+")"; 
							//out.println(insertString+"<br>");	
							smtp = connection.createStatement(); 
							smtp.executeUpdate(insertString);			
							smtp.close(); 
							%>
								<font style="font-size: 16px; text-align: center; color: #101010; font-family: Arial; margin-left: 10px;">Usu�rio <%=tnome%> cadastrado com sucesso! </font><br>    	
							<%
						} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
							%>Erro executando inser��o na base. <%=sqlex.getMessage()%><% 
						}					
					} else {
						//Fazer aqui a atualiza��o, j� temos todos os campos aqui
						try {
							//out.println("Eh atualiza��o, vai s� update<br>");
							String updateStr = "update usuario set nome='"+tnome+"', senha='"+tsenha+"', empresa='"+tempresa+"', telefone='"+ttelefone+"', acesso='"+tacesso+"' where usuario='"+tuser+"'"; 
							smtp = connection.createStatement(); 
							smtp.executeUpdate(updateStr);			
							smtp.close(); 
							%>
								<font style="font-size: 16px; text-align: center; color: #101010; font-family: Arial; margin-left: 10px;">Usu�rio <%=tnome%> atualizado com sucesso! </font><br>    	
							<%							
						} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
							%>Erro executando update de usuario. <%=sqlex.getMessage()%><% 
						}											
					}									
				} catch (Exception e){ // Erro ao executar a Query no banco 
					%>Erro conectando a base. <% 			
				}			
			}
		} else if (update) {

			if ((btnAtualizar!=null) && (btnAtualizar.equals("Atualizar"))) {
				%> Deveria agora estar atualizando... <br> <%
			} else {
				// Preparar Campos para Update e deixar op��o de bot�o update habilitado
				list = User.getUserList(id_empresa);	
				for(int i=0; i<list.length; i++) {
					//Percorre lista para conseguir dados do usu�rio correto
					if(list[i].getUsuario().equals(userToEdit)) {
						nome=list[i].getNome();
						usuario=list[i].getUsuario();
						telefone=list[i].getTelefone();
						passwd=list[i].getSenha();
						acesso=list[i].getAcesso();
						if(acesso==null)
							acesso="Usuario";
					}
				}			
			}
		} else if (remove) {
			Class.forName("org.firebirdsql.jdbc.FBDriver");    
			String url = "jdbc:firebirdsql:localhost/3050:c:/juper/old_site/SIGAS.GDB";
			connection = DriverManager.getConnection (url, "sysdba", "masterkey");
				
			try{ // Gera a Query para o banco 
				String sql = "delete from usuario where usuario='"+userToEdit+"'"; 
				//out.println(insertString+"<br>");	
				smtp = connection.createStatement(); 
				smtp.executeUpdate(sql);			
				smtp.close(); 
				%>
					<font style="font-size: 16px; text-align: center; color: #101010; font-family: Arial; margin-left: 10px;">Usu�rio <%=userToEdit%> removido com sucesso! </font><br>    	
				<%
			} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
				%>Erro executando remo��o de usuario na base. <%=sqlex.getMessage()%><% 
			}					
		
		}
		list = User.getUserList(id_empresa);
		if(list.length >= numUsers) {
			out.println("<br>A empresa "+empresa+" j� possui "+list.length+ " cadastrados de um total de "+numUsers+" usu�rios dispon�veis.<br>");
			out.println("N�o ser� mais poss�vel cadastrar novos usu�rios, apenas atualiz�-los ou delet�-los.<br>");
			superou=true;
		}		
		%>
	<br>
	<table style="margin-left: 20px;">
	<tr><td style="width: 404px; text-align: center;">
		<font style="font-size: 15px; color: #101010; font-family: Arial; font-weight: bold;">CADASTRO DE USU�RIO DA EMPRESA <%=empresa%> </font><br>
	</td></tr>
	<br>  
	<form action="user.jsp" id=myForm name=myForm method="POST">
		<table border=1  cellpadding="0" cellspacing="0" style="margin-left: 20px;">
		<tr>
			<td style="width: 150px; background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold;font-family: Arial;">Nome Completo: </td> 
			<%
			  if ((request.getParameter("userToEdir")!= null) && (!request.getParameter("userToEdir").equals(""))){ %>
			     <td><input size="36" type="text" name="tnome" value="<%=request.getParameter("userToEdit")%>"></td>			
			  <%} else { %>
				 <td><input size="36" type="text" name="tnome" value="<%=nome%>"></td>			
			  <% } %>
		</tr>	
		<tr>
			<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Nome de usu�rio:</td> 
			<td><input size="36" type="text" name="tuser" value="<%=usuario%>"></td>			
		</tr>	
		<tr>
			<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-weight: bold; font-family: Arial;">Senha:</td> 
			<td><input size="36" type="password" name="tsenha" value="<%=passwd%>"></td>			
		</tr>	
		<tr>
			<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-family: Arial; font-weight: bold; ">Telefone:</td> 
			<td><input size="36" type="text" name="ttelefone" value="<%=telefone%>"></td>			
		</tr>	
		<tr>
			<td style="background-image:url('linha02.jpg');font-size: 12px; text-align: left; color: #101010; font-family: Arial; font-weight: bold; ">Acesso:</td> 
			<td>
				<select size="1" name="tacesso">
					<%
					
					if ( (acesso.equals("")) || (acesso.equals("Usuario"))){  %>				
						<option selected value="Usuario">Usu�rio</option>
					<% } else { %>
						<option value="Usuario">Usu�rio</option>
					<% } %>
					
					<% if (acesso.equals("Gerente")){ %>				
						<option selected value="Gerente">Gerente</option>
					<% } else { %>
						<option value="Gerente">Gerente</option>
					<% } %>

					<% if (acesso.equals("Superintendente")){ %>				
						<option selected value="Superintendente">Superintendente</option>
					<% } else { %>
						<option value="Superintendente">Superintendente</option>
					<% } %>
						
					<% if (acesso.equals("Diretor")){ %>				
						<option selected value="Diretor">Diretor</option>
					<% } else { %>
						<option value="Diretor">Diretor</option>						
					<% } %>						
				</select>			
			</td>			
		</tr>			
		</table>
		<br>
		<% if(update){ %>
			<input style="margin-left: 185px;" onclick="valida();" name="botao" id="botao" type="button" value="Atualizar">		
		<% } else { 
			//Verifica se j� n�o superou a quantidade de usu�rios para possibilidade de novos cadastros
			if (!superou) { %>
			<input type="text" hidden="true" name="btnType" id="btnType" value="Cadastrar" />		
			<input style="margin-left: 185px;" onclick="valida();" name="botao" id="botao" type="button" value="Cadastrar">
			<% } 
		} %>					
	<br><br>

	<table style="margin-left: 20px;">
	<tr>
        <td style="width: 404px; text-align: center; height: 20px; font-size: 14px; font-family: Arial;  font-weight: bold;"> USU�RIOS CADASTRADOS DA EMPRESA <%=empresa%> </td>
    </tr>
   </table>
	 
  <input type="text" hidden="true" id="userToEdit" name="userToEdit" value="" />					
  <input type="text" hidden="true" id="action" name="action" value="1" />					
  <table style="margin-left: 20px; height: 31px; width: 400px;" border="1" cellpadding="0" cellspacing="0">
    <tbody>
	  <tr>
		<th> Nome</th>
		<th> Usuario</th>
		<th> </th>
		<th> </th>
	  </tr>
	  <%
		for(int i=0; i<list.length; i++) { %>
			<tr>
				<td style="height: 20px; width: 150px;"> <%=list[i].getNome()%> </td>				
				<td style="height: 20px; width: 80px;"> <%=list[i].getUsuario()%> </td>
				<td style="height: 21px; width: 60px; text-align:center;">
					<input name="editImg" id="editImg" alt="Editar" value="Editar" onclick="edit('<%=list[i].getUsuario()%>')" type="button">
				</td>
				<td style="height: 21px; width: 60px; text-align:center;">
					<input name="removeBtn" id="removeBtn" alt="Remover" value="Remover" onclick="apaga('<%=list[i].getUsuario()%>')" type="button">
				</td>
				
			</tr>
		<% } %>
    </tbody>
  </table>
  	</form>	


	
 
</body>
</html>	
	
	
</body>

</html>
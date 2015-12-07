<%@ page  import="sigas.*" %>

<html>
<head>
	<link href="css/estilos.css" rel="stylesheet" type="text/css" />
	<link href="css/jquery.selectbox.css" type="text/css" rel="stylesheet" />
	<link href="css/jquery.selectbox2.css" type="text/css" rel="stylesheet" />

	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.selectbox-0.2.js"></script>
	
	<script>
		function submeter() {					
			var t = document.getElementById("code");
			var selectedText = t.options[t.selectedIndex].text;
			document.getElementById("pocoName").value = selectedText;		

			document.forms["myForm"].submit();		
		}
		
		function verifyPoco() {
			var text = document.getElementById("code").value;
			var t = document.getElementById("code");
			var selectedText = t.options[t.selectedIndex].text;
			document.getElementById("pocoNumber").value = selectedText;		
			
			if(text==""){
				alert("Selecione Sistema e Poço.");	
				return false;
			}			
			return true;		
		}
		
		function resetTds() {
			/* recebe uma lista com todos os elementos de tag <tr> */
			var lista = document.getElementsByTagName('td');
			for (i=0; i<lista.length; i++){
				lista[i].style.background = 'transparent';
				//lista[i].onmouseout=function(){this.style.background = 'white'}
			}						
		}
		
	</script>
	
</head>
<body bgcolor="#ff0000" style="background-color: rgb(204, 204, 204);">
<%
	int countSistema=-1;
	HttpSession sessao = request.getSession(true);  
	String code = request.getParameter("code");
	String user = (String) sessao.getAttribute("tnome");
	String acesso = (String) sessao.getAttribute("acesso");
	String countString =(String) sessao.getAttribute("countSistema");
	//out.println(countString+"<br>");
	
	if(countString!=null) {
		countSistema=Integer.parseInt(countString);
	}
	
	int id_empresa = (Integer) request.getSession().getAttribute("id_empresa");
	DataRequester dr = new DataRequester("jdbc:firebirdsql:localhost/3050:C:/juper/old_site/SIGAS.GDB");
	Sistema[] sysList = dr.getSistemas(id_empresa);

	if (code == null) {
		code = (String) request.getSession().getAttribute("code");
	}
	sessao.setAttribute("code",code);
	
	//if (request.getParameter("countSistema") != null ) {
//		countSistema = Integer.parseInt(request.getParameter("countSistema"));
//	}
	
%>
	<form name="form1" style="margin-bottom: 8px;" method="POST" target="_top" action="mural_page.jsp">
		<table border=1 cellspacing=0>
			<tr><td> <input type="image" src="graphselect.jpg" width="33" height="32"> </td>
			<td> 
				<select style="width:100px;" name="countSistema" id="countSistema" tabindex="2" onchange="document.form1.submit()">
				<option <% if (countSistema==-1) out.print("selected"); %> disabled style="width:100px;" value=""> SISTEMA </option>
				<%						
					for (int i=0; i<sysList.length; i++) { 
						%> <option<% if (countSistema==i) {
										%> selected <%
									} %>
						value="<%=i%>"><%=sysList[i].getNome()%></option>				
					<% } %>
				</select>
				<script type="text/javascript">
				$(function () {
					$("#countSistema").selectbox();
				});
				</script>
			</td>
			</tr>
			</table>
	</form>
	
	<form name="myForm" style="margin-bottom: 8px;" method="POST" target="principal" action="mensal.jsp">	
		<table border=1 cellspacing=0>
		<input type="text" hidden="true" name="pocoName" id="pocoName" value="" />
			<tr><td> <input type="image" src="pocoselect.jpg" width="33" height="32"> </td>
			<td>
				<select name="code" id="code" tabindex="1" onchange="submeter()">
					<optgroup label="">
					<option disabled selected value=""> POÇO </option>
					<%
					Database db = new Database();					
					if ((sysList.length > 0) && (countSistema >= 0)) {
						sysList[countSistema].fillPocos(db);		
						Poco[] pocos = sysList[countSistema].getPocos();
						for(int j=0; j < pocos.length; j++) { %>
							<option text="<%=pocos[j].getName()%>" value="<%=pocos[j].getCode()%>"><%=pocos[j].getName()%></option>	
						<%}
					} else { %>
 				  <%}
				   db.close();%>
				   </optgroup>
				</select>			
							
				<script type="text/javascript">
				$(function () {					
					$("#code").selectbox();
				});
				</script>
			</td></tr>
		</table>
		</form>
		<br>
		
	<form name="ctrlAcessos" method="POST" target="principal" action="processa_acesso.jsp">	
		<table border=1 cellspacing=0>
			<tr><td> <input type="image" src="ctrlImg.gif" width="33" height="32"> </td>			
			<td>
			<select name="acess" id="acess" tabindex="1" onchange="document.ctrlAcessos.submit()">
				<optgroup label="">
				<option disabled selected value=""> Ctrl de Acessos </option>
					<% if(user.equals("SIGAS")) { %>
						<option value="view_clientes.jsp">Empresas</option>	
					<% } %>			
					<% if(!acesso.equals("Usuario") && !acesso.equals("Gerente")) { %>
						<option value="sistema.jsp">Sistemas</option>	
					<% } %>			
					<% if(!acesso.equals("Usuario")) { %>
						<option value="poco.jsp">Poços</option>						
					<% } %>			
					<% if(!acesso.equals("Usuario") && !acesso.equals("Gerente")) { %>						
						<option value="user.jsp">Usuários</option>						
					<% } %>
					<% if(user.equals("SIGAS")) { %>
						<option value="testes.jsp">Ver Dados Brutos</option>	
					<% } %>			
			   </optgroup>
			</select>			
		</td></tr>
		</table>
					
		<script type="text/javascript">
		$(function () {
			$("#acess").selectbox();
		});
		</script>
	</form>
	
	<br>
		
<!-- <input type="image" src="bt_sistema_up.jpg" onClick="window.open('tabela_mensal.html')" alt="Configurações" value="submit" width="185" height="32"> -->
<!-- <input type="image" src="bt_poco_up.jpg" onClick="window.open('tabela_mensal.html')" alt="Configurações" value="submit" width="185" height="32"> -->

<form name="formBtn" method="POST" target="principal" onsubmit="return verifyPoco();" action="processa_acesso.jsp">
<input type="text" hidden="true" name="pocoNumber" id="pocoNumber" value="" />
<table border=1 cellspacing=0>    
	<tr>    
		<td onclick="resetTds(); this.style.background='yellow';"><input type="image" src="bt_confi_up.jpg" alt="Configurações" name="acess" id="acess" value="configuracoes.jsp" width="185" height="32"></td>
	</tr>
	<tr>    
		<td onclick="resetTds(); this.style.background='yellow';"><input type="image" src="bt_pesquisa_up.jpg" name="acess" id="acess" value="pesquisa.jsp"  width="185" height="32"><br></td>
	</tr>    
	<tr>    
		<td onclick="resetTds(); this.style.background='yellow';"><input type="image" src="bt_dados_up.jpg" name="acess" id="acess" value="cad_gerais.jsp"  width="185" height="32"><br></td>
	</tr>    
	<tr>    
		<td onclick="resetTds(); this.style.background='yellow';"><input type="image" src="bt_relatorio_up.jpg" name="acess" id="acess" value="rel_outorga.jsp"  width="185" height="32"><br></td>
	</tr>    
	<tr>
		<td onclick="resetTds(); this.style.background='yellow';"><input type="image" src="bt_orienta_up.jpg" name="acess" id="acess" value="tecnica.jsp" width="185" height="32"><br></td>
	</tr>    
	<tr>	
		<td onclick="resetTds(); this.style.background='yellow';"><input type="image" src="bt_parametros_up.jpg" name="acess" id="acess" value="validacao.jsp"  width="185" height="32"></td>
	</tr>
	</td></tr>
</table>
</form>

<br>
<br>

<input type="image" src="tit_dica.png"><br>
<textarea rows=4 cols=22>
ESCOLHA SEU SISTEMA
</textarea>
</form>
 
</body>
</noframes>
</FRAMESET>
</html>

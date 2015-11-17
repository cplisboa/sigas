<%@ page  import="java.sql.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="sigas.*" %>	
<html>
<head>
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/bootstrap-theme.css" rel="stylesheet" />			
	<script>
		function apaga(id, str) {
			if (confirm("Você tem certeza que deseja remover o poço "+str+"?")) {
				document.getElementById("pocoToEdit").value = str;
				document.getElementById("id_sistema").value = id;
				document.getElementById("action").value = "3";			
				document.forms["form2"].submit();		
			}
		}	
	
		function valida() {		
			var nome = myForm.tnome.value;
			var utm = myForm.utmNorte.value;
			var utmL = myForm.utmLeste.value;
			if (nome == "") {
				alert('Preencha o campo com número ou nome do poço'); 
				myForm.tnome.focus(); 
				return false;
			}
			if (utm == "") {
				alert('Preencha o campo com a coordenada UTM Norte/Sul, ela é utilizada para identificar os dados recebidos do poço.'); 
				myForm.utmNorte.focus(); 
				return false;
			}
			if (utm.length != 7) {
				alert('A coordenada UTM Norte/Sul precisa ter exatamente 7 caracteres.'); 
				myForm.utmNorte.focus(); 
				return false;
			}			
			
			if (utmL == "") {
				alert('Preencha o campo com a coordenada UTM Leste/Oeste, ela é utilizada para identificar os dados recebidos do poço.'); 
				myForm.utmLeste.focus(); 
				return false;
			}			
			if (utmL.length != 6) {
				alert('A coordenada UTM Leste/Oeste precisa ter exatamente 6 caracteres.'); 
				myForm.utmNorte.focus(); 
				return false;
			}			
			
			document.forms["myForm"].submit();				
		}	
	</script>

  <meta http-equiv="Content-Type"
 content="text/html; charset=ISO-8859-1">
  <title>Cadastro de Poços</title>
</head>
<body style="margin: 5px;" bgcolor="">
	<%
	int id_empresa = (Integer) request.getSession().getAttribute("id_empresa");
	//out.println(""+id_empresa+"<br>").
	
	if((request.getParameter("action")!=null) && (request.getParameter("action").equals("3"))) {
		// Apagar poço que vem no campo pocoToEdit
		String pocoName = request.getParameter("pocoToEdit");
		String id_sistema = request.getParameter("id_sistema");
		
		Class.forName("org.firebirdsql.jdbc.FBDriver");    
		String url = "jdbc:firebirdsql:localhost/3050:c:/juper/old_site/SIGAS.GDB";
		Connection connection = DriverManager.getConnection (url, "sysdba", "masterkey");
			
		try{ // sql com delete 
			String sql = "delete from poco_gerais where nome='"+pocoName+"' and id_sistema="+id_sistema; 
			Statement smtp = connection.createStatement(); 
			smtp.executeUpdate(sql);			
			out.println("Remoção do poço "+pocoName+" ocorrida com sucesso!<br><br>");
			smtp.close(); 
		} catch (SQLException sqlex){ // Erro ao executar a Query no banco 
			%>Erro executando remoção de poço na base de dados. <%=sqlex.getMessage()%><% 
		}					
		
	}
	DataRequester dr = new DataRequester("jdbc:firebirdsql:localhost/3050:C:/juper/old_site/SIGAS.GDB");
	Sistema[] sistList = dr.getSistemas(id_empresa);
	Empresa emp = new Empresa(id_empresa);
	emp.setEmpresa(id_empresa);	
	int numPocosPossiveis = emp.getNum_pocos();
	int pocosCadastrados = Poco.numPocos(id_empresa);
	out.println("Numero de poços possíveis para a empresa: "+numPocosPossiveis+"<br>");
	out.println("Numero de poços já cadastrados: "+pocosCadastrados+"<br>");
	if(pocosCadastrados >= numPocosPossiveis) {
		out.println("Empresa já possui " + pocosCadastrados + " de um total de " + numPocosPossiveis + " Poços liberados. Contate o administrados para liberar mais poços.<br><br>");
	} else {
		String tnome = request.getParameter("tnome");
		if(tnome != null) {
			String tSistema = request.getParameter("tSistema");		
			String tsuperin = "---";
			String utmNorte = request.getParameter("utmNorte");
			String utmLeste = request.getParameter("utmLeste");

			out.println(tSistema);
			out.println(tsuperin);
			out.println(utmNorte);
			boolean result=false;
			try {	
				result = dr.createPocoSlim(tnome, Integer.parseInt(tSistema), tsuperin, utmNorte, utmLeste);
				//dr.createPoco(tnome, tEndereco, tLocal, tmunicip, tuf, tcep, utmNorte, utmLeste, tLatitude, tLongitude, tOutNo, tArt, tResp, tArtNo, tFimUso, tVazOut, tVolOut, tSituation, tReativado, tObs, Integer.parseInt(tSistema));
				
			} catch (Exception e){ // Erro ao executar a Query no banco 
				%>Erro criando poço <%=e.getMessage()%> <% 	
			}
			if (result) {
				%>Poço <%=tnome%> inserido com sucesso! <br><% 		
			} else {
				%>Problema ao inserir poço <%=tnome%>. Contacte o administrador. <br> <% 				
			} 
		} %>    
 
	  <!-- Preciso a partir do id da empresa preencher uma lista de sistemas e criar um combo para seleção -->
	  <%
		if (sistList==null) {
			out.println("Não existem Sistemas cadastrados para possibilitar cadastro de poços.");
		} else {  %>	  
		  <form name="myForm" method="post"> 
		  <table style="margin-left: 220px; height: 31px; width: 322px;" border="0" cellpadding="0" cellspacing="0">
			<tbody>
			  <tr style="height: 20px;">
				<td style="height: 20px; width: 80px; font-family: Arial;  font-weight: bold;"> CADASTRO DE POÇOS </td>
			  </tr>
			</tbody>
		  </table>
		  <br>
		  <table class="table table-striped" style="margin-left: 10px; width: 600px;">
			<tbody>
			  <tr style="height: 20px;">
				<td style="height: 20px; width: 60px; font-size: 12px; font-family: Arial; font-weight: bold;"> SISTEMA: </td>
				<!-- Combo com sistemas disponíveis -->	
				<td style="height: 20px;"> 
					<select name="tSistema">
					
						<% if(sistList==null) {
							out.println("Sistlist é null<br>");
						} else {
						for (int i=0; i<sistList.length; i++) { %>
							<option name="tSistema" value="<%=sistList[i].getId_sistema()%>"><%=sistList[i].getNome()%></option>
						<% }
						}%>
					</select>
				</td>
			  </tr>	
			  <tr style="height: 20px;  font-size: 12px; font-family: Arial; font-weight: bold;">
				<td style="height: 20px; width: 60px; font-size: 12px; font-family: Arial; font-weight: bold;">PO&Ccedil;O N&ordm;:</td>
				<td style="height: 20px;"> <input name="tnome" style="height: 20px; width: 350px;" type="text"> </td>
			  </tr>
			  
			  <tr style="height: 20px;  font-size: 12px; font-family: Arial; font-weight: bold;">
				<td style="height: 20px; width: 200px; font-size: 12px; font-family: Arial; font-weight: bold;">COORDENADA UTM NORTE/SUL</td>
				<td style="height: 20px;"> <input name="utmNorte" style="height: 20px; width: 350px;" type="text"> </td>
			  </tr>	  
			  <tr style="height: 20px;  font-size: 12px; font-family: Arial; font-weight: bold;">
				<td style="height: 20px; width: 200px; font-size: 12px; font-family: Arial; font-weight: bold;">COORDENADA UTM LESTE/OESTE</td>
				<td style="height: 20px;"> <input name="utmLeste" style="height: 20px; width: 350px;" type="text"> </td>
			  </tr>	  			  
			</tbody>
		  </table>
		  <br>  
		<input style="margin-left: 250px;" class="btn btn-success" onclick="valida();" value="Cadastrar">
		</form>
		<br>
	<%   } 
	} %>
	<form name="form2" id="form2" method="post"> 
		<input type="text" hidden="true" id="action" name="action" value="1" />	
		<input type="text" hidden="true" id="id_sistema" name="id_sistema" value="" />	
		<input type="text" hidden="true" id="pocoToEdit" name="pocoToEdit" value="" />	
		<table style="margin-left: 20px; height: 31px; width: 400px;" border="1" cellpadding="0" cellspacing="0">
		<%
		Database db = new Database();					
		if(sistList!=null) { %>
			<tbody>
			  <tr>
				<th> SISTEMA </th>
				<th> NOME/NUMERO </th>
				<th> </th>
			  </tr>
			<%  
				for(int i=0; i<sistList.length; i++) {
					sistList[i].fillPocos(db);		
					Poco[] pocos = sistList[i].getPocos();
					for(int j=0; j < pocos.length; j++) { %>
						<tr>
							<td style="height: 20px; width: 150px;"> <%=sistList[i].getNome()%> </td>				
							<td style="height: 20px; width: 150px; text-align:center;"> <%=pocos[j].getName()%> </td>				
							<td style="height: 21px; width: 60px; text-align:center;">
								<input name="removeBtn" id="removeBtn" alt="Remover" value="Remover" onclick="apaga('<%=sistList[i].getId_sistema()%>', '<%=pocos[j].getName()%>');" type="button">
							</td>
						</tr>
					<% } 
				} 
			}%>
			</tbody>
			</table>	
	</form>
</body>
</html>
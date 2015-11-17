<%@ page  import="java.sql.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="sigas.*" %>


<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script> 
	function valida() {		
		var code = myForm.utmNorte.value;
		if (code == "") {
			alert('Preencha o campo UTM Norte, esse dado é usado como identificador dos dados recebidos pelo poço.'); 
			myForm.utmNorte.focus(); 
			return false;
		}
	}
</script>
 
  <title>Dados Cadastrais - Gerais</title>
</head>
<body style="margin: 0px;" bgcolor="">

	
	<%

	HttpSession sessao = request.getSession(true);  
	String pocoNumber = (String) sessao.getAttribute("pocoNumber");
	sessao.setAttribute("pocoNumber",pocoNumber);
	String countSistema = (String) sessao.getAttribute("countSistema");
	Gerais gera = new Gerais();
	
	gera.fillGerais(pocoNumber);
	
	//out.println("countSistema = "+ countSistema +"<br>");
	int id_empresa = (Integer) request.getSession().getAttribute("id_empresa");
    String tnome = request.getParameter("tnome");
	// Veio algo na request, então foi "aperto" do botão de atualizar/cadastrar
    if(tnome != null) {
		Gerais gerais = new Gerais();
		gerais.nome = tnome;
    	gerais.endereco = request.getParameter("tEndereco"); 
    	gerais.localidade = request.getParameter("tLocal");
		//String tSistema = request.getParameter("tSistema");
		
    	gerais.municipio = request.getParameter("tmunicip");
    	gerais.uf = request.getParameter("tuf");
    	gerais.cep = request.getParameter("tcep");
    	gerais.utmNorte = request.getParameter("utmNorte");
    	gerais.utmSul = request.getParameter("utmLeste");
    	gerais.latitude = request.getParameter("tLatitude");
    	gerais.longitude = request.getParameter("tLongitude");
    	gerais.outorga_no = request.getParameter("tOutNo");
    	gerais.art = request.getParameter("tArt");
    	gerais.tecnico = request.getParameter("tResp");
    	gerais.artNo = request.getParameter("tArtNo");
		
    	gerais.finalidade = request.getParameter("tFimUso");
		gerais.vazaoOutorgada = request.getParameter("tVazOut");
		gerais.volumeOut = request.getParameter("tVolOut");
		gerais.situacao = request.getParameter("tSituation");
		gerais.reativadoData = request.getParameter("tReativado");
		gerais.obs = request.getParameter("tObs");
		try {	
			DataRequester dr = new DataRequester("jdbc:firebirdsql:localhost/3050:C:/juper/old_site/SIGAS.GDB");
			//dr.createPoco(tnome, tEndereco, tLocal, tmunicip, tuf, tcep, utmNorte, utmLeste, tLatitude, tLongitude, tOutNo, tArt, tResp, tArtNo, tFimUso, tVazOut, tVolOut, tSituation, tReativado, tObs, Integer.parseInt(tSistema));
			// Atualiza dados gerais
			gerais.atualiza();
			%> <script>
				alert("Poço <%=tnome%> atualizado com sucesso!");			
			</script> <%
		} catch (Exception e){ // Erro ao executar a Query no banco 
			%>Erro criando poço <%=e.getMessage()%> <% 	
		}		
	} 
	// Não veio nada da request, então vou trazer os dados gerais já cadastrados no poço.
	gera = new Gerais();
	gera.fillGerais(pocoNumber);	
   	%>    
 
  <!-- Preciso a partir do id da empresa preencher uma lista de sistemas e criar um combo para seleção -->
  <%
	DataRequester dr = new DataRequester("jdbc:firebirdsql:localhost/3050:C:/juper/old_site/SIGAS.GDB");
	Sistema[] sistList = dr.getSistemas(id_empresa);
	
  %>
  
  <form name="buttons" target="_self" action="processa_acesso.jsp" method="post">
  <table>
  <tr>
	<td> <input type="image" name="acess" id="acess" src="bt_gerais_down.png" alt="" value="cad_gerais.jsp" width="67" height="32"></td>
	<td> <input type="image" name="acess" id="acess" src="bt_operaciosnais_up.png" alt="submit" value="operacionais.jsp" width="106" height="32"></td>
	<td> <input type="image" name="acess" id="acess" src="bt_hidro_up.png" alt="" value="Hidrogeologicos.jsp" width="139" height="32"></td>
	<td> <input type="image" name="acess" id="acess" src="bt_construtivo_up.png" alt="" value="construtivos.jsp" width="106" height="32"></td>

  </tr>
  </table>
  </form>
  
  
  <form name="myForm" id="myForm" action="cad_gerais.jsp" onsubmit="valida(); retun false;" method="post">   
  <table style="margin-left: 10px;" border="1" cellpadding="1" cellspacing="1">
    <tbody>
      <tr style="height: 23px;">
        <td
 style="height: 23px; width: 60px; background-image: url(cor_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">	SISTEMA:
        </td>
		<!-- Combo com sistemas disponíveis -->	
        <td style="height: 23px;"> 
			<select disabled name="tSistema">
				<% for (int i=0; i<sistList.length; i++) { %>
						<option name="tSistema" 
						<% if (i==Integer.parseInt(countSistema)) { out.println("selected"); }%>
						value="<%=sistList[i].getId_sistema()%>"><%=sistList[i].getNome()%></option>
				<% }%>
			</select>
		</td>
      </tr>
      <tr style="height: 23px;  font-size: 12px; font-family: Arial; font-weight: bold;">
        <td style="height: 23px; width: 60px; background-image: url(cor_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PO&Ccedil;O
N&ordm;:</td>
        <td style="height: 23px;"> <input name="tnome" style="height: 23px; width: 610px;" value="<%=pocoNumber%>" type="text"> </td>
      </tr>	  
    </tbody>
  </table>
  <br>
  <table style="margin-left: 10px; width: 711px;" border="1"
 cellpadding="1" cellspacing="1">
    <tbody>
      <tr style="height: 23px;">
        <td style="height: 23px; width: 350px; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">ENDERE&Ccedil;O:</td>
        <td colspan="2" rowspan="1" style="height: 23px; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold; width: 188px;">DISTRITO,
LOCALIDADE, BAIRRO:</td>
      </tr>
      <tr>
        <td style="height: 23px;"> <input name="tEndereco" value="<%=gera.endereco%>" style="height: 23px; width: 350px;" type="text"> </td>
        <td colspan="2"style="height: 23px;"> <input name="tLocal" value="<%=gera.localidade%>" style="height: 23px; width: 350px;" type="text"> </td>
      </tr>
      <tr style="font-size: 12px; font-family: Arial; font-weight: bold;">
        <td style="background-image: url(clara_gerais.jpg);">MUNIC&Iacute;PIO:</td>
        <td style="width: 115px; background-image: url(clara_gerais.jpg);">UF:</td>
        <td style="width: 188px; background-image: url(clara_gerais.jpg);">CEP:</td>
      </tr>
      <tr style="font-size: 12px; font-family: Arial; font-weight: bold;">
        <td style="height: 23px;"> <input name="tmunicip" value="<%=gera.municipio%>" style="height: 23px; width: 350px;" type="text"> </td>
        <td style="height: 23px;"> <input name="tuf" value="<%=gera.uf%>" style="height: 23px; width: 157px;" type="text"> </td>
        <td style="width: 188px;"> <input name="tcep" value="<%=gera.cep%>" style="height: 23px; width: 188px;" type="text"> </td>
      </tr>
      <tr style="font-size: 12px; font-family: Arial; font-weight: bold;">
        <td style="background-image: url(clara_gerais.jpg);">UTM (Leste/Oeste):</td>
        <td style="width: 188px; background-image: url(clara_gerais.jpg);" colspan="2" rowspan="1">UTM (Norte/Sul):</td>
      </tr>
      <tr style="font-size: 12px; font-family: Arial; font-weight: bold;">
        <td style="height: 23px;"> <input name="utmNorte" value="<%=gera.utmNorte%>" style="height: 23px; width: 350px;" type="text"> </td>
        <td colspan="2"style="height: 23px;"> <input name="utmLeste" value="<%=gera.utmSul%>" style="height: 23px; width: 350px;" type="text"> </td>
      </tr>
      <tr style="font-size: 12px; font-family: Arial; font-weight: bold;">
        <td style="background-image: url(clara_gerais.jpg);">LONGITUDE:</td>
        <td style="width: 188px; background-image: url(clara_gerais.jpg);" colspan="2" rowspan="1">LATITUDE(GGMMSS):</td>
      </tr>
      <tr style="font-size: 12px; font-family: Arial; font-weight: bold;">
        <td style="height: 23px;"> <input name="tLatitude" placeholder="Utilize espaços para separação. Ex:32 55 43" value="<%=gera.latitude%>" style="height: 23px; width: 350px;" type="text"> </td>
        <td colspan="2"style="height: 23px;"> <input name="tLongitude" placeholder="Utilize espaços para separação. Ex:32 55 43" value="<%=gera.longitude%>" style="height: 23px; width: 350px;" type="text"> </td>
      </tr>
    </tbody>
  </table>
  <br>
  
  <table style="margin-left: 10px; width: 712px;" border="1" cellpadding="1" cellspacing="1">
    <tbody>
      <tr style="height: 23px;">
        <td colspan="4" rowspan="1" style="height: 23px; background-image: url(clara_gerais.jpg); text-align:center; font-size: 12px; font-family: Arial; font-weight: bold; width: 254px;"> OUTORGA</div>
        </td>
      </tr>
      <tr style="font-size: 12px; font-family: Arial; font-weight: bold;">
        <td style="width: 98px; background-image: url(clara_gerais.jpg);">N&ordm;:</td>
        <td style="width: 99px; background-image: url(clara_gerais.jpg);">ART:</td>
        <td style="width: 254px; background-image: url(clara_gerais.jpg);">RESPONS&Aacute;VEL:</td>
        <td style="width: 243px; background-image: url(clara_gerais.jpg);">ART N&ordm;:</td>
      </tr>
      <tr style="font-size: 12px; font-family: Arial; font-weight: bold;">
        <td style="width: 98px;">  <input name="tOutNo" value="<%=gera.outorga_no%>" style="height: 23px; width: 98px;" type="text"> </td>
        <td style="width: 98px;">  <input name="tArt" value="<%=gera.art%>" style="height: 23px; width: 98px;" type="text"> </td>
        <td style="width: 254px;">  <input name="tResp" value="<%=gera.tecnico%>" style="height: 23px; width: 254px;" type="text"> </td>
        <td style="width: 243px;">  <input name="tArtNo" value="<%=gera.artNo%>" style="height: 23px; width: 243px;" type="text"> </td>
      </tr>
      <tr style="font-size: 12px; font-family: Arial; font-weight: bold;">
        <td style="width: 99px; background-image: url(clara_gerais.jpg);" colspan="2" rowspan="1">FINALIDADE DO USO:</td>
        <td style="width: 254px; background-image: url(clara_gerais.jpg);">VAZ&Atilde;O OUTORGADA:</td>
        <td style="width: 243px; background-image: url(clara_gerais.jpg);">VOLUME OUTORGADO:</td>
      </tr>
      <tr style="font-size: 12px; font-family: Arial; font-weight: bold;">
        <td colspan=2> <input value="<%=gera.finalidade%>" name="tFimUso"style="height: 23px; width: 200px;" type="text"> </td>
        <td> <input name="tVazOut" value="<%=gera.vazaoOutorgada%>" style="height: 23px; width: 205px;" type="text"> (m&sup3;/h)</td>
        <td> <input name="tVolOut" value="<%=gera.volumeOut%>" style="height: 23px; width: 195px;" type="text"> (m&sup3;/h)</td>
      </tr>
    </tbody>
  </table>
  <br>
  
 <table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr style="height: 23px;">
    <td style="height: 23px; width: 350px; background-image: url(cor_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">SITUAÇÃO:</td>
    <td style="height: 23px; width: 350px; background-image: url(cor_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">REATIVADO EM:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 350px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="tSituation" value="<%=gera.situacao%>" style="height: 23px; width: 350px" type="text">
	</td>
    <td style="height: 23px; width: 350px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="tReativado" value="<%=gera.reativadoData%>" style="height: 23px; width: 350px" type="text">
	</td>
</tr>
<tr>
	<td colspan=2 rowspan=6> <textarea name="tObs" cols=85 rows=6> <%=gera.obs%> </textarea>
</tr>
</table>
<br>
<center>
<input style="margin-left: 10px;" type="submit" value="Atualizar">
</center>
</form>
</body>
</html>

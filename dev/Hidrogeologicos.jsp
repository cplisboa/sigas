<%@ page  import="java.sql.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="sigas.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<script language="JavaScript">
	function contar(campo, max){
		var dado = document.getElementById(campo);
		var tam = dado.value.length;
		
		if (tam > parseInt(max)) {
			alert("O tamanho máximo permitido para esse campo são "+max+" caracteres.");
		}
		return true;
	}
	
</script>

  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Dados Cadastrais - Gerais</title>
</head>

<body style="margin: 0px;" bgcolor="">

  <form name="buttons" target="_self" action="processa_acesso.jsp" method="post">
  <table>
  <tr>
	<td> <input type="image" name="acess" id="acess" src="bt_gerais_up.png" alt="" value="cad_gerais.jsp" width="67" height="32"></td>
	<td> <input type="image" name="acess" id="acess" src="bt_operaciosnais_up.png" alt="submit" value="operacionais.jsp" width="106" height="32"></td>
	<td> <input type="image" name="acess" id="acess" src="bt_hidro_down.png" alt="" value="Hidrogeologicos.jsp" width="139" height="32"></td>
	<td> <input type="image" name="acess" id="acess" src="bt_construtivo_up.png" alt="" value="construtivos.jsp" width="106" height="32"></td>

  </tr>
  </table>
  </form>
<%  
	DataRequester dr = new DataRequester("jdbc:firebirdsql:localhost/3050:C:/juper/old_site/SIGAS.GDB");
	int id_empresa = (Integer) request.getSession().getAttribute("id_empresa");
	Sistema[] sistList = dr.getSistemas(id_empresa);
	HttpSession sessao = request.getSession(true);  
	String pocoNumber = (String) sessao.getAttribute("pocoNumber");  
    String countSistema = (String) sessao.getAttribute("countSistema");
	//out.println("-->"+request.getSession().getAttribute("id_empresa"));
	
    String bacia = request.getParameter("BACIA");
	// Veio algo na request, então foi "aperto" do botão de atualizar/cadastrar
	Hidrogeo hgeo = new Hidrogeo();
    if(bacia != null) {
		hgeo.BACIA = request.getParameter("BACIA");
		hgeo.FEICAO = request.getParameter("FEICAO");
		hgeo.UNIDADE_HIDROG = request.getParameter("UNIDADE_HIDROG");
		hgeo.FORMACAO_INICIAL1 = request.getParameter("FORMACAO_INICIAL1");
		hgeo.FORMACAO_FINAL1 = request.getParameter("FORMACAO_FINAL1");
		hgeo.FORMACAO_TIPO1 = request.getParameter("FORMACAO_TIPO1");
		hgeo.FORMACAO_INICIAL2 = request.getParameter("FORMACAO_INICIAL2");
		hgeo.FORMACAO_FINAL2 = request.getParameter("FORMACAO_FINAL2");
		hgeo.FORMACAO_TIPO2 = request.getParameter("FORMACAO_TIPO2");
		hgeo.LITOLOGIA_INICIAL1 = request.getParameter("LITOLOGIA_INICIAL1");
		hgeo.LITOLOGIA_FINAL1 = request.getParameter("LITOLOGIA_FINAL1");
		hgeo.LITOLOGIA_DESCRICAO1 = request.getParameter("LITOLOGIA_DESCRICAO1");
		hgeo.LITOLOGIA_INICIAL2 = request.getParameter("LITOLOGIA_INICIAL2");
		hgeo.LITOLOGIA_FINAL2 = request.getParameter("LITOLOGIA_FINAL2");
		hgeo.LITOLOGIA_DESCRICAO2 = request.getParameter("LITOLOGIA_DESCRICAO2");
		hgeo.LITOLOGIA_INICIAL3 = request.getParameter("LITOLOGIA_INICIAL3");
		hgeo.LITOLOGIA_FINAL3 = request.getParameter("LITOLOGIA_FINAL3");
		hgeo.LITOLOGIA_DESCRICAO3 = request.getParameter("LITOLOGIA_DESCRICAO3");
		hgeo.LITOLOGIA_INICIAL4 = request.getParameter("LITOLOGIA_FINAL4");
		hgeo.LITOLOGIA_FINAL4 = request.getParameter("LITOLOGIA_FINAL4");
		hgeo.LITOLOGIA_DESCRICAO4 = request.getParameter("LITOLOGIA_DESCRICAO4");
		hgeo.LITOLOGIA_INICIAL5 = request.getParameter("LITOLOGIA_FINAL5");
		hgeo.LITOLOGIA_FINAL5 = request.getParameter("LITOLOGIA_FINAL5");
		hgeo.LITOLOGIA_DESCRICAO5 = request.getParameter("LITOLOGIA_DESCRICAO5");
		hgeo.LITOLOGIA_INICIAL6 = request.getParameter("LITOLOGIA_INICIAL6");
		hgeo.LITOLOGIA_FINAL6 = request.getParameter("LITOLOGIA_FINAL6");
		hgeo.LITOLOGIA_DESCRICAO6 = request.getParameter("LITOLOGIA_DESCRICAO6");
		hgeo.LITOLOGIA_INICIAL7 = request.getParameter("LITOLOGIA_INICIAL7");
		hgeo.LITOLOGIA_FINAL7 = request.getParameter("LITOLOGIA_FINAL7");
		hgeo.LITOLOGIA_DESCRICAO7 = request.getParameter("LITOLOGIA_DESCRICAO7");
		hgeo.LITOLOGIA_INICIAL8 = request.getParameter("LITOLOGIA_INICIAL8");
		hgeo.LITOLOGIA_FINAL8 = request.getParameter("LITOLOGIA_FINAL8");
		hgeo.LITOLOGIA_DESCRICAO8 = request.getParameter("LITOLOGIA_DESCRICAO8");
		hgeo.PROJ_NE = Float.parseFloat(request.getParameter("PROJ_NE"));
		hgeo.PROJ_DN = Float.parseFloat(request.getParameter("PROJ_ND"));
		hgeo.VAZAO = Float.parseFloat(request.getParameter("VAZAO"));
		hgeo.CESP = Float.parseFloat(request.getParameter("CESP"));
		hgeo.JORNADA = Integer.parseInt(request.getParameter("JORNADA"));
		hgeo.TRANSM = Float.parseFloat(request.getParameter("TRANSM"));
		hgeo.OBSERVACOES = request.getParameter("OBSERVACOES");	
		hgeo.saveHidrogeo(pocoNumber); %>
		<script>
			alert("Dados Hidrogeológicos atualizados com sucesso!");
		</script>
		<%
	}
	hgeo = hgeo.fillHidrogeo(pocoNumber);
%>  
  

<form name="myForm" method="post">
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
        <td style="height: 23px;"> <input name="tnome" style="height: 23px; width: 610px;" disabled value="<%=pocoNumber%>" type="text"> </td>
      </tr>	  
    </tbody>
  </table>
<br>
<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=3 style="text-align:center; font-family:Arial; background-image: url(cor_gerais.jpg); font-size:15px; font-weight: bold;">DADOS GEOLÓGICOS</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 231px; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">BACIA HIDROGRÁFICA:</td>
    <td style="height: 23px; width: 231px; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">FEIÇÃO GEOMORFOLÓGICA:</td>
	<td style="height: 23px; width: 231px; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">UNIDADE HIDROGEOLÓGICA:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 231px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="BACIA" id="BACIA" value="<%=hgeo.BACIA%>" style="height: 23px; width: 231px" type="text" onchange="contar('BACIA',30);">
	</td>
    <td style="height: 23px; width: 231px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="FEICAO" id="FEICAO" value="<%=hgeo.FEICAO%>"style="height: 23px; width: 231px" type="text" onchange="contar('FEICAO',30);">
	</td>
    <td style="height: 23px; width: 231px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="UNIDADE_HIDROG" id="UNIDADE_HIDROG" value="<%=hgeo.UNIDADE_HIDROG%>"style="height: 23px; width: 231px" type="text" onchange="contar('UNIDADE_HIDROG',30);">
	</td>	
</tr>
</table>

<br>
<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=3 style="text-align:center; background-image: url(cor_gerais.jpg); font-weight: bold; font-family: Arial; font-size:15px;">FORMAÇÃO GEOLÓGICA</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 115px; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DE:</td>
    <td style="height: 23px; width: 115px; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">ATÉ:</td>
	<td style="height: 23px; width: 462px; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TIPO:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 115px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="FORMACAO_INICIAL1" id="FORMACAO_INICIAL1" value="<%=hgeo.FORMACAO_INICIAL1%>" style="height: 23px; width: 115px" type="text" onchange="contar('FORMACAO_INICIAL1',10);">
	</td>
    <td style="height: 23px; width: 115px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="FORMACAO_FINAL1" id="FORMACAO_FINAL1" value="<%=hgeo.FORMACAO_FINAL1%>" style="height: 23px; width: 115px" type="text" onchange="contar('FORMACAO_FINAL1',10);">
	</td>
    <td style="height: 23px; width: 462px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="FORMACAO_TIPO1" id="FORMACAO_TIPO1" value="<%=hgeo.FORMACAO_TIPO1%>" style="height: 23px; width: 462px" type="text" onchange="contar('FORMACAO_TIPO1',30);">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 115px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="FORMACAO_INICIAL2" id="FORMACAO_INICIAL2" value="<%=hgeo.FORMACAO_INICIAL2%>" style="height: 23px; width: 115px" type="text" onchange="contar('FORMACAO_INICIAL2',10);">
	</td>
    <td style="height: 23px; width: 115px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="FORMACAO_FINAL2" id="FORMACAO_FINAL2" value="<%=hgeo.FORMACAO_FINAL2%>" style="height: 23px; width: 115px" type="text" onchange="contar('FORMACAO_FINAL2',10);">
	</td>
    <td style="height: 23px; width: 462px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="FORMACAO_TIPO2" id="FORMACAO_TIPO2" value="<%=hgeo.FORMACAO_TIPO2%>" style="height: 23px; width: 462px" type="text" onchange="contar('FORMACAO_TIPO2',30);">
	</td>	
</tr>

</table>
<br>

<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
   <td colspan=3 style="text-align:center; background-image: url(cor_gerais.jpg); font-weight: bold; font-family: Arial; font-size:15px;">LITOLOGIA</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 115px; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DE:</td>
    <td style="height: 23px; width: 115px; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">ATÉ:</td>
	<td style="height: 23px; width: 462px; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DESCRIÇÃO LITOLÓGICA:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 52px; width: 115px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="LITOLOGIA_INICIAL1" value="<%=hgeo.LITOLOGIA_INICIAL1%>"style="height: 52px; width: 115px" type="text" onchange="contar('LITOLOGIA_INICIAL1',10);">
	</td>
    <td style="height: 52px; width: 115px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="LITOLOGIA_FINAL1" value="<%=hgeo.LITOLOGIA_FINAL1%>" style="height: 52px; width: 115px" type="text" onchange="contar('LITOLOGIA_FINAL1',10);">
	</td>
    <td style="height: 52px; width: 462px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="LITOLOGIA_DESCRICAO1" value="<%=hgeo.LITOLOGIA_DESCRICAO1%>" style="height: 52px; width: 462px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 52px; width: 115px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="LITOLOGIA_INICIAL2" value="<%=hgeo.LITOLOGIA_INICIAL2%>" style="height: 52px; width: 115px" type="text" onchange="contar('LITOLOGIA_INICIAL2',10);">
	</td>
    <td style="height: 52px; width: 115px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="LITOLOGIA_FINAL2" value="<%=hgeo.LITOLOGIA_FINAL2%>" style="height: 52px; width: 115px" type="text" onchange="contar('LITOLOGIA_FINAL2',10);">
	</td>
    <td style="height: 52px; width: 462px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="LITOLOGIA_DESCRICAO2" value="<%=hgeo.LITOLOGIA_DESCRICAO2%>" style="height: 52px; width: 462px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 52px; width: 115px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="LITOLOGIA_INICIAL3" value="<%=hgeo.LITOLOGIA_INICIAL3%>" style="height: 52px; width: 115px" type="text" onchange="contar('LITOLOGIA_INICIAL3',10);">
	</td>
    <td style="height: 52px; width: 115px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="LITOLOGIA_FINAL3" value="<%=hgeo.LITOLOGIA_FINAL3%>" style="height: 52px; width: 115px" type="text" onchange="contar('LITOLOGIA_FINAL3',10);">
	</td>
    <td style="height: 52px; width: 462px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="LITOLOGIA_DESCRICAO3" value="<%=hgeo.LITOLOGIA_DESCRICAO3%>" style="height: 52px; width: 462px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 52px; width: 115px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="LITOLOGIA_INICIAL4" value="<%=hgeo.LITOLOGIA_INICIAL4%>" style="height: 52px; width: 115px" type="text" onchange="contar('LITOLOGIA_INICIAL4',10);">
	</td>
    <td style="height: 52px; width: 115px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="LITOLOGIA_FINAL4" value="<%=hgeo.LITOLOGIA_FINAL4%>" style="height: 52px; width: 115px" type="text" onchange="contar('LITOLOGIA_FINAL4',10);">
	</td>
    <td style="height: 52px; width: 462px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="LITOLOGIA_DESCRICAO4" value="<%=hgeo.LITOLOGIA_DESCRICAO4%>" style="height: 52px; width: 462px" type="text">
	</td>	
</tr>
</table>

<br>
<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
   <td colspan=6 style="text-align:center; background-image: url(cor_gerais.jpg); font-weight: bold; font-family: Arial; font-size:15px;">DADOS DE PROJETO</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 90px; text-align:center; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">NE</td>
    <td style="height: 23px; width: 90px; text-align:center; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">ND</td>
	<td style="height: 23px; width: 105px; text-align:center; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">VAZÃO</td>
	<td style="height: 23px; width: 105px; text-align:center; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">Cesp</td>
	<td style="height: 23px; width: 105px; text-align:center; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">JORNADA</td>
	<td style="height: 23px; width: 180px; text-align:center; background-image: url(clara_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TRANSMISSIBILIDADE</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 52px; width: 90px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="PROJ_NE" value="<%=hgeo.PROJ_NE%>" style="height: 52px; width: 90px" type="text">
	</td>
    <td style="height: 52px; width: 90px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="PROJ_ND" value="<%=hgeo.PROJ_DN%>" style="height: 52px; width: 90px" type="text">
	</td>
    <td style="height: 52px; width: 105px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="VAZAO" value="<%=hgeo.VAZAO%>" style="height: 52px; width: 105px" type="text">
	</td>	
    <td style="height: 52px; width: 105px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="CESP" value="<%=hgeo.CESP%>" style="height: 52px; width: 105px" type="text">
	</td>	
    <td style="height: 52px; width: 105px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="JORNADA" value="<%=hgeo.JORNADA%>" style="height: 52px; width: 105px" type="text">
	</td>	
    <td style="height: 52px; width: 180px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="TRANSM" value="<%=hgeo.TRANSM%>" style="height: 52px; width: 180px" type="text">
	</td>		
</tr>
</table>

<br>
<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
   <td style="height: 140px; width: 700px; font-size: 12px; font-family: Arial; font-weight: bold;"> 
		<input name="OBSERVACOES" style="height: 140px; width: 700px; text-align:" type="text" value="<%=hgeo.OBSERVACOES%>">   
   </td>
</tr>
</table>
<br>
<table border=0 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
   <td style="height: 23px; width: 710px; text-align:center; font-size: 12px; font-family: Arial; font-weight: bold;"> 
		<input style="height: 26px; width: 100px; text-align:center;" type="submit" value="Atualizar">   
   </td>
</tr>
</table>



<%@ page  import="java.sql.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="sigas.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Construtivos</title>
</head>

<body style="margin: 0px;" bgcolor="">

  <form name="buttons" target="_self" action="processa_acesso.jsp" method="post">
  <table>
  <tr>
	<td> <input type="image" name="acess" id="acess" src="bt_gerais_up.png" alt="" value="cad_gerais.jsp" width="67" height="32"></td>
	<td> <input type="image" name="acess" id="acess" src="bt_operaciosnais_up.png" alt="submit" value="operacionais.jsp" width="106" height="32"></td>
	<td> <input type="image" name="acess" id="acess" src="bt_hidro_up.png" alt="" value="Hidrogeologicos.jsp" width="139" height="32"></td>
	<td> <input type="image" name="acess" id="acess" src="bt_construtivo_down.png" alt="" value="construtivos.jsp" width="106" height="32"></td>
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
	
    String construtor = request.getParameter("construtor");
	// Veio algo na request, ent�o foi "aperto" do bot�o de atualizar/cadastrar
	Construtivos constru = new Construtivos();
    if(construtor != null) {
		constru.construtor = request.getParameter("construtor");
		constru.data_constr = request.getParameter("data_constr");
		constru.artno = request.getParameter("artno");
		constru.resp = request.getParameter("resp");
		constru.licensa = request.getParameter("licensa");
		constru.data_licensa = request.getParameter("data_licensa");
		constru.saveConstru(pocoNumber); %>
		<script>
			alert("Dados Construtivos atualizados com sucesso!");
		</script>
		<%
	}
	constru = constru.fillConstru(pocoNumber);
	
	
%>  
<form name="myForm" method="post">
  <table style="margin-left: 10px;" border="1" cellpadding="1" cellspacing="1">
    <tbody>
      <tr style="height: 23px;">
        <td
 style="height: 23px; width: 60px; background-image: url(cor_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">	SISTEMA:
        </td>
		<!-- Combo com sistemas dispon�veis -->	
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
  </table><br>

<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">CONSTRUTOR:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DATA DA CONSTRU��O:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">ART. N:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="construtor" id="construtor" value="<%=constru.construtor%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="data_constr" id="data_constr" value="<%=constru.data_constr%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="artno" id="artno" value="<%=constru.artno%>" style="height: 23px; width: 232px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">RESPONS�VEL T�CNICO:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">LICEN�A PR�VIA:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DATA:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="resp" id="resp" value="<%=constru.resp%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="licensa" id="licensa" value="<%=constru.licensa%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="data_licensa" id="data_licensa" value="<%=constru.data_licensa%>" style="height: 23px; width: 232px" type="text">
	</td>	
</tr>
</table>
<br>

<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=3 style="text-align:center; font-family:Arial; background-image: url(filete_cor_const.jpg); font-size:15px; font-weight: bold;">PERFURA��O</td>
</tr>
<!-- <tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PERCUSS�O()</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">ROTATIVO()</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">ROTO-PERCUSSIVO()</td>
</tr> -->
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">IN�CIO/T�RMINO:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PROFUNDIDADE:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DI�METRO FINAL:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="inicio" id="inicio" value="<%=constru.inicio%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="profund" id="profund" value="<%=constru.profund%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="diametro" id="diametro" value="<%=constru.diametro%>" style="height: 23px; width: 232px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DI�METRO DE PERFURA��O:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">ENTRADAS DE �GUA:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">N�VEIS DA �GUA:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input <input name="perf11" id="perf11" value="<%=constru.perf[0][0]%>" style="height: 23px; width: 60px" type="text"> m A:  <input name="perf12" id="perf12" value="<%=constru.perf[0][1]%>" style="height: 23px; width: 60px" type="text"> m
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input <input name="entrada11" id="entrada11" value="<%=constru.entrada[0][0]%>" style="height: 23px; width: 60px" type="text"> m A:  <input name="entrada12" id="entrada12" value="<%=constru.entrada[0][1]%>" style="height: 23px; width: 60px" type="text"> m
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input <input name="nivel11" id="nivel11" value="<%=constru.nivel[0][0]%>" style="height: 23px; width: 60px" type="text"> m A:  <input name="nivel12" id="nivel12" value="<%=constru.nivel[0][1]%>" style="height: 23px; width: 60px" type="text"> m
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input <input name="perf21" id="perf21" value="<%=constru.perf[1][0]%>" style="height: 23px; width: 60px" type="text"> m A:  <input name="perf22" id="perf22" value="<%=constru.perf[1][1]%>" style="height: 23px; width: 60px" type="text"> m
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input <input name="entrada21" id="entrada21" value="<%=constru.entrada[1][0]%>" style="height: 23px; width: 60px" type="text"> m A:  <input name="entrada22" id="entrada22" value="<%=constru.entrada[1][1]%>" style="height: 23px; width: 60px" type="text"> m
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input <input name="nivel21" id="nivel21" value="<%=constru.nivel[1][0]%>" style="height: 23px; width: 60px" type="text"> m A:  <input name="nivel22" id="nivel22" value="<%=constru.nivel[1][1]%>" style="height: 23px; width: 60px" type="text"> m
	</td>	
</tr>
</TABLE>

<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">

<tr>
	<td colspan=3 style="text-align:center; font-family:Arial; background-image: url(filete_cor_const.jpg); font-size:15px; font-weight: bold;">REVESTIMENTO</td>
</tr>

<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TIPO:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DI�METRO:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PROFUNDIDADE:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="rev_tipo1" id="rev_tipo1" value="<%=constru.rev_tipo[0]%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="rev_diam1" id="rev_diam1" value="<%=constru.rev_diam[0]%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input name="rev_prof11" id="rev_prof11" value="<%=constru.rev_prof[0][0]%>" style="height: 23px; width: 60px" type="text"> A:  <input name="rev_prof12" id="rev_prof12" value="<%=constru.rev_prof[0][1]%>" style="height: 23px; width: 60px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="rev_tipo2" id="rev_tipo2" value="<%=constru.rev_tipo[1]%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="rev_diam2" id="rev_diam2" value="<%=constru.rev_diam[1]%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input name="rev_prof21" id="rev_prof21" value="<%=constru.rev_prof[1][0]%>" style="height: 23px; width: 60px" type="text"> A:  <input name="rev_prof22" id="rev_prof22" value="<%=constru.rev_prof[1][1]%>" style="height: 23px; width: 60px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="rev_tipo3" id="rev_tipo3" value="<%=constru.rev_tipo[2]%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="rev_diam3" id="rev_diam3" value="<%=constru.rev_diam[2]%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input name="rev_prof31" id="rev_prof31" value="<%=constru.rev_prof[2][0]%>" style="height: 23px; width: 60px" type="text"> A:  <input name="rev_prof32" id="rev_prof32" value="<%=constru.rev_prof[2][1]%>" style="height: 23px; width: 60px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TIPO DE FILTROS:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DI�METRO:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PROFUNDIDADE:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input style="height: 23px; width: 60px" type="text"> A:  <input style="height: 23px; width: 60px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input style="height: 23px; width: 60px" type="text"> A:  <input style="height: 23px; width: 60px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input style="height: 23px; width: 60px" type="text"> A:  <input style="height: 23px; width: 60px" type="text">
	</td>	
</tr>

<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">�REA SEC��O FILTRANTE:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">ABERTURA:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">OBSERVA��ES:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
</tr>

<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TIPO DE PR�-FILTRO:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">GRANULOMETRIA:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PROFUNDIDADE:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input style="height: 23px; width: 60px" type="text"> A:  <input style="height: 23px; width: 60px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input style="height: 23px; width: 60px" type="text"> A:  <input style="height: 23px; width: 60px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input style="height: 23px; width: 60px" type="text"> A:  <input style="height: 23px; width: 60px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DESENVOLVIMENTO COM:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TEMPO:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PROFUNDIDADE:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input style="height: 23px; width: 60px" type="text"> A:  <input style="height: 23px; width: 60px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input style="height: 23px; width: 60px" type="text"> A:  <input style="height: 23px; width: 60px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		DE: <input style="height: 23px; width: 60px" type="text"> A:  <input style="height: 23px; width: 60px" type="text">
	</td>	
</tr>





<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=3 style="text-align:center; font-family:Arial; background-image: url(filete_cor_const.jpg); font-size:15px; font-weight: bold;">ACABAMENTO</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TUBO SANIT�RIO:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TIPO:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DI�METRO:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">CIMENTA��O:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DI�METRO:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PROFUNDIDADE:</td>
</tr>
	<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">LAJE DE PROTE��O-DIMENS�ES:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">COTA:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PER�METRO DE PROTE��O:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>	
</tr>

</TABLE>

<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=3 style="text-align:center; font-family:Arial; background-image: url(filete_cor_const.jpg); font-size:15px; font-weight: bold;">TESTE DE VAZ�O</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TIPO (norma,produ��o,outros):</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">IN�CIO/T�RMINO:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">SISTEMA DE BOMBEAMENTO:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">M�TODO DE LEITURA DO N�VEL:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">M�TODO DE CONTROLE DE VAZ�O:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PROFUNDIDADE DE BOMBEAMENTO:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 190px" type="text"> m
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TEMPO DE BOMBEAMENTO:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">NE:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">ND:</td>
</tr>

<tr style="height: 23px;">
    <td rowspan=2 style="height: 60px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 195px" type="text"> (h)
	</td>
    <td rowspan=2 style="height: 60px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 195px" type="text"> (m)
	</td>	
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;"> ( &nbsp&nbsp )  estabilizado &nbsp&nbsp&nbsp&nbsp&nbsp
		<input style="height: 23px; width: 50px" type="text"> m
	</td>	
</tr>
<tr>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;"> ( &nbsp&nbsp )  crivo da bomba
		<input style="height: 23px; width: 50px" type="text"> m
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">RECUPERA��O:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">RECUPERA��O:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">RECUPERA��O:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 180px" type="text"> (h)
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 180px" type="text"> (m)
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 180px" type="text"> (%)
	</td>

	</td>	
</tr>

<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">VOLUME BOMBEADO:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">VAZ�O FINAL:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">VAZ�O M�DIA:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 180px" type="text"> (m�)
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 180px" type="text"> (m�/h)
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 180px" type="text"> (m�/h)
	</td>

	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">CAPACIDADE ESPEC�FICA MEDIDA:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">CAPACIDADE ESPEC�FICA CALCULADA:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_const.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TRANSMISSIVIDADE:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 180px" type="text"> (m�/h/m)
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 180px" type="text"> (m�/h/m)
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input style="height: 23px; width: 180px" type="text"> (m�/s)
	</td>

	</td>	
</tr>
</table>
<br>
<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
   <td style="height: 140px; width: 705px; font-size: 12px; font-family: Arial; font-weight: bold;"> 
		<input style="height: 140px; width: 705px; text-align:" type="text" value=" OBSERVA��ES:">   
   </td>
</tr>
</table>
<br>
<br>
<table border=0 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
   <td style="height: 23px; width: 710px; text-align:center; font-size: 12px; font-family: Arial; font-weight: bold;"> 
		<input style="height: 26px; width: 100px; text-align:center;" type="submit" value="Atualizar">   
   </td>
</tr>
</table>



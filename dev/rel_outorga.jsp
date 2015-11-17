
<%@ page  import="java.util.Calendar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Relatório de Outorga</title>
</head>
<%
	HttpSession sessao = request.getSession(true);  
	String user = (String) request.getSession().getAttribute("tnome");
	int id_empresa = (Integer) request.getSession().getAttribute("id_empresa");
	String empresa = (String) request.getSession().getAttribute("empresa");
	String pocoName = (String) request.getSession().getAttribute("pocoNumber");	
	sessao.setAttribute("pocoName",pocoName);
	
	String logo = "logo_cliente.jpg";
	if(id_empresa==1) {
		logo = "juper_logo.jpg";
	}
	if(id_empresa==7) {
		logo = "internacional.jpg";
	}
    if(user==null) {
	    user = "Anônimo";
    }
	
	java.util.Calendar cal = Calendar.getInstance();
	int monthInt = cal.get(Calendar.MONTH)+1;
	String monthStr = ""+monthInt;
	if (monthInt < 10)
		monthStr = "0"+monthStr;
	 String data = cal.get(Calendar.DAY_OF_MONTH) + "/" + monthStr + "/" + cal.get(Calendar.YEAR);
	
%>

<body style="margin: 10px;" bgcolor="">

<form name="myForm" method="post">
<table border=0 cellpadding="0" cellspacing="0" style="margin-left: 10px;">
<tr>
    <td style="height: 83px; width: 182px;"> <img style="width: 182px; height: 83px;" alt="" src="logo_juper_relatorio.jpg"> </td>
	<td style="padding-left: 320px; height: 75px; width: 115px;">
		<img style="width: 182px; height: 83px;" alt="" src="<%=logo%>"> 
	</td>	
</tr>
</table>
<br>
<table style="margin-left: 240px;">
	<tr> <td> <font style="font-size: 16px; font-weight:bold; color:#101010; font-family: Arial;">RELATÓRIO DE OUTORGA</font></td></tr>
</table>

<table>
	
	<tr> 
	    <td> <font style="font-size:12px; font-weight:bold; color:#101010; font-family: Arial;"> EMPRESA: <input style="height: 25px; width: 625px" value="<%=empresa%>" type="text"> </td>
	</tr>
	<tr> 
		<td> <font style="font-size:12px; font-weight:bold; color:#101010; font-family: Arial;"> DATA: <input style="height: 25px; width: 175px; text-align:right;" value="<%=data%>" type="text"> 
			 <font style="font-size:12px; font-weight:bold; color:#101010; font-family: Arial;"> &nbsp POÇO: <input style="height: 25px; width: 175px; text-align:right;" value="<%=pocoName%>"type="text"> 
			 <font style="font-size:12px; font-weight:bold; color:#101010; font-family: Arial;"> &nbsp OUTORGA: <input style="height: 25px; width: 175px; text-align:right;" type="text"> 
		</td>
	</tr>
	</font>
</table>
<br>

<font style="font-size: 13px; font-weight:bold; color:#101010; font-family: Arial;">QUADRO DE AVALIAÇÃO DE GESTÃO</font>

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
<tr> 
	<td style="height: 38px; width: 220px; background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>PARÂMETRO</td>
	<td style="width: 115px; background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>MÉDIA DIÁRIA</td>
	<td style="width: 140px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>SEMANA ANTERIOR</td>
	<td style="width: 90px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>MENSAL</td>
	<td style="width: 120px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>MÊS ANTERIOR</td>
</tr>

<tr>
	<td style="height: 38px; width: 160px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Volume Explotado</td>
	<td style="width: 90px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 120px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 60px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 80px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
</tr>
<tr>
	<td style="height: 38px; width: 160px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Volume Explotado / Volume Outorgado</td>
	<td style="width: 90px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 120px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 60px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 80px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
</tr>
<tr>
	<td style="height: 38px; width: 160px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Vazão Média</td>
	<td style="width: 90px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 120px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 60px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 80px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
</tr>
<tr>
	<td style="height: 38px; width: 160px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Vazão Média / Vazão Outorgado</td>
	<td style="width: 90px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 120px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 60px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 80px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
</tr>
<tr>
	<td style="height: 38px; width: 160px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Nível Mínimo</td>
	<td style="width: 90px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 120px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 60px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 80px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
</tr>
<tr>
	<td style="height: 38px; width: 160px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Nível Máximo</td>
	<td style="width: 90px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 120px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 60px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
	<td style="width: 80px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
</tr>
</table>

<br>

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse;" bordercolor="#e3e3e3">
<tr>
	<td style="height: 33px; width: 685px; background-image:url('filete_img_parecer.png'); font-size: 13px; text-align: center; color: #101010; font-weight:bold; font-family: Arial;">PARECER EVOLUÇÃO PARÂMETROS QUALITATIVOS</td>
</tr>
<tr>
	<td style="height: 150px; width: 685px; font-size: 9px; text-align: center; color: #101010; font-family: Arial;"> </td>
</tr>
</table>

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse;" bordercolor="#e3e3e3">
<tr>
	<td style="height: 33px; width: 685px; background-image:url('filete_img_parecer.png'); font-size: 13px; text-align: center; color: #101010; font-weight:bold; font-family: Arial;">PARECER ANÁLISE PARÂMETROS HIDROGEOLÓGICOS</td>
</tr>
<tr>
	<td style="height: 150px; width: 685px; font-size: 9px; text-align: center; color: #101010; font-family: Arial;"> </td>
</tr>
</table>
<br>
<font style="font-size: 9px; color:#101010; margin-left: 50px; font-family: Arial;">Assinatura do Responsável:</font>

<table border=0 cellpadding="0" cellspacing="0" style="">
<tr>
    <td style="height: 32px; width: 327px;"> <img style="width: 327px; height: 32px;" alt="" src="assinatura.jpg"> </td>
	<td style="padding-left: 280px; height: 75px; width: 115px;">
		<img style="width: 74px; height: 46px;" alt="" src="assinatura_juper.jpg"> 
	</td>	
</tr>
</table>


</body>
</html>
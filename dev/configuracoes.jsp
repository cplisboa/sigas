<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Configurações</title>
</head>

<body style="margin: 0px;" bgcolor="">
<form name="myForm" method="post">

<%
  String gestaoType = request.getParameter("gestao");
  if (gestaoType==null){
	  gestaoType="diario";
  }
%>
<br> 
<table cellpadding="3" cellspacing="2" style="margin-left: 10px;">
<tr>
    <% if (gestaoType.equals("diario")) {%>
           <td><input name="gestao" src="bt_diario_down.png"  onclick=document.myForm.gestao.value="diario"; value="diario" height="32" type="image" width="67"></td>	    	                             
    <% } else { %>
	    <td><input name="gestao" src="bt_diario_up.png"  onclick=document.myForm.gestao.value="diario"; value="diario" height="32" type="image" width="67"></td>	    
    <% } %>	                       

    <% if (gestaoType.equals("mensal")) {%>
   		<td><input name="gestao" src="bt_mensal_down.png"  onclick=document.myForm.gestao.value="mensal"; value="mensal" height="32" type="image" width="67"></td>	    
    <% } else { %>
	    <td><input name="gestao" src="bt_mensal_up.png"  onclick=document.myForm.gestao.value="mensal"; value="mensal" height="32" type="image" width="67"></td>	    
    <% } %>	                       

    <% if (gestaoType.equals("gestao")) {%>
	    <td><input name="gestao" src="bt_gestao_down.png"  onclick=document.myForm.gestao.value="gestao"; value="gestao" height="32" type="image" width="67"></td>	    
    <% } else { %>
	    <td><input name="gestao" src="bt_gestao_up.png"  onclick=document.myForm.gestao.value="gestao"; value="gestao" height="32" type="image" width="67"></td>
    <% } %>	                       

    <% if (gestaoType.equals("resumos")) {%>
	    <td><input name="gestao" src="bt_resumos_down.png"  onclick=document.myForm.gestao.value="resumos"; value="resumos" height="32" type="image" width="78"></td>
    <% } else { %>
	    <td><input name="gestao" src="bt_resumos_up.png"  onclick=document.myForm.gestao.value="resumos"; value="resumos" height="32" type="image" width="78"></td>
    <% } %>
</tr>
</table>
<img style="width: 654px; height: 2px;" alt="" src="linha_separacao.png">		
<br><br>

<% if (gestaoType.equals("diario")) {%>
  <font style="font-size: 16px; font-weight: bold; text-align: center; color: rgb(16, 16, 16); font-family: Arial; margin-left: 10px;">Painel de Avisos</font><br>
  <br>
  <table style="margin-left: 10px;" border="1" cellpadding="0" cellspacing="0">
    <tbody>
      <tr>
        <td style="height: 38px; width: 272px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">ITEM</td>
        <td style="width: 120px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">DIRETORIA</td>
        <td style="width: 160px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">SUPERINTENDENTE</td>
        <td style="width: 110px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">GERENTE</td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha01.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">Volume
inferior ao padr&atilde;o</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">Volume
superior ao projetado</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha01.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">Volume
superior ao outorgado</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">aus&ecirc;ncia
de corrente el&eacute;trica</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td
 style="height: 38px; width: 200px; background-image: url(linha01.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">Tempo
de bombeamento &gt; Jornada projetada</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">N.M&aacute;x
&gt; ND</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">Aus&ecirc;ncia
de Dados Microbiol&oacute;gicos</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="font-family: Arial; height: 38px; background-image: url(linha02.jpg);"><small>Dados microbiol&oacute;gicos fora do padr&atilde;o</small></td>
        <td style="height: 38px; background-image: url(linha02.jpg);"></td>
        <td style="height: 38px; background-image: url(linha02.jpg);"></td>
        <td style="height: 38px; background-image: url(linha02.jpg);"></td>
      </tr>
      <tr>
        <td style="font-family: Arial; height: 38px;background-image: url(linha01.jpg);"><small>Par&acirc;metros
f&iacute;sico-qu&iacute;micos fora do padr&atilde;o</small></td>
        <td style="height: 38px; background-image: url(linha01.jpg);"></td>
        <td style="height: 38px; background-image: url(linha01.jpg);"></td>
        <td style="height: 38px; background-image: url(linha01.jpg);"></td>
      </tr>
      <tr>
        <td style="font-family: Arial; height: 38px; background-image: url(linha02.jpg);"><small>Demanda
&gt; volume bombeado</small></td>
        <td style="height: 38px; background-image: url(linha02.jpg);"></td>
        <td style="height: 38px; background-image: url(linha02.jpg);"></td>
        <td style="height: 38px; background-image: url(linha02.jpg);"></td>
      </tr>
      <tr>
        <td style="font-family: Arial; height: 38px; background-image: url(linha01.jpg);"><small>Vaz&atilde;o
inferior &agrave; m&eacute;dia</small></td>
        <td style="height: 38px; background-image: url(linha01.jpg);"></td>
        <td style="height: 38px; background-image: url(linha01.jpg);"></td>
        <td style="height: 38px; background-image: url(linha01.jpg);"></td>
      </tr>
    </tbody>
  </table>
  <br>
  <% } %>
  
<% if (gestaoType.equals("mensal")) {%>  
  <font style="font-size: 16px; text-align: center; color: rgb(16, 16, 16); font-weight: bold; font-family: Arial; margin-left: 10px;">Quadro
de Avisos Di&aacute;rio</font><br>
  <br>
  <table style="margin-left: 10px;" border="1" cellpadding="0" cellspacing="0">
    <tbody>
      <tr>
        <td ROWSPAN=2 style="height: 38px; width: 272px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">ITEM</td>
        <td COLSPAN=3 style="width: 120px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">CRITÉRIO DE AVALIAÇÃO</td>
     </tr>
     <tr>
        <td style="width: 160px; background-image: url(filete_cinza.jpg); font-size: 12px; text-align: center; color: rgb(16, 16, 16); font-family: Arial; font-weight: bold;"
 align="center">%</td>
        <td style="width: 110px; background-image: url(filete_cinza.jpg); font-size: 12px; text-align: center; color: rgb(16, 16, 16); font-family: Arial; font-weight: bold;"
 align="center">TEMPO</td>
        <td style="width: 134px; background-image: url(filete_cinza.jpg); font-size: 12px; text-align: center; color: rgb(16, 16, 16); font-family: Arial; font-weight: bold;"
 align="center">VALOR</td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha01.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VOLUME
EXPLOTADO</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VOLUME
EXPLOTADO / VOLUME OUTORGADO</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha01.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VAZ&Atilde;O
M&Eacute;DIA</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VAZ&Atilde;O
M&Eacute;DIA / VAZ&Atilde;O OUTORGADA</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha01.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">N&Iacute;VEL
M&Iacute;NIMO</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">N&Iacute;VEL
M&Aacute;XIMO</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VOLUME
EXPLOTADO / VOLUME OUTORGADO</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
    </tbody>
  </table>
  <br>
    <% } %>
    
    
    <% if (gestaoType.equals("gestao")) {%>  
  <font style="font-size: 16px; text-align: center; color: rgb(16, 16, 16); font-family: Arial; margin-left: 10px;">Quadro
de Avalia&ccedil;&atilde;o de Gest&atilde;o</font><br>
  <br>
  <table style="margin-left: 10px;" border="1" cellpadding="0"  cellspacing="0">
    <tbody>
      <tr>
        <td style="height: 38px; width: 272px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">PAR&Acirc;METRO</td>
        <td style="width: 120px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">M&Eacute;DIA DI&Aacute;RIA</td>
        <td style="width: 160px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">SEMANA ANTERIOR</td>
        <td style="width: 110px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">MENSAL</td>
        <td style="width: 134px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">M&Ecirc;S ANTERIOR</td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha01.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VOLUME
EXPLOTADO</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VOLUME
EXPLOTADO / VOLUME OUTORGADO</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha01.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VAZ&Atilde;O
M&Eacute;DIA</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VAZ&Atilde;O
M&Eacute;DIA / VAZ&Atilde;O OUTORGADA</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha01.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">N&Iacute;VEL
M&Iacute;NIMO</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">N&Iacute;VEL
M&Aacute;XIMO</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VOLUME
EXPLOTADO / VOLUME OUTORGADO</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
    </tbody>
  </table>
    <% } %>
      <% if (gestaoType.equals("resumos")) {%>  
  <font style="font-size: 16px; text-align: center; color: rgb(16, 16, 16); font-family: Arial; margin-left: 10px;">Quadro
de Avalia&ccedil;&atilde;o de Gest&atilde;o</font><br>
  <br>
  <table style="margin-left: 10px;" border="1" cellpadding="0"  cellspacing="0">
    <tbody>
      <tr>
        <td style="height: 38px; width: 272px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">PAR&Acirc;METRO</td>
        <td style="width: 120px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">M&Eacute;DIA DI&Aacute;RIA</td>
        <td style="width: 160px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">SEMANA ANTERIOR</td>
        <td style="width: 110px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">MENSAL</td>
        <td style="width: 134px; background-image: url(azul_barra.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial; font-weight: bold;"
 align="center">M&Ecirc;S ANTERIOR</td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha01.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VOLUME
EXPLOTADO</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VOLUME
EXPLOTADO / VOLUME OUTORGADO</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha01.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VAZ&Atilde;O
M&Eacute;DIA</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VAZ&Atilde;O
M&Eacute;DIA / VAZ&Atilde;O OUTORGADA</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha01.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">N&Iacute;VEL
M&Iacute;NIMO</td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha01.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">N&Iacute;VEL
M&Aacute;XIMO</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
      <tr>
        <td style="height: 38px; width: 200px; background-image: url(linha02.jpg); font-size: 12px; text-align: left; color: rgb(16, 16, 16); font-family: Arial;">VOLUME
EXPLOTADO / VOLUME OUTORGADO</td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
        <td style="width: 50px; background-image: url(linha02.jpg); font-size: 12px; text-align: center; color: rgb(250, 250, 252); font-family: Arial;"
 align="center"></td>
      </tr>
    </tbody>
  </table>
  <br>
    <% } %>
  <br>
</form>
</body>
</html>

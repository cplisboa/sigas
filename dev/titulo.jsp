<html>
<head>
	<script>
		function reset(){			
		}
		
		function openHome(){
			document.forms["titleForm"].submit();							
		}
		
	
	</script>
</head>
<% 
	String user = (String) request.getSession().getAttribute("tnome");
	String acesso = (String) request.getSession().getAttribute("acesso");

	int id_empresa = (Integer) request.getSession().getAttribute("id_empresa");
	String logo = "logo_cliente.jpg";
	if(id_empresa==1) {
		logo = "juper_logo.jpg";
	}
	if(id_empresa==7) {
		logo = "internacional.jpg";
	}
	if(id_empresa==11) {
		logo = "prodesas.png";
	}	
    if(user==null) {
	    user = "Anônimo";
    }
%>

<body style="margin-bottom: 0px;" background="background2.png" bgcolor="#e4e4e3">
<form name="firstForm" style="margin-bottom: 0px;" name=myForm method="POST">
                
<table cellpadding="0" cellspacing="0">
<tr>
    <td style="width: 216px;"> <input type="image" src="logo.jpg" "window.location('tabela_mensal.html');return false;" value="submit" width="180" height="76"> </td>
    <td style="width: 760px; vertical-align: bottom;"> <input type="image" src="sistema_integrado.jpg" value="submit" width="402" height="20"> </td>
    <td> <input type="image" src="<%=logo%>" onClick="window.open('tabela_mensal.html')" value="submit" width="105" height="65"> </td>
</tr>
</table>
</form>
<form name="titleForm" style="height: 18px;" method="POST" target="principal" action="mensal.jsp">	
<table cellpadding="0" cellspacing="0" >
<tr>
	<td style="width: 70px; height: 30px; vertical-align: bottom;"> <input type="image" vspace="5" onClick="window.location.href='processa_reset.jsp'" src="bt_home_cima.png" value="submit" width="54" height="14"></td>
	<td style="vertical-align: center; height: 30px;"><input type="image" src="bt_ajuda_cima.png" onClick="window.location.href='tabela_mensal.html'" value="submit" width="57" height="18"></td>
	<td style="width: 952px; height: 30px; vertical-align: center; text-align: right;"> 	
	<a target="_top" href="login4.html" style="font-family:arial; font-size:12px;" onclick="reset()"> Logout &nbsp <%=user%> com permissão de <%=acesso%> </a>
	</td>	
</tr>
</table>      
</form>

</body>
</noframes>
</FRAMESET>
</html>
<%@ page  import="java.util.Calendar" %>
<%@ page  import="sigas.*" %>
<%@ page  import="java.sql.Timestamp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/bootstrap-theme.css" rel="stylesheet" />	
	
	<script>
		setManutencao = function(manut){
			document.getElementById("pocoManut").value = manut;
			document.getElementById("acaoManut").value = "1";
			document.forms["formManut"].submit();					
		}
		
		delManutencao = function(manut){
			document.getElementById("pocoManut").value = manut;
			document.getElementById("acaoManut").value = "0";
			document.forms["formManut"].submit();					
		}

	</script>
</head>
<body>

<%
	DataRequester dr = new DataRequester("jdbc:firebirdsql:localhost/3050:C:/juper/old_site/SIGAS.GDB");
	HttpSession sessao = request.getSession(true);  
	String countSistema =(String) sessao.getAttribute("countSistema");
	String acesso = (String) sessao.getAttribute("acesso");
	String user = (String) sessao.getAttribute("tnome");
	String code = request.getParameter("code");
	
	if (code == null) {
		code = (String) request.getSession().getAttribute("code");
	}
	//out.println("Code em Mural JSP:" + code + "<br>");
	sessao.setAttribute("code",code);
	
	int idSistema=-1;
	boolean systemSelected=false;
    if ((countSistema!=null) && (!countSistema.equals(""))) {
		int cont = Integer.parseInt(countSistema);
		systemSelected=true;
		int id_empresa = (Integer) sessao.getAttribute("id_empresa");
		Sistema[] sysList = dr.getSistemas(id_empresa);
		idSistema = sysList[cont].getId_sistema();				
	}
	
	 String data = request.getParameter("dataText");
	 if(data==null) {
	 		  java.util.Calendar cal = Calendar.getInstance();
	 		  int monthInt = cal.get(Calendar.MONTH)+1;
	 		  String monthStr = ""+monthInt;
	 		  if (monthInt < 10)
	 			  monthStr = "0"+monthStr;
	 		  data = cal.get(Calendar.DAY_OF_MONTH) + "/" + monthStr + "/" + cal.get(Calendar.YEAR);
	 } 	 
%>

	<table style="border-collapse: collapse; text-align: left; margin-left: 10px; width: 700px; height: 15px;" border="1" cellpadding="0" cellspacing="0">	
    <tbody>
      <tr>
	      <td style="background-image:url('tile_painel_avisos.png'); text-align: center; font-family: Arial; font-size: 14px; font-weight: bold; height: 23px; width: 600px;">PAINEL DE AVISOS</td>
	    </tr>
	    <tr>
			<% if(systemSelected) { %>	
				<td style="color:#FF7F00; font-size: 14px; font-family: Arial; font-weight: bold;"> Selecione poço no menu lateral para visualizar controle on-line. </td>				
			<% } else { %>	
				<td style="color: rgb(0, 40, 240); font-size: 14px; font-family: Arial; font-weight: bold;"> Nenhum sistema selecionado. Selecione o Sistema no menu ao lado. </td>				
			<% } %>
	    </tr>
		<tr>
		 <td style="height: 27"></td>
		</tr>
		
		<%
		//Impressao dos poços e informações a respeito
		 if(systemSelected) {
			StatusPoco[] status = dr.pocosOnline(idSistema);
	        //out.println("-----  Poço: "+status[i].poco.getName()+ " operacao: "+status[i].isOperating + " Status: "+status[i].unknownState+"<br>"); %>
			<form name="formManut" id="formManut" action="processa_manutencao.jsp" method="POST">
				<input type="hidden" id="pocoManut" name="pocoManut" value="inicio">
				<input type="hidden" id="acaoManut" name="acaoManut" value="0">
				
				<% for(int i=0; i<status.length; i++) { %>								
					<tr>
						<td style="color: rgb(0, 40, 240); font-size: 14px; font-family: Arial; font-weight: bold; height: 27">
							<div>
								Poço <%=status[i].poco.getName()%>: <%=status[i].getFrase()%>
								<% // Se o usuário for o SIGAS e poço não está em manutenção. Disponibilizar botão para colocar em manutenção.
								if (user.equals("SIGAS") && !status[i].hasManutencao) { %>
									<input type="button" id="btnSave" name="btnSave" class="btn btn-success pull-right" onclick="setManutencao('<%=status[i].poco.getCode()%>')" value="Colocar em manutenção">									
									
								<% } else if (user.equals("SIGAS") && status[i].hasManutencao) { %>
									<input type="button" id="btnSave"   name="btnSave" class="btn btn-danger pull-right" onclick="delManutencao('<%=status[i].poco.getCode()%>')" value="Remover da manutenção">
								<% } %>
							</div>
						</td>
					</tr>
				<%} %>
			</form>
			<% if (status.length==0) {%>
				<tr><td style="color: rgb(220, 20, 10); font-size: 14px; font-family: Arial; font-weight: bold;"> Nenhum poço cadastrado nesse sistema </td></tr>				
			<% }
		 }
		 for(int i=0; i<8; i++) { %>
			<tr>
				<td style="height: 27"></td>
			</tr>	    		 
		 <% } %>		 
	  </tbody>
	</table>
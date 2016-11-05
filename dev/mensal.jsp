<%@ page  import="java.sql.*" %>
<%@ page  import="java.text.*" %>
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>

<%@ page  import="sigas.*" %>
<%@ page  import="java.util.Calendar" %>
<%@ page  import="java.util.Locale" %>
<%@ page  import="java.util.StringTokenizer" %>

<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.axis.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import="org.jfree.chart.labels.*" %>
<%@ page  import="org.jfree.chart.plot.*" %>
<%@ page  import="org.jfree.chart.renderer.category.*" %>
<%@ page  import="org.jfree.chart.urls.*" %>
<%@ page  import="org.jfree.chart.plot.XYPlot" %>
<%@ page  import="org.jfree.data.category.*" %>
<%@ page  import="org.jfree.data.general.*" %>
<%@ page  import="org.jfree.data.xy.XYDataset.*" %>

<%@ page  import="org.jfree.chart.renderer.xy.DefaultXYItemRenderer.*" %>
<%@ page  import="org.jfree.chart.renderer.xy.*" %>
<%@ page  import="org.jfree.ui.ApplicationFrame.*" %>
<%@ page  import="org.jfree.ui.RectangleInsets.*" %>
<%@ page  import="org.jfree.ui.RefineryUtilities.*" %>
<%@ page  import="org.jfree.chart.ChartFactory" %>
<%@ page  import="org.jfree.chart.ChartPanel" %>
<%@ page  import="org.jfree.chart.JFreeChart" %>
<%@ page  import="org.jfree.chart.axis.DateAxis" %>
<%@ page  import="org.jfree.data.time.Hour" %>
<%@ page  import="org.jfree.data.time.Minute" %>
<%@ page  import="org.jfree.chart.renderer.xy.XYItemRenderer" %> 
<%@ page  import="org.jfree.chart.renderer.xy.XYLineAndShapeRenderer" %> 
<%@ page  import="org.jfree.data.time.Month" %>
<%@ page  import="org.jfree.data.time.Day" %>
<%@ page  import="org.jfree.data.time.TimeSeries" %>
<%@ page  import="org.jfree.data.time.TimeSeriesCollection" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>

<script type="text/javascript" src="selecionador.js"></script>

<!-- Odometr includes -->

<link rel="stylesheet" href="http://github.hubspot.com/odometer/themes/odometer-theme-car.css" />
<script src="odometer.min.js"></script>

<link rel="stylesheet" type="text/css" href="extjs.vs/resources/css/ext-all.css"/>
<script>
    function showCalendar() {
		displayDatePicker('dataText', false, 'dmy', '/');	
	}
	
	function presubmit() {
		//alert("pre-submit");		
		//document.getElementById("opcao").value = "nivel";		

		
	}
	
	function saveus() 	{
		alert("teste");     
		document.myForm.submit();
	}
	
</script>


<style>
body {
	font-family: Verdana, Tahoma, Arial, Helvetica, sans-serif;
	font-size: .8em;
	}

/* the div that holds the date picker calendar */
.dpDiv {
	}


/* the table (within the div) that holds the date picker calendar */
.dpTable {
	font-family: Tahoma, Arial, Helvetica, sans-serif;
	font-size: 12px;
	text-align: center;
	color: #505050;	
	background-color: #ece9d8;
	border: 1px solid #AAAAAA;
	}


/* a table row that holds date numbers (either blank or 1-31) */
.dpTR {
	}


/* the top table row that holds the month, year, and forward/backward buttons */
.dpTitleTR {
	}


/* the second table row, that holds the names of days of the week (Mo, Tu, We, etc.) */
.dpDayTR {
	}


/* the bottom table row, that has the "This Month" and "Close" buttons */
.dpTodayButtonTR {
	}


/* a table cell that holds a date number (either blank or 1-31) */
.dpTD {
	border: 1px solid #ece9d8;
	}


/* a table cell that holds a highlighted day (usually either today's date or the current date field value) */
.dpDayHighlightTD {
	background-color: #CCCCCC;
	border: 1px solid #AAAAAA;
	}


/* the date number table cell that the mouse pointer is currently over (you can use contrasting colors to make it apparent which cell is being hovered over) */
.dpTDHover {
	background-color: #aca998;
	border: 1px solid #888888;
	cursor: pointer;
	color: red;
	}


/* the table cell that holds the name of the month and the year */
.dpTitleTD {
	}


/* a table cell that holds one of the forward/backward buttons */
.dpButtonTD {
	}


/* the table cell that holds the "This Month" or "Close" button at the bottom */
.dpTodayButtonTD {
	}


/* a table cell that holds the names of days of the week (Mo, Tu, We, etc.) */
.dpDayTD {
	background-color: #CCCCCC;
	border: 1px solid #AAAAAA;
	color: white;
	}


/* additional style information for the text that indicates the month and year */
.dpTitleText {
	font-size: 12px;
	color: gray;
	font-weight: bold;
	}


/* additional style information for the cell that holds a highlighted day (usually either today's date or the current date field value) */ 
.dpDayHighlight {
	color: 4060ff;
	font-weight: bold;
	}


/* the forward/backward buttons at the top */
.dpButton {
	font-family: Verdana, Tahoma, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: gray;
	background: #d8e8ff;
	font-weight: bold;
	padding: 0px;
	}


/* the "This Month" and "Close" buttons at the bottom */
.dpTodayButton {
	font-family: Verdana, Tahoma, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: gray;
	background: #d8e8ff;
	font-weight: bold;
	}
  </style>
</head>

<!-- Inicio BODY -->
<body bgcolor="" style="margin-left: 0px; margin-top: 0px; margin-right: 0px;margin-bottom: 0px;">

<%
	Class.forName("org.firebirdsql.jdbc.FBDriver");    
	String url = "jdbc:firebirdsql:localhost/3050:c:/juper/old_site/SIGAS.GDB";
	HttpSession sessao = request.getSession(true);  
	String countSistema =(String) sessao.getAttribute("countSistema");
	//out.println(countSistema+"<br>");
	String code = request.getParameter("code");
	float hidro = 0;	
	Connection connection = null;
	Statement stmt = null;
	ResultSet rs = null;

	if (code == null) {
		code = (String) request.getSession().getAttribute("code");
	}
	sessao.setAttribute("code",code);

	boolean systemSelected=false;
    if ((countSistema!=null) && (!countSistema.equals(""))) {
		systemSelected=true;
	}

	
	boolean pocoSelected=false;
    if ((code!=null) && (!code.equals(""))) {
		pocoSelected=true;
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
<form name="myForm" method="post" action="mensal.jsp">

<%
int anoAnual = 0;
String tableType = request.getParameter("tableType");
String pocoName = request.getParameter("pocoName");
if(pocoName==null){
	pocoName="";
} else {
	//Setando pocoNAme na sessao
	sessao.setAttribute("pocoNumber",pocoName);
}

if(tableType==null){
	tableType="controle";
} else {
	
%>
	<input type="text" hidden="true" name="tableType" value="<%=tableType%>" />	
	<input type="text" hidden="true" name="gestao" value="<%=request.getParameter("gestao")%>" />	
	<input type="text" hidden="true" name="opcao" value="<%=request.getParameter("opcao")%>" />

<% 
}

%>
<!-- Table type = <%=tableType%> -->
<!-- CountSistema = <%=countSistema%><br> -->	
<!-- Code = <%=code%> <br> -->
<!-- PocoName <%=pocoName%><br> -->

<table style="text-align: left;" border="0" cellpadding="0" cellspacing="0">
  <tbody>
    <tr>
      <td style="height: 10px; margin-left: 0px; background-color: rgb(204, 204, 204); width: 6px;" colspan="12" rowspan="1"></td>
    </tr>
    <tr>
      <td style="width: 6px; height: 32px; background-color: rgb(204, 204, 204);"></td>
      
      <td style="height: 32px; width: 164px;">
	 <% if (tableType.equals("diaria")) {%>      
          <input name="tableType" onclick=document.myForm.tableType.value="diaria"; value="diaria" type="image" width=164 height=34;" src="bt_tab_diaria_down.jpg"></td>
	 <% } else { %>
          <input name="tableType" onclick=document.myForm.tableType.value="diaria"; value="diaria" type="image" width=164 height=34;" src="bt_tab_diaria.jpg"></td>		 		 
	 <% } %>	 
      <td style="height: 32px; background-color: rgb(204, 204, 204); width: 20px;"></td>
      
     <% if (tableType.equals("mensal")) {%>            
      	 <td style="height: 32px; width: 164px;"><input name="tableType" onclick=document.myForm.tableType.value="mensal"; value="mensal" type="image" width=164 height=34;" src="bt_tabela_down.jpg"></td>
 	 <% } else { %>
      	 <td style="height: 32px; width: 164px;"><input name="tableType" onclick=document.myForm.tableType.value="mensal"; value="mensal" type="image" width=164 height=34;" src="bt_tabela_up.jpg"></td>
	 <% } %>	 
      <th style="height: 32px; background-color: rgb(204, 204, 204); width: 20px;"></th>

     <% if (tableType.equals("anual")) {%>                  
          <td style="height: 32px; width: 161px;"><input name="tableType" onclick=document.myForm.tableType.value="anual"; value="anual" type="image" width=164 height=34;" src="bt_tabelaanual_down.jpg"></td>
 	 <% } else { %>
          <td style="height: 32px; width: 161px;"><input name="tableType" onclick=document.myForm.tableType.value="anual"; value="anual" type="image" width=164 height=34;" src="bt_tabelaanual_up.jpg"></td>      
	 <% } %>	       
      <td style="height: 32px; background-color: rgb(204, 204, 204); width: 20px;"></td>
      
     <% if (tableType.equals("graficos")) {%>                          
          <td style="height: 32px; width: 156px;"><input name="tableType" onclick=document.myForm.tableType.value="graficos"; value="graficos" type="image" width=164 height=34;" src="bt_graficos_down.jpg"></td>
 	 <% } else { %>
          <td style="height: 32px; width: 156px;"><input name="tableType" onclick=document.myForm.tableType.value="graficos"; value="graficos" type="image" width=164 height=34;" src="bt_graficos_up.jpg"></td>      
	 <% } %>	             
      <td style="height: 32px; background-color: rgb(204, 204, 204); width: 20px;"></td>
      
     <% if (tableType.equals("operacional")) {%>                               
          <td style="height: 32px; width: 181px;"><input name="tableType" onclick=document.myForm.tableType.value="operacional"; value="operacional" type="image" width=184 height=34;" src="bt_controle_down.jpg"></td>
 	 <% } else { %>
          <td style="height: 32px; width: 181px;"><input name="tableType" onclick=document.myForm.tableType.value="operacional"; value="operacional" type="image" width=184 height=34;" src="bt_controle_up.jpg"></td>
	 <% } %> 	                       
      <td style="height: 32px; background-color: rgb(204, 204, 204); width: 6px;"></td>      
      <th style="width: 234px; height: 32px; white-space: nowrap; background-color: rgb(204, 204, 204);"></th>
    </tr>
  </tbody>
</table>


<% if(tableType.equals("operacional")) {
	//Não foi selecionado sub-menu (tela principal)
	String gestaoType = request.getParameter("gestao");
	if (gestaoType==null) {
		gestaoType="diario";
	} %>
	<br> 
	<table cellpadding="3" cellspacing="2" style="border-collapse: collapse; margin-left: 10px;">
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
	
	<% if (gestaoType.equals("diario")) { %>		
		<font style="font-size: 16px; text-align: center; color: #101010; font-family: Arial; margin-left: 10px;">Quadro de Avisos Diário</font><br>
		<br>  
		
		<table border=1  cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-left: 10px;">
		<tr> 
		    <td style="height: 38px; width: 89px; background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>ITEM</td>
		    <td style="width: 89px; background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>STATUS</td>
		    <td style="width: 183px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>RESPONSÁVEL</td>
		    <td style="width: 183px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>FONE / EMAIL</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Volume inferior ao padrão</td>
		    <td style="background-image:url('verde.jpg')"></td>
		    <td style="width: 89px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 89px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 220px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Volume superior ao padrão</td>
		    <td style="background-image:url('vermelho.jpg')"></td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px;background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Volume superior ao outorgado</td>
		    <td style="background-image:url('vermelho.jpg')"></td>
		    <td style="background-image:url('linha01.jpg');">Test</td>
		    <td style="background-image:url('linha01.jpg');">Test</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Ausência de corrente elétrica*</td>
		    <td style="background-image:url('vermelho.jpg')"></td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Bombeamento > Jornada projetada</td>
		    <td style="background-image:url('vermelho.jpg')"></td>
		    <td style="background-image:url('linha01.jpg');">Test</td>
		    <td style="background-image:url('linha01.jpg');">Test</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">N.Máx > ND</td>
		    <td style="background-image:url('verde.jpg')"></td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Ausência de Dados Microbiológicos*</td>
		    <td style="background-image:url('vermelho.jpg')"></td>
		    <td style="background-image:url('linha01.jpg');">Test</td>
		    <td style="background-image:url('linha01.jpg');">Test</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">NÍVEL MÁXIMO</td>
		    <td style="background-image:url('vermelho.jpg')"></td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		</tr>		
		</table>
	<% } else if (gestaoType.equals("mensal")) { %>
		<font style="font-size: 16px; text-align: center; color: #101010; font-family: Arial; margin-left: 10px;">Quadro de Avisos Mensal</font><br>
		<br>  
		
		<table border=1  cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-left: 10px;">
		<tr> 
		    <td style="height: 38px; width: 89px; background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>ITEM</td>
		    <td style="width: 89px; background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>STATUS</td>
		    <td style="width: 183px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>RESPONSÁVEL</td>
		    <td style="width: 183px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>FONE / EMAIL</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Volume inferior ao padrão</td>
		    <td style="background-image:url('verde.jpg')"></td>
		    <td style="width: 89px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 89px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 220px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Volume superior ao padrão</td>
		    <td style="background-image:url('vermelho.jpg')"></td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px;background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Volume superior ao outorgado</td>
		    <td style="background-image:url('vermelho.jpg')"></td>
		    <td style="background-image:url('linha01.jpg');">Test</td>
		    <td style="background-image:url('linha01.jpg');">Test</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Ausência de corrente elétrica*</td>
		    <td style="background-image:url('vermelho.jpg')"></td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Bombeamento > Jornada projetada</td>
		    <td style="background-image:url('vermelho.jpg')"></td>
		    <td style="background-image:url('linha01.jpg');">Test</td>
		    <td style="background-image:url('linha01.jpg');">Test</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">N.Máx > ND</td>
		    <td style="background-image:url('verde.jpg')"></td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">Ausência de Dados Microbiológicos*</td>
		    <td style="background-image:url('vermelho.jpg')"></td>
		    <td style="background-image:url('linha01.jpg');">Test</td>
		    <td style="background-image:url('linha01.jpg');">Test</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 89px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">NÍVEL MÁXIMO</td>
		    <td style="background-image:url('vermelho.jpg')"></td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		    <td style="background-image:url('linha02.jpg');">Test</td>
		</tr>		
		</table>
	<% } else if (gestaoType.equals("gestao")) { %>
		<font style="font-size: 16px; text-align: center; color: #101010; font-family: Arial; margin-left: 10px;">Quadro de Avaliação de Gestão</font><br>
		<br>  
		
		<table border=1  cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-left: 10px;">
		<tr> 
		    <td style="height: 38px; width: 272px; background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>PARÂMETRO</td>
		    <td style="width: 120px; background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>MÉDIA DIÁRIA</td>
		    <td style="width: 160px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>SEMANA ANTERIOR</td>
		    <td style="width: 110px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>MENSAL</td>
		    <td style="width: 134px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>MÊS ANTERIOR</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">VOLUME EXPLOTADO</td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">VOLUME EXPLOTADO / VOLUME OUTORGADO</td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">VAZÃO MÉDIA</td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">VAZÃO MÉDIA / VAZÃO OUTORGADA</td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">NÍVEL MÍNIMO</td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">NÍVEL MÁXIMO</td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">VOLUME EXPLOTADO / VOLUME OUTORGADO</td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		</tr>
		
		</table>
	<% } else if (gestaoType.equals("resumos")) { %>
		<font style="font-size: 16px; text-align: center; color: #101010; font-family: Arial; margin-left: 10px;">Quadro de Resumos</font><br>
		<br>  
		
		<table border=1  cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-left: 10px;">
		<tr> 
		    <td style="height: 38px; width: 210px; background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>FREQUÊNCIA</td>
		    <td style="width: 94px; background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>N. MÍN</td>
		    <td style="width: 94px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>N. MÁX</td>
		    <td style="width: 94px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>VAZÃO</td>
		    <td style="width: 94px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>VOLUME</td>
		    <td style="width: 94px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>JORNADA</td>
		    <td style="width: 94px;background-image:url('azul_barra.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial; font-weight: bold;" align=center>DEMANDA</td>
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">FREQUÊNCIA</td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>		   		    
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">DIA</td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>		    
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>		    
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">DIA ANTERIOR</td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>		   		    
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">MÉDIA MENSAL</td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>		    
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>		    
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">MÉDIA MÊS ANTERIOR</td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>		   		    
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha02.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">MÉDIA ANUAL</td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>		    
		    <td style="width: 50px; background-image:url('linha02.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>		    
		</tr>
		<tr>
		    <td style="height: 38px; width: 200px; background-image:url('linha01.jpg'); font-size: 12px; text-align: left; color: #101010; font-family: Arial;">MÉDIA ANO ANTERIOR</td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>
		    <td style="width: 50px; background-image:url('linha01.jpg'); font-size: 12px; text-align: center; color: #fafafc; font-family: Arial;" align=center></td>		   		    
		</tr>		
		</table>		 	
	<% } %>
    
<%} else if(!tableType.equals("controle")){
	//Foi selecionado sub-menu
	%>    
	<br>
	<table cellspacing="0" cellpadding="1	" bgcolor="FFFFFF" style="margin-left: 10px;">
	  <tr>
		<td> <b style="margin-left: 10px;">Data:</b></td>
		<td> <input name="dataText" size="12" value=<%=data%> align="center"> </td>
		<td style="padding-left: 10px;"> <img src="calendar.png" onclick="showCalendar()" /> </td>
	    <td style="padding-left: 10px;"> <input type="submit" name="busca" id="busca" onclick="presubmit()" value="Busca" > </td>
		<td style="padding-left: 285px;"> <input name="salvar" src="salvar.png"  value="salvar" height="16" type="image" width="66"> </td>
		<td style="padding-left: 10px;"> <input name="imprimir" src="imprimir.png"  onclick="saveus();" value="imprimir" height="19" type="image" width="75"> </td>	  
	  </tr>
	</table>
	<br>
<%}

String botao = request.getParameter("opcao");

 Medida med = null;
 boolean isOperating=false;
 boolean unknownState=false;
 String frase = "";
 if (tableType.equals("controle")) {
    if (pocoSelected) {
		// Vou recuperar o ultimo dado inserdio para depois criar o HTML
		DataRequester dr = new DataRequester("jdbc:firebirdsql:localhost/3050:C:/juper/old_site/SIGAS.GDB");
		med = (Medida) dr.onlineData(code); 	

		//Recuperando dados de projeto que estão junto aos dados hidrogeológicos
		Hidrogeo hgeo = new Hidrogeo();
		hgeo = hgeo.fillHidrogeo(pocoName);
		if (med!=null) { 
			// Verificando se o poço está em operação
			if(med.getCorrente() > 0) {
				isOperating = true;
			}
			//Recupera informação de há quanto tempo não temos medidas do poço
			java.sql.Timestamp sqlTs = med.getTs();
			java.util.Date ts = (java.util.Date) sqlTs;
		
			Timestamp now = new Timestamp(System.currentTimeMillis());		
			long diff = now.getTime() - ts.getTime();     
    
			long difHoras = diff/1000/60/60;
			long difDias = diff/1000/60/60/24;
				
			if(difDias >= 1) {
				frase = "Poço sem leitura a "+difDias+" dia(s)";
				unknownState = true;
			} else if (difHoras  > 8) {
				frase = "Poço sem leitura a "+difHoras+" horas";			
				unknownState = true;
			}
		
			%>
			<br>
			<table style="border-collapse: collapse; text-align: left; margin-left: 10px; width: 700px; height: 19px;" border="0"
			 cellpadding="0" cellspacing="0">
			  <tbody>
				<tr>
				  <td></td>
				  <td></td>
				  <td></td>
				  <td></td>
				</tr>
				<tr>
				  <td style="width: 98px; height: 15px;"><img style="width: 132px; height: 13px;" src="tit_controle_operacional.png"></td>
				  <td style="width: 640px; height: 15px;"></td>

				  <td style="text-align: right; width: 127px; height: 15px;">
					  <input name="tableType" onclick="document.getElementById('pocoName').value = '<%=code%>';document.forms['myForm'].submit();" value="controle" type="image" style="width=97; height=26" src="bt_atualizar.png">
				  </td>
				</tr>
			  </tbody>
			</table>
			<br>
			<table style="border-collapse: collapse; font-family: Arial; font-size:12px; margin-left: 10px; text-align: center; background-color: rgb(255, 255, 255); width: 700px; height: 116px;" border="1" cellpadding="0" cellspacing="0">
			  <tbody>
				<tr>
				  <td style="width: 104px; color: rgb(255, 255, 255); background-image:url('azul_barra.jpg'); font-weight: bold;">STATUS</td>
				  <td style="width: 120px; color: rgb(255, 255, 255); background-image:url('azul_barra.jpg'); font-weight: bold;">PAR&Acirc;METROS</td>
				  <td style="width: 90x; color: rgb(255, 255, 255); background-image:url('azul_barra.jpg');  font-weight: bold;">CORRENTE<br>(A)</td>
				  <td style="width: 80x; color: rgb(255, 255, 255); background-image:url('azul_barra.jpg'); font-weight: bold;">N&Iacute;VEL<br>(m)</td>
				  <td style="width: 80px; color: rgb(255, 255, 255); background-image:url('azul_barra.jpg'); font-weight: bold;">VAZ&Atilde;O (m3/h)</td>
				  <td style="width: 90px; color: rgb(255, 255, 255); background-image:url('azul_barra.jpg'); font-weight: bold;">VOLUME<br>(m3)</td>
				  <td style="width: 90px; color: rgb(255, 255, 255); background-image:url('azul_barra.jpg'); font-weight: bold;">DEMANDA (m3)</td>
				</tr>
				<tr>
				  <% if (unknownState) { %>				
					   <td style="width: 104px; background-color: rgb(192, 192, 192); text-align: center;" colspan="1" rowspan="2"><img src ="bt_desconhecido.jpg"></td>				  								
				  <% } else if (isOperating) { %>
					   <td style="width: 104px; background-color: rgb(192, 192, 192); text-align: center;" colspan="1" rowspan="2"><img src ="bt_operacao.jpg"></td>				  
				  <% } else { %>
					   <td style="width: 104px; background-color: rgb(192, 192, 192); text-align: center;" colspan="1" rowspan="2"><img src ="bt_repouso.jpg"></td>				  
				  <% } %>
				  <td style="color: rgb(0, 40, 240); background-image:url('linha01.jpg'); font-size: 14px; font-family: Arial; height: 58px; font-weight: bold; text-align: center;">on-line</td>
				  <td style="color: rgb(0, 40, 240); background-image:url('linha01.jpg'); font-size: 14px; font-family: Arial; height: 58px; font-weight: bold; text-align: center;"><%=med.getCorrente()%></td>
				  <td style="color: rgb(0, 40, 240); background-image:url('linha01.jpg'); font-size: 14px; font-family: Arial; height: 58px; font-weight: bold; text-align: center;"><%=med.getNivel()%></td>
				  <td style="color: rgb(0, 40, 240); background-image:url('linha01.jpg'); font-size: 14px; font-family: Arial; height: 58px; font-weight: bold; text-align: center;"><%=med.getVazao()%></td>
				  <td style="color: rgb(0, 40, 240); background-image:url('linha01.jpg'); font-size: 14px; font-family: Arial; height: 58px; font-weight: bold; text-align: center;"></td>
				  <td style="color: rgb(0, 40, 240); background-image:url('linha01.jpg'); font-size: 14px; font-family: Arial; height: 58px; font-weight: bold; text-align: center;"></td>
				</tr>

				<tr>
				  <td style="width: 104px; background-image:url('linha02.jpg'); font-size: 14px; font-family: Arial;  height: 58px; font-weight: bold; text-align: center;">projeto</td>
				  <td style="background-image:url('linha02.jpg'); font-weight: bold; text-align: center;"> --- </td>
				  <td style="background-image:url('linha02.jpg'); font-weight: bold; text-align: center;"> <%=hgeo.PROJ_NE%> </td>
				  <td style="background-image:url('linha02.jpg'); font-weight: bold; text-align: center;"> <%=hgeo.VAZAO%> </td>
				  <td style="background-image:url('linha02.jpg'); font-weight: bold; text-align: center;"></td>
				  <td style="background-image:url('linha02.jpg'); font-weight: bold; text-align: center;"></td>
				</tr>
			  </tbody>
			</table>
		<% } %>
	<% } //Fim da tabela de cima, que só deve aparecer com poço selecionado %>

	<br><br>
	
	<%// TABELA PAINEL DE AVISOS 

	  try{
		  // Conectando na base de dados para efetuar as consultas por dia e fazer a media
		  connection = DriverManager.getConnection (url, "sysdba", "masterkey");    	
	  } catch (Exception e) {
		  %> Excessao conectando no banco <%=e.getMessage()%> <br> <%
	  }
	  
	//Recupera dado do Odometro
	stmt = connection.createStatement();
	String consulta = "select first 1 hidrometro from grandezas where code = '"+code+"' order by data desc";
	rs = stmt.executeQuery(consulta);	        
	
	if(rs.next()) {
		hidro = rs.getFloat("hidrometro");
	} 
	rs.close();
		
	
	if (pocoSelected){ %>
		<table style="border-collapse: collapse; text-align: left; margin-left: 10px; width: 700px; height: 15px;" border="1" cellpadding="0" cellspacing="0">
	<% } else { %>
		<table style="border-collapse: collapse; text-align: left; margin-left: 10px; width: 700px; height: 15px;" border="1" cellpadding="0" cellspacing="0">	
	<% } %>
    <tbody>
      <tr>
	      <td colspan=2 style="background-image:url('tile_painel_avisos.png'); text-align: center; font-family: Arial; font-size: 14px; font-weight: bold; height: 23px; width: 600px;">PAINEL DE AVISOS</td>
	  </tr>
	  <tr>
	  	  <td style="height: 27"></td>
		  <% if (pocoSelected){ %>
		  <td rowspan=5 style="text-align: center; background-image:url('relogio.png'); font-family: Arial; font-size: 12px; font-weight: bold; height: 117px; width: 114px;> 
			   <div id="odometer" class="odometer"> <%=hidro%> </div>
		  </td>
		  <% } else { %>
		      <td></td>
		  <% } %>
	  </tr>
	  <tr>
		
			<% if ((pocoName.length() > 0) && ((code == null) || (code.equals("")))) { %>		
				<td style="color: rgb(220, 20, 10); font-size: 14px; font-family: Arial; font-weight: bold;"> Problemas nos dados cadastrais do poço: <%=request.getParameter("pocoName")%>. Favor corrigir. </td>		  		  			
			<% } else if ((code != null) && (!code.equals(""))) { %>
				<td style="color: rgb(0, 40, 240); font-size: 14px; font-family: Arial; font-weight: bold;"> Dados de identificação do poço: <%=request.getParameter("pocoName")%> </td>		  		  
			<% } else if(systemSelected) { %>	
				<td style="color: rgb(0, 40, 240); font-size: 14px; font-family: Arial; font-weight: bold;"> Sistema selecionado. Agora selecione poço no menu ao lado. </td>				
			<% } else { %>	
				<td style="color: rgb(0, 40, 240); font-size: 14px; font-family: Arial; font-weight: bold;"> Nenhum sistema selecionado. Selecione o Sistema no menu ao lado. </td>				
			<% } %>
	   </tr>
	   <tr>
	     <td style="height: 27"></td>
	   </tr>	    
	   <tr>
		  <% if(med == null) { 
				if ((code != null) && (!code.equals(""))) { %>
					<td style="color: rgb(0, 40, 240); font-size: 14px; font-family: Arial; font-weight: bold;"> NENHUMA MEDIDA ENCONTRADA PARA ESSE POÇO </td>
				<% } %>								
		  <% } else { %>
				<td style="color: rgb(0, 40, 240); font-size: 14px; font-family: Arial; font-weight: bold;"> Ultima medida em : <%=med.getTs()%></td>
		  <% } %>
		
	   </tr>
	   <tr>
	     <td style="height: 27"></td>
	   </tr>
	   <tr>
			<% if ((code != null) && (!code.equals(""))) { %>
				<td style="color: rgb(0, 40, 240); font-size: 14px; font-family: Arial; font-weight: bold;"> Identificador do Poço (UTM Leste/Oeste): <%=request.getParameter("code")%></td>
			<% } else { %>			
				<td style="height: 27"></td>
			<% } %>				
	   </tr>
	   <tr>
	     <td style="height: 27"></td>
	   </tr>
	   <tr>
			<% if(med != null) { %>
				<td style="color: rgb(220, 20, 10); font-size: 14px; font-family: Arial; font-weight: bold;"> <%=frase%> </td>
 		    <% } else { %>
				<td style="height: 27"></td>
		    <% } %>
	   </tr>
	   <tr>
	     <td style="height: 27"></td>
	   </tr>
	   <tr>
			<% if(unknownState) { %>
				<td style="color: rgb(0, 40, 240); font-size: 14px; font-family: Arial; font-weight: bold;"> Poço em estado desconhecido devido ao tempo sem leitura </td>
 		    <% } else { %>
				<td style="height: 27"></td>
		    <% } %>
	    </tr>
	    <tr>
	     <td style="height: 27"></td>
	    </tr>
	    <tr>
	     <td style="height: 27"></td>
	    </tr>
	    <tr>
	     <td style="height: 27"></td>
	    </tr>
	    <tr>
	     <td style="height: 27"></td>
	    </tr>
	  </tbody>
	</table>
<%
//Aqui termina o ctrl operacional 
} else if (!tableType.equals("operacional")) { 
    if(botao==null) {
        botao="nivel";
    }

    if (tableType.equals("noSelection")) {
    	
    } else if (!tableType.equals("graficos")){
    	//Houve seleção de TalbeType
    %>    
	<table bgcolor=cdcccb style="border-collapse: collapse; margin-left: 10px;">
	  <tbody>
	    <tr>
	      <%	 
		 if (botao.equals("nivel")) {%>
	            <td><input name="opcao" src="nivel_down.jpg"  onclick=document.myForm.opcao.value="nivel"; value="nivel" height="42" type="image" width="72"></td>
	         <% } else  { %>
	            <td><input name="opcao" src="nivel_up.jpg"  onclick=document.myForm.opcao.value="nivel" value="nivel" height="42" type="image" width="72"></td>
		 <% } 
	         if (botao.equals("vazao")) {%>
	            <td><input name="opcao" src="vazao_down.jpg" onclick=document.myForm.opcao.value="vazao" value="vazao" height="42" type="image" width="75"></td>
	         <% } else  { %>
	            <td><input name="opcao" src="vazao_up.jpg" onclick=document.myForm.opcao.value="vazao" value="vazao" height="42" type="image" width="75"></td>
		 <% } 
	         if (botao.equals("corrente")) {%>
	            <td><input name="opcao" src="corrente_down.jpg"  onclick=document.myForm.opcao.value="corrente" value="corrente" height="42" type="image" width="81"></td>
	         <% } else  { %>
	            <td><input name="opcao" src="corrente_up.jpg"  onclick=document.myForm.opcao.value="corrente" value="corrente" height="42" type="image" width="81"></td>
		 <% } 
	         if (botao.equals("volume")) {%>
				<td><input name="opcao" src="volume_down.jpg" onclick=document.myForm.opcao.value="volume" value="volume" height="42" type="image" width="86"></td>
	         <% } else  { %>
	            <td><input name="opcao" src="volume_up.jpg" onclick=document.myForm.opcao.value="volume" value="volume" height="42" type="image" width="86"></td>
			<% } 
			 if (tableType.equals("mensal")) {			
				 // Nivel Max, nivel min, jornada e demanda só estão disponíveis para dados mensais
				 if (botao.equals("nivelMax")) {%>
					<td><input name="opcao" src="nivelMax_down.jpg" onclick=document.myForm.opcao.value="nivelMax" value="nivelMax" height="42" type="image" width="90"></td>
				 <% } else  { %>
					<td><input name="opcao" src="nivelMax_up.jpg" onclick=document.myForm.opcao.value="nivelMax" value="nivelMax" height="42" type="image" width="90"></td>
				 <% } 
				 if (botao.equals("nivelMin")) {%>
					<td><input name="opcao" src="nivelMin_down.jpg" onclick=document.myForm.opcao.value="nivelMin" value="nivelMin" height="42" type="image" width="90"></td>
				 <% } else  { %>
					<td><input name="opcao" src="nivelMin_up.jpg" onclick=document.myForm.opcao.value="nivelMin" value="nivelMin" height="42" type="image" width="90"></td>
				 <% } 
					
				 if (botao.equals("demanda")) {%>
					<td><input name="opcao" src="demanda_down.jpg" onclick=document.myForm.opcao.value="demanda" value="demanda" height="42" type="image" width="90"></td>
				 <% } else  { %>
					<td><input name="opcao" src="demanda_up.jpg" onclick=document.myForm.opcao.value="demanda" value="demanda" height="42" type="image" width="90"></td>
			     <% } 
				 if (botao.equals("jornada")) {%>
					<td><input name="opcao" src="jornada_down.jpg" onclick=document.myForm.opcao.value="jornada" value="jornada" height="42" type="image" width="97"></td>
				 <% } else  { %>
					<td><input name="opcao" src="jornada_up.jpg" onclick=document.myForm.opcao.value="jornada" value="jornada" height="42" type="image" width="97"></td>
			     <% } 
			 }
	         if (botao.equals("cesp")) {%>
	            <td><input name="opcao" src="cesp_down.jpg" onclick=document.myForm.opcao.value="cesp" value="cesp" height="42" type="image" width="90"></td>
	         <% } else  { %>
	            <td><input name="opcao" src="cesp_up.jpg" onclick=document.myForm.opcao.value="cesp" value="cesp" height="42" type="image" width="90"></td>
		 <% } 
	         if (botao.equals("qualitativo")) {%>
	         <td><input name="opcao" src="qualitativo_down.jpg" onclick=document.myForm.opcao.value="qualitativo" value="qualitativo" height="42" type="image" width="111"></td>
	         <% } else  { %>
	         <td><input name="opcao" src="qualitativo_up.jpg" onclick=document.myForm.opcao.value="qualitativo" value="qualitativo" height="42" type="image" width="111"></td>
		 <% } %>
	    </tr>
	  </tbody>
	</table>
	<!--    <h4><center>Exibindo dados de <%=botao%> do dia <%=data%> </center></h4> -->
	
  <% } %>

  <br>

  <%
  if (botao==null) {
	  botao = "nivel";
  }

  //Dependendo da tableType (mensal, diaria, anual), vou recolher uma quantidade de dados diferentes e apresentar dados diferentes..
  float[][] mat = null;
  float[][] mat_mes = null;
  int linhas = 20; // Numero de linhas que a tabela ira apresentar.
  int i_max=0;
  String[] arrayDias = new String[30];
  Medida[][] medDias = null;
  float[][] arrayMediaDia = new float[30][24];  //30 dias e 24 horas
  float[][] arrayMes = new float[13][32];  //12 meses e 31 dias

  if(data==null){ %>
	  Sim, StartDate é null
  <%}

	DataRequester dr = new DataRequester("jdbc:firebirdsql:localhost/3050:C:/juper/old_site/SIGAS.GDB");
	String nivel = "";
	String valor = "";
  if (tableType.equals("diaria")) {
		   
		
		medDias = dr.daysData(data, code, botao);
	  
  } else if (tableType.equals("mensal")) {
	if(botao.equals("nivelMin")) {
		arrayMes = dr.nivelAgrupadoMes(data, "min", code);
	} else if (botao.equals("nivelMax")) {
		arrayMes = dr.nivelAgrupadoMes(data, "max", code);
	} else if (botao.equals("jornada")) {
		arrayMes = dr.jornada(data, code);
	} else if (botao.equals("demanda")) {
		arrayMes = dr.demanda(data, code);
	} else {
		// Apenas agregacao esta sendo calculada no servlet
		StringTokenizer strData = new StringTokenizer(data, "/");	
		strData.nextToken(); //Passa o token dia
		strData.nextToken(); //passa do token mes
		anoAnual = Integer.parseInt(strData.nextToken()); //pega o ano
		
		String query = "select " + botao + ",data from grandezas "
			+ " where code = '" + code + "'" 
			+ " and data BETWEEN '01/01/" + anoAnual + " 00:00:00' and '12/31/" + anoAnual + " 23:59:59'";
			//+ " and " + botao +
			//+ " order by data";
		
		try {	
			//out.println(query+"<br>");	
			connection = DriverManager.getConnection (url, "sysdba", "masterkey");
			stmt = connection.createStatement();
			rs = stmt.executeQuery(query);
			float floatValue=0;
			while (rs.next()){				
				%> <!-- No rs <br> --><%				
				String diaString = rs.getString("DATA");
				//out.println(diaString+"<br>");
				strData = new StringTokenizer(diaString, "-");
				int ano = Integer.parseInt(strData.nextToken());
				int mes = Integer.parseInt(strData.nextToken());
				String dayParcial = strData.nextToken();
				//out.println(dayParcial+"<br>");
				String dayFinal = dayParcial.substring(0, dayParcial.indexOf(" "));
				int dia = Integer.parseInt(dayFinal);
					
				if(botao.equals("nivel"))
					floatValue = rs.getFloat("NIVEL");
				else if (botao.equals("vazao"))
					floatValue = rs.getFloat("VAZAO");
				if(floatValue > 0){
					//out.println("["+ mes +"]"+"["+ dia +"]"+floatValue+"<br>");
					arrayMes[mes][dia]= floatValue;
				}
			}
			rs.close();								
		} catch (Exception e) {
			out.println("erro lendo dados de medidas mensais: "+e.getMessage());
		}
	}
	
} else if (tableType.equals("anual")) {
	StringTokenizer strData = new StringTokenizer(data, "/");	
	int dia = Integer.parseInt(strData.nextToken());
	int mes = Integer.parseInt(strData.nextToken());
	anoAnual = Integer.parseInt(strData.nextToken());
	out.println("Dados anuais ainda não disponíveis para o poço<br>");
	
} else if (tableType.equals("graficos")) {
	String data_inicial_form = data;
	String data_final_form = data;
	String hora_inicial_form = "00:00:01";
	String hora_final_form = "23:59:59";
	//Checkboxes
	String nivel_chk = "checked";
	String vazao_chk = "";
	String corrente_chk = "";
	try {	
		if (request.getParameter("data_text_start") != null) {
			data_inicial_form = request.getParameter("data_text_start");		
			data_final_form = request.getParameter("data_text_end");
			hora_inicial_form = request.getParameter("hora_text_start");
			hora_final_form = request.getParameter("hora_text_end");
			if(request.getParameter("graf_nivel_chk")==null){
				nivel_chk = "";
			}
			if(request.getParameter("graf_vazao_chk")!=null){
				vazao_chk = "checked";
			}
			if(request.getParameter("graf_corrente_chk")!=null){
				corrente_chk = "checked";
			}			
		} 
	} catch (Exception e) {
	    out.println("Erro na criação da página de gráficos "+e.getMessage());		
	}
%>

<table border=1  cellpadding="0" cellspacing="0" style="border-collapse: collapse; margin-left: 30px;">
	<table style="background-image:url('tile_panel.png');border-collapse: collapse; margin-left: 10px;" border=0 cellpadding="0" cellspacing="0" >
	    <tr>
	       <td></td>
	       <td height="30" colspan=2 style="font-weight: bold; font-font-family: Arial; font-size:10px; margin-left: 20px;">Selecione Item para Filtrar:</td>
	       <td colspan=2></td>	       	       
	    </tr>
	    <tr>
	       <td><input name="" src="vermelha.png"  value="nivel" height="12" type="image" width="12"></td>	       
	       <td><input name="graf_nivel_chk" type="checkbox" <%=nivel_chk%>></td>
	       <td style="text-align: left;">Nível (m)</td>
	       <td><input name="data_text_start" width="20" type="text" value="<%=data_inicial_form%>"</td>
	       <td><input name="data_text_end" width="20" type="text" value="<%=data_final_form%>"</td>
		   <td width="20"></td>	       
           <td rowspan=2><input name="botao_filtrar" src="bt_filtrar.jpg" value="Filtrar" height="35" type="image" width="148"></td>
		   <td width="100"></td>	       
           	       	       
	    </tr>
		<tr>
           <td><input name="" src="azul.png"  value="nivel" height="12" type="image" width="12"></td>
	       <td style="width="16;"><input name="graf_vazao_chk" type="checkbox" <%=vazao_chk%>> </td>
	       <td style="text-align: left;">Vazao (m3/h)</td>
	       <td><input name="hora_text_start" width="10" type="text" value="<%=hora_inicial_form%>"</td>
	       <td><input name="hora_text_end" width="10" type="text" value="<%=hora_final_form%>"</td>	       	       
	    </tr>
		<tr>
           <td><input name="" src="verde.png"  onclick=document.myForm.opcao.value="nivel"; value="nivel" height="12" type="image" width="12"></td>
	       <td><input name="graf_corrente_chk" type="checkbox" <%=corrente_chk%>></td>
	       <td style="text-align: left;">Corrente (A)</td>
	       <td></td>
	       <td></td>
	    </tr>	    
	</table>
	<br><br>

    <%
	//Testando Criação de gráfico
	TimeSeries series1 = new TimeSeries("Nivel", Minute.class);
    TimeSeries series2 = new TimeSeries("Vazao", Minute.class);
    TimeSeries series3 = new TimeSeries("Corrente", Minute.class);
    
	StringTokenizer strData = new StringTokenizer(data_inicial_form, "/");	
	String diaStr = strData.nextToken();
	String mesStr = strData.nextToken();
	String anoStr = strData.nextToken();
	String data_ini = anoStr + "/" + mesStr + "/" + diaStr + " " + hora_inicial_form;
	
	strData = new StringTokenizer(data_final_form, "/");	
	diaStr = strData.nextToken();
	mesStr = strData.nextToken();
	anoStr = strData.nextToken();
	String data_end = anoStr + "/" + mesStr + "/" + diaStr + " " + hora_final_form;
		
	String QUERY_NIVEL = "SELECT * FROM sigas_pocos where codigo_str = '" + code + "' and data BETWEEN '" + data_ini+ "' and '" + data_end + "' order by data";	
	String QUERY = "SELECT * FROM grandezas where code = '" + code + "' and data BETWEEN '" + data_ini+ "' and '" + data_end + "' order by data";
	try {	
        connection = DriverManager.getConnection (url, "sysdba", "masterkey");
		    
        stmt = connection.createStatement();

		if(nivel_chk.equals("checked")){		
			ResultSet rs2 = stmt.executeQuery(QUERY_NIVEL);
			while (rs2.next()) {
				//Pegando data
				String data_ts = rs2.getString("DATA");
				String dataParsing = data_ts.substring(0, data_ts.indexOf(" "));
				strData = new StringTokenizer(dataParsing, "-");
				int anoInt = Integer.parseInt(strData.nextToken());
				int mesInt = Integer.parseInt(strData.nextToken());
				int diaInt = Integer.parseInt(strData.nextToken());
				strData = new StringTokenizer(data_ts.substring(data_ts.indexOf(" ")+1), ":");
				int hora = Integer.parseInt(strData.nextToken());
				int minuto = Integer.parseInt(strData.nextToken());
				String segundoStr = strData.nextToken();
				StringTokenizer segundoTkn = new StringTokenizer(segundoStr, ".");
				int segundo = Integer.parseInt(segundoTkn.nextToken());
				series1.addOrUpdate(new Minute(minuto, hora, diaInt, mesInt, anoInt), rs2.getFloat("NIVEL"));								
			}
		}
		
		if((corrente_chk.equals("checked")) || (vazao_chk.equals("checked"))){
	        rs = stmt.executeQuery(QUERY);
			while (rs.next()){
				//Pegando data
				String data_ts = rs.getString("DATA");
				String dataParsing = data_ts.substring(0, data_ts.indexOf(" "));
				strData = new StringTokenizer(dataParsing, "-");
				int anoInt = Integer.parseInt(strData.nextToken());
				int mesInt = Integer.parseInt(strData.nextToken());
				int diaInt = Integer.parseInt(strData.nextToken());
				//Pegando hora
				strData = new StringTokenizer(data_ts.substring(data_ts.indexOf(" ")+1), ":");
				int hora = Integer.parseInt(strData.nextToken());
				int minuto = Integer.parseInt(strData.nextToken());
				String segundoStr = strData.nextToken();
				StringTokenizer segundoTkn = new StringTokenizer(segundoStr, ".");
				int segundo = Integer.parseInt(segundoTkn.nextToken());
							
				if(vazao_chk.equals("checked")){
					series2.addOrUpdate(new Minute(minuto, hora, diaInt, mesInt, anoInt), rs.getInt("VAZAO"));				
				}
				if(corrente_chk.equals("checked")){
					series3.addOrUpdate(new Minute(minuto, hora, diaInt, mesInt, anoInt), rs.getFloat("CORRENTE"));				
				}						
			}
		}		
    } catch (Exception e){
    	%> Erro gerando series <%=e.getMessage()%> <%
	   
    }    
    
	//final XYDataset dataset = createDataset();
	TimeSeriesCollection dataset = new TimeSeriesCollection();
	String yAxis = "";
	if(nivel_chk.equals("checked")){
		dataset.addSeries(series1);
		yAxis+= "- Nivel ";		
	}
	if(vazao_chk.equals("checked")){
		dataset.addSeries(series2);
		yAxis+= "- Vazão ";
		out.println("Dados de vazão em metros cúbicos / hora.<br>");
	}
	if(corrente_chk.equals("checked")){
		dataset.addSeries(series3);
		yAxis+= "- Corrente ";		
	}
	yAxis+= "-";
	dataset.setDomainIsPointsInTime(true);
	
    //Testando código pronto
       JFreeChart chart = ChartFactory.createTimeSeriesChart(
            "Dados Recuperados no Período",  // title
            "Data",             // x-axis label
            yAxis,   // y-axis label
            dataset,            // data
            true,               // create legend?
            true,               // generate tooltips?
            false               // generate URLs?
        );

        chart.setBackgroundPaint(Color.white);
        //chart.getCategoryPlot().getRenderer(0).setSeriesPaint(1, Color.BLUE); 
                
        XYPlot plot = (XYPlot) chart.getPlot();
        plot.setBackgroundPaint(Color.lightGray);
        plot.setDomainGridlinePaint(Color.white);
        plot.setRangeGridlinePaint(Color.white);
        //plot.setAxisOffset(new RectangleInsets(5.0, 5.0, 5.0, 5.0));
        plot.setDomainCrosshairVisible(true);
        plot.setRangeCrosshairVisible(true);
        XYItemRenderer r = plot.getRenderer();
        if (r instanceof XYLineAndShapeRenderer) {
            XYLineAndShapeRenderer renderer = (XYLineAndShapeRenderer) r;
            renderer.setShapesVisible(false);
            renderer.setShapesFilled(false);
        }    
	

		try {	
	   		// XYPlot plot = (XYPlot)chart.getPlot();
	    
	        //plot.setRenderer(renderer);
		    //chart.setBackgroundPaint(new Color(255 , 255 , 255));	
		
		    final ChartPanel chartPanel = new ChartPanel(chart);
			//final CategoryPlot plot = chart.getCategoryPlot();
			//plot.setForegroundAlpha(0.5f);
			
			// Cor do fundo do grafico
			//plot.setBackgroundPaint(new Color(159, 182, 205));
			
			//plot.setOutlinePaint(new Color(0,250,0));
	    }catch (Exception e) {
	    	%> Erro no plot <%=e.getMessage()%> <%    	
	    }
	    java.util.Calendar cal = Calendar.getInstance();
		int monthInt = cal.get(Calendar.MONTH)+1;
		String monthStr = ""+monthInt;
		if (monthInt < 10)
		    monthStr = "0"+monthStr;
		//String path = "C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/dev/"; // Path casa Cleo
	    String path = "C:/Arquivos de programas/Apache Software Foundation/Tomcat 6.0/webapps/dev/"; //Path Juper
		String graphDate = "graph" + cal.get(Calendar.DAY_OF_MONTH) + "-" + monthStr + "-" + cal.get(Calendar.YEAR) + ".png";
		
		try {				
			final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			final File file1 = new File(path+graphDate);
		    ChartUtilities.saveChartAsPNG(file1, chart, 900, 600, info);
		} catch (Exception e) {
	    	%> Erro salvando imagem do grafico <%=e.getMessage()%> <%    			
			out.println(e);
		}  %>
	    <img src="<%=graphDate%>" alt="" height="600" width="900">

  <%} %>
<table bordercolor=cdcccb border="1" cellpadding="4" cellspacing="0" style="border-collapse: collapse; margin-left: 10px;">
<tbody>

<tr>
  <%
    // TÍTULO HORIZONTAL DA TABELA
    if (tableType.equals("diaria")) { %>
      <td style="font-family: Arial; font-size: 14pt; color:#FFFFFF" bgcolor=717171 align="center" width=45><small><small><small> Dias/Horas </small></small></small></td>            
      <% for(int k=0 ; k < 24 ; k++) { 
           // Imprimindo as 24 hs do dia %>
           <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> <%=k%> </small></small></small></td> 
      <%} %>
            
  <% } else if (tableType.equals("mensal")) { %>
      <td style="font-family: Arial; font-size: 14pt; color:#FFFFFF" bgcolor=717171 align="center" width=45><small><small><small> Dias/Mes </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> Janeiro </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> Fevereiro </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> Março </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> Abril </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> Maio </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> Junho </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> Julho </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> Agosto </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> Setembro </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> Outubro </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> Novembro </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> Dezembro </small></small></small></td>             
              
  <% } else if (tableType.equals("anual")) { %>
      <td style="font-family: Arial; font-size: 14pt; color:#FFFFFF" bgcolor=717171 align="center" width=45><small><small><small> Mes/Ano </small></small></small></td>  
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> <%=(anoAnual-2) %> </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> <%=(anoAnual-1) %> </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> <%=(anoAnual) %> </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> <%=(anoAnual+1) %> </small></small></small></td>
      <td style="font-family: Arial;" bgcolor=DDDDDD align="center" width=45><small><small><small> <%=(anoAnual+2) %> </small></small></small></td>
  <% } %>  
</tr>

  <%  
    //Impressao das linhas abaixo do titulo    
    if (tableType.equals("diaria")) {
    	
		//Setar a data requisitada em um calendar
		java.util.Calendar cal = Calendar.getInstance();  		
    	StringTokenizer strData = new StringTokenizer(data, "/");	
		int dia = Integer.parseInt(strData.nextToken());
		int mes = Integer.parseInt(strData.nextToken()) - 1; //Menos 1 porque os meses vão de 0 à 11. Mês 11 é dezembro por exemplo.
		anoAnual = Integer.parseInt(strData.nextToken());
        cal.set(anoAnual,mes,dia);
        //Diminui 10 para pegar 10 dias antes e 10 dias depois
        cal.add(Calendar.DATE, -10);      
    	
        try{
	    	//São 20 linhas, apresentação de 20 dias do mes
	        for(int i=0; i < linhas; i++) { 
				cal.add(Calendar.DATE, 1);  	    
				String day = "" +(cal.get(Calendar.DAY_OF_MONTH));
				if (day.length() == 1)
					day = "0"+day;  	    
				String mesPrint = "" +(cal.get(Calendar.MONTH)+1);
				if (mesPrint.length() == 1)
					mesPrint = "0"+mesPrint;  	    
  	      		String diaPrint = day + "/" + mesPrint + "/" + cal.get(Calendar.YEAR);%>
	       		<tr>
	          		<td style="font-family: Arial;" bgcolor=e5e5ea align="center" width=45><small><small><small> <%=diaPrint%> </small></small></small></td>
	          		<% for (int j=0; j<24; j++) { //Iterando entre as horas 
	          			String medPrint = "  ";
	          			if (medDias[i][j] != null) {
	          			    if(botao.equals("nivel")) {
	          			        medPrint = ""+medDias[i][j].getNivel();
	          			    } else if (botao.equals("vazao")) {
	          			        medPrint = ""+medDias[i][j].getVazao();
	          			    } else if (botao.equals("corrente")) {
	          			        medPrint = ""+medDias[i][j].getCorrente();	          			    
	          			    } else if (botao.equals("volume")) {
	          			        medPrint = ""+medDias[i][j].getVolume();	          			    
	          			    } else if (botao.equals("cesp")) {
	          			        medPrint = ""+medDias[i][j].getCesp();	          			    
	          			    }
	          			}%>
	              		<td style="font-family: Arial;" bgcolor=fffffd align="center" width=45><small><small><small> <%=medPrint%> </small></small></small></td>                  	         	         	 
	          		<% } %>
	       </tr>
	      <%} 
	    } catch (Exception e) {
	    	%> Erro na criacao da tabela diaria <%=e.getMessage()%> <%
	    }
   } else if (tableType.equals("mensal")) { 
        for (int i=1; i <= 31; i++) { //Percorrer todos os dias do mes %>
    	   <tr>
	          <td style="font-family: Arial;" bgcolor=e5e5ea align="center" width=45><small><small><small> <%=i%> </small></small></small></td>
	          <% for (int j=1; j<=12; j++) { //Iterando entre os meses %>
	              <td style="font-family: Arial;" bgcolor=fffffd align="center" width=45><small><small><small> <%=arrayMes[j][i]%> </small></small></small></td>                  	         	         	 
	          <% } %>
	       </tr>
        <%} 
   } %>  
   
<%
	

}
  //Fim do que não é controle operacional
%>

</form>
</body>
</html>
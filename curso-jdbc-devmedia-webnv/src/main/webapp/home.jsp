<%@page import="br.edu.devmedia.jdbc.dto.UfDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pagina de boas vindas</title>
</head>
<body>
	<form action="pessoa?acao=cadastrar" method="post">
	  <%
				String msg = (String) request.getAttribute("msg");
			%>
			<%=msg!= null ? msg : ""%>
		
		<fieldset>
		
			<legend>Pessoa</legend>
			<table>
			    <tr>
					<td>Nome:</td>
					 <td>
					  <input type = "text" name = "nome"/>
					 </td>
				</tr>
				
				<tr>
					<td>CPF:</td>
					 <td>
					  <input type = "text" name = "cpf"/>
					 </td>
				</tr>
				<tr>
					<td>DtNasc:</td>
					 <td>
					  <input type = "text" name = "dtNasc"/>
					 </td>
				</tr>
				
		   </table>
		</fieldset>
		<fieldset>
			<legend>sexo:</legend>
			<table>
			    <tr>
					<td>sexo:</td>
					 <td>
					  <input type = "radio" name = "sexo" value ="M" checked="checked"/>Masculino
					  <input type = "radio" name = "sexo" value ="F"/>Femenino
					 </td>
				</tr>
				
				
			</table>
		</fieldset>
		<fieldset>
			<legend>Endereço:</legend>
			<table>
			    <tr>
					<td>logradouro:</td>
					 <td>
					  <input type = "text" name = "logradouro"/>
					 </td>
				</tr>
				
				<tr>
					<td>Bairro:</td>
					 <td>
					  <input type = "text" name = "bairro"/>
					 </td>
				</tr>
				<tr>
					<td>Cidade:</td>
					 <td>
					  <input type = "text" name = "cidade"/>
					 </td>
				</tr>
				<tr>
					<td>Numero:</td>
					 <td>
					  <input type = "text" name = "numero"/>
					 </td>
				</tr>
				<tr>
					<td>CEP:</td>
					 <td>
					  <input type = "text" name = "cep"/>
					 </td>
				</tr>
				<tr>
					<td>UF:</td>
					 <td>
					  <select name ="uf">
					   <%
					  List<UfDTO> listasUfs = (List<UfDTO>)session.getAttribute("listaUfs");
					   for (UfDTO ufDTO : listasUfs) {
						   
					   %>
					    <option  value = " <%= ufDTO.getIdUF() %>">
					      <%=ufDTO.getDescricao()%>
					     </option>
					   <% } %>
					  </select>
					 </td>
				</tr>
				

			</table>
		</fieldset>
		<input type = "submit" value="cadastrar"/>
		<input type = "reset" value="limpar"/>
	</form>
</body>
</html>
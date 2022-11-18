<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="br.edu.devmedia.jdbc.dto.PessoaDTO"%>
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
	<form action="pessoa?acao=atualizar" method="post">
	  
		
		<fieldset>
		
			<legend>Pessoa</legend>
			<%
	    	String msg = (String) request.getAttribute("msg");
			DateFormat dateFormat  = new SimpleDateFormat("dd/MM/YYYY");
			PessoaDTO pessoaDTO  =(PessoaDTO)request.getAttribute("pessoaDTO");
	      %>
			<%=msg!= null ? msg : ""%>
			<input type = "hidden" name="id" value="<%= pessoaDTO.getIdPessoa() %>"/>
			<input type = "hidden" name="idEndereco" value="<%= pessoaDTO.getEnderecoDTO().getId_endereco()%>"/>
			<table>
			    <tr>
					<td>Nome:</td>
					 <td>
					  <input type = "text" name = "nome" value="<%= pessoaDTO.getNome() %> "/>
					 </td>
				</tr>
				
				<tr>
					<td>CPF:</td>
					 <td>
					  <input type = "text" name = "cpf" value="<%= pessoaDTO.getCpf()%> "/>
					 </td>
				</tr>
				<tr>
					<td>DtNasc:</td>
					 <td>
					  <input type = "text" name = "dtNasc" value="<%= dateFormat.format(pessoaDTO.getDtNascimento()) %> "/>
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
					  <% if (pessoaDTO.getSexo()=='M'){ %>
					  <input type = "radio" name = "sexo" value ="M" checked="checked"/>Masculino
					  <input type = "radio" name = "sexo" value ="F"/>Femenino
					  <%} else { %>
					   <input type = "radio" name = "sexo" value ="M" />Masculino
					  <input type = "radio" name = "sexo" value ="F" checked="checked"/>Femenino
					  <%} %>
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
					  <input type = "text" name = "logradouro" value="<%= pessoaDTO.getEnderecoDTO().getLogradouro()%>"/>
					 </td>
				</tr>
				
				<tr>
					<td>Bairro:</td>
					 <td>
					  <input type = "text" name = "bairro"  value="<%= pessoaDTO.getEnderecoDTO().getBairro()%>"/>
					 </td>
				</tr>
				<tr>
					<td>Cidade:</td>
					 <td>
					  <input type = "text" name = "cidade" value="<%= pessoaDTO.getEnderecoDTO().getCidade()%>"/>
					 </td>
				</tr>
				<tr>
					<td>Numero:</td>
					 <td>
					  <input type = "text" name = "numero" value="<%= pessoaDTO.getEnderecoDTO().getNumero()%>"/>
					 </td>
				</tr>
				<tr>
					<td>CEP:</td>
					 <td>
					  <input type = "text" name = "cep" value="<%= pessoaDTO.getEnderecoDTO().getCep()%>"/>
					 </td>
				</tr>
				<tr>
					<td>UF:</td>
					 <td>
					  <select name ="uf">
					   <%
					  List<UfDTO> listasUfs = (List<UfDTO>)session.getAttribute("listaUfs");
					   for (UfDTO ufDTO : listasUfs) {
						 if( ufDTO.getIdUF().equals(pessoaDTO.getEnderecoDTO().getUfDTO().getIdUF())) {  
					   %>
					    <option  value = " <%= ufDTO.getIdUF() %> " selected = "selected"> 
					      <%= ufDTO.getDescricao() %>
					     </option>
					   <% } else {
						   
					   %>
					   
					     <option  value = " <%= ufDTO.getIdUF() %> "> 
					      <%= ufDTO.getDescricao() %>
					     </option>
					     
						 
					<%  } }%>
					  </select>
					 </td>
				</tr>
				

			</table>
		</fieldset>
		<input type = "submit" value="atualizar"/>
		<input type = "reset" value="limpar"/>
	</form>
</body>
</html>
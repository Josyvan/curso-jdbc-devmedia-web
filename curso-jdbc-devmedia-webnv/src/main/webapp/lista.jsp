<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="br.edu.devmedia.jdbc.dto.PessoaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listagem</title>
</head>
<body>
          <%
				String msg = (String) request.getAttribute("msg");
			%>
			<%=msg!= null ? msg : ""%>
			</br>
	<table border="1" cellpadding="5" cellspacing="0" width="700px"> 
		<tr style="color: white" bgcolor="black" align="center">
			<td>NOME:</td>
			<td>Dt. Nasc</td>
			<td>cidade:</td>
			<td>bairro</td>	
			<td>UF:</td>
			<td colspan="2">Ações</td>
		</tr>
		<%
		List<PessoaDTO> listaPessoas = (List<PessoaDTO>)request.getAttribute("listaPessoas");
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/YYYY");
		for(PessoaDTO pessoaDTO : listaPessoas){
		%>

		<tr>
			<td><%= pessoaDTO.getNome() %></td>
             <td><%= dateFormat.format(pessoaDTO.getDtNascimento()) %></td>
             <td><%= pessoaDTO.getEnderecoDTO().getCidade() %></td>
             <td><%= pessoaDTO.getEnderecoDTO().getBairro() %></td>
              <td><%= pessoaDTO.getEnderecoDTO().getUfDTO().getSiglaUf() %></td>
              <td>
               <a href="pessoa?acao=editar&id=<%=pessoaDTO.getIdPessoa()%>"> Editar</a>
              </td>
                <td >
               <a href="pessoa?acao=remover&idPessoa=<%=pessoaDTO.getIdPessoa()%>&idEndereco=<%=pessoaDTO.getEnderecoDTO().getId_endereco()%>" > Remover</a>
              </td>
		</tr>
		<%} %>
	</table>
</body>
</html>
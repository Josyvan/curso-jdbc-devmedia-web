package br.edu.devmedia.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.devmedia.jdbc.bo.PessoaBO;
import br.edu.devmedia.jdbc.dto.EnderecoDTO;
import br.edu.devmedia.jdbc.dto.PessoaDTO;
import br.edu.devmedia.jdbc.dto.UfDTO;

/**
 * Servlet implementation class PessoaServlet
 */
@WebServlet(urlPatterns ="/pessoa")
public class PessoaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		String proxPage = "home.jsp";
		 try{
		 PessoaBO pessoaBO  = new PessoaBO();
		 
		 if(acao.equals("cadastrar")){
			
			DateFormat dateFormat  = new SimpleDateFormat("dd/MM/YYYY");
			String cpf =request.getParameter("cpf");
			String nome =request.getParameter("nome");
			String dtaNasc =request.getParameter("dtNasc");
			String sexo =request.getParameter("sexo");
			String logradouro =request.getParameter("logradouro");
			String Bairro =request.getParameter("bairro");
			String cidade =request.getParameter("cidade");
			String numero =request.getParameter("numero");
			String cep =request.getParameter("cep");
			String uf =request.getParameter("uf");
			
			PessoaDTO pessoaDTO  = new PessoaDTO();
			pessoaDTO.setCpf(Long.parseLong(cpf));
			pessoaDTO.setNome(nome);
			pessoaDTO.setDtNascimento(dateFormat.parse(dtaNasc));
			
			EnderecoDTO enderecoDTO  = new EnderecoDTO();
			enderecoDTO.setLogradouro(logradouro);
			enderecoDTO.setBairro(Bairro);
			enderecoDTO.setCidade(cidade);
			enderecoDTO.setNumero(Long.parseLong(numero));
			enderecoDTO.setCep(Integer.parseInt(cep));
		
	        UfDTO ufDTO = new UfDTO();
	        ufDTO.setIdUF(Integer.parseInt(uf.trim()));
	
			enderecoDTO.setUfDTO(ufDTO);
			
			pessoaDTO.setEnderecoDTO(enderecoDTO);
			pessoaDTO.setSexo(sexo.charAt(0));
			
			
			
			pessoaBO.cadastrar(pessoaDTO);
			request.setAttribute("msg", "Cadastro efetuado com sucesso!");
			proxPage = "pessoa?acao=listar";
		 } else if (acao.equals("listar")){
			 List<PessoaDTO> lista =pessoaBO.listagem();
			 request.setAttribute("listaPessoas",lista);
			 proxPage = "lista.jsp";
			 
		 } else if (acao.equals("editar")){
			String id  = request.getParameter("id");
		   PessoaDTO pessoaDTO = pessoaBO.buscaPorId(Integer.parseInt(id.trim()));
		   request.setAttribute("pessoaDTO", pessoaDTO);
		   proxPage = "edicao.jsp";
		   
		 } else if(acao.equals("atualizar")){
			 DateFormat dateFormat  = new SimpleDateFormat("dd/MM/YYYY");
			    String idPessoas =request.getParameter("id");
			    String idEndereco =request.getParameter("idEndereco");
				String cpf =request.getParameter("cpf");
				String nome =request.getParameter("nome");
				String dtaNasc =request.getParameter("dtNasc");
				String sexo =request.getParameter("sexo");
				String logradouro =request.getParameter("logradouro");
				String Bairro =request.getParameter("bairro");
				String cidade =request.getParameter("cidade");
				String numero =request.getParameter("numero");
				String cep =request.getParameter("cep");
				String uf =request.getParameter("uf");
				
				PessoaDTO pessoaDTO  = new PessoaDTO();
				pessoaDTO.setIdPessoa(Integer.parseInt(idPessoas));
				pessoaDTO.setCpf(Long.parseLong(cpf.trim()));
				pessoaDTO.setNome(nome);
				pessoaDTO.setDtNascimento(dateFormat.parse(dtaNasc));
				
				EnderecoDTO enderecoDTO  = new EnderecoDTO();
				enderecoDTO.setId_endereco(Integer.parseInt(idEndereco));
				enderecoDTO.setLogradouro(logradouro);
				enderecoDTO.setBairro(Bairro);
				enderecoDTO.setCidade(cidade);
				enderecoDTO.setNumero(Long.parseLong(numero));
				enderecoDTO.setCep(Integer.parseInt(cep));
			
		        UfDTO ufDTO = new UfDTO();
		        ufDTO.setIdUF(Integer.parseInt(uf.trim()));
		
				enderecoDTO.setUfDTO(ufDTO);
				
				pessoaDTO.setEnderecoDTO(enderecoDTO);
				pessoaDTO.setSexo(sexo.charAt(0));
			    pessoaBO.atualizarpessoa(pessoaDTO);
			   proxPage = "pessoa?acao=listar";
			   request.setAttribute("msg", "Cadastro atualizado com sucesso!");
		 }else if(acao.equals("remover")){
			  String idPessoas =request.getParameter("idPessoa");
			  String idEndereco =request.getParameter("idEndereco");
			  
			  pessoaBO.removerPessoas(Integer.valueOf(idPessoas), Integer.parseInt(idEndereco));
			  proxPage = "pessoa?acao=listar";
			  request.setAttribute("msg", "Cadastro removido com sucesso!");
			 
		 }
		   }catch(Exception e){
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
		}
		request.getRequestDispatcher(proxPage).forward(request,response);
	 
	}
}

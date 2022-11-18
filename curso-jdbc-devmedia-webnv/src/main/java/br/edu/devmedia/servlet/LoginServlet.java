package br.edu.devmedia.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.devmedia.jdbc.bo.LoginBO;
import br.edu.devmedia.jdbc.bo.UfBO;
import br.edu.devmedia.jdbc.dto.LoginDTO;
import br.edu.devmedia.jdbc.dto.UfDTO;
import br.edu.devmedia.jdbc.exeption.NegocioExeption;


@WebServlet(urlPatterns ="/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
		LoginBO loginBO  = new LoginBO();
		String loign  =request.getParameter("login");
		String senha =request.getParameter("senha");
		 System.out.println(loign+senha);
		HttpSession session = request.getSession();
		LoginDTO loginDTO = new LoginDTO();
		loginDTO.setNome(loign);
		loginDTO.setSenha(senha);
	
		
		String proxPagina = "home.jsp";
		try {
			boolean resposta  = loginBO.logar(loginDTO);
			if(!resposta){
				request.setAttribute("msg", "Usuario ou senha estão invalidos");
				proxPagina = "login.jsp";
				
			}else{
			UfBO ufBO = new UfBO();
			List<UfDTO> lista = ufBO.listaUfs();
			session.setAttribute("listaUfs",lista);
			}
		} catch (NegocioExeption e) {
			proxPagina = "login.jsp";
			request.setAttribute("msg",e.getMessage() );
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(proxPagina);
		dispatcher.forward(request, response);
		
	}
	
			

}

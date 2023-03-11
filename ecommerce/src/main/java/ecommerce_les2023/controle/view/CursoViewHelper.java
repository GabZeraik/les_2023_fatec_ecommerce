package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CursoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		String nome = req.getParameter("nome_Curso");
		String descricao = req.getParameter("descricao_Curso");
		String periodo = req.getParameter("periodo_Curso");
		String id = req.getParameter("id_Curso");
		
		EntidadeDominio curso = new Curso(nome, descricao, periodo);

		if(id != "0" && id != "" && id != null) curso.setId(Integer.parseInt(id));
		
		return curso;
	}

	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		if (resultado.getOperacao() != "CONSULTAR") {
			req.getSession().setAttribute("resultado", resultado);
			//Atribui mensagem de sucesso à página e REDIRECIONA para home
			try {
				resp.sendRedirect("index.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {	
			req.getSession().setAttribute("cursos", resultado);
			//Encaminha novamente a alunos
			try {
				req.getRequestDispatcher("cursos.jsp").forward(req, resp);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
}

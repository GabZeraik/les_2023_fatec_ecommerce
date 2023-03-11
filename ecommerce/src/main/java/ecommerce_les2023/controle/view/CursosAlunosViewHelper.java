package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CursosAlunosViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		EntidadeDominio curso = new Curso();
		return curso;
	}

	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		if (resultado.isSucesso()) {
			//Atribui mensagem de sucesso à página e REDIRECIONA para página alunos
			req.getSession().setAttribute("lista_cursos", resultado.getDados());
			//Encaminha novamente a alunos
			try {
				resp.sendRedirect("alunos.jsp");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} 
	}
}

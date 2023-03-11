package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.modelo.Cidade;
import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.Endereco;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Estado;
import ecommerce_les2023.modelo.Professor;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProfessorViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		String id = req.getParameter("id_Professor");
		String nome = req.getParameter("nome_Professor");
		String cpf = req.getParameter("cpf_Professor");
		String email = req.getParameter("email_Professor");
		String registro_professor = req.getParameter("registro_Professor");
		String logradouro = req.getParameter("logradouro_Professor");
		String bairro = req.getParameter("bairro_Professor");
		String cep = req.getParameter("cep_Professor");
		String nome_cidade = req.getParameter("cidade_Professor");
		String sigla_estado = req.getParameter("sigla_estado_Professor");
		String curso_1_id = req.getParameter("curso_1_Professor");
		String curso_2_id = req.getParameter("curso_2_Professor");
				
		Curso curso_1 = new Curso();
		if(curso_1_id != "" && curso_1_id != null) curso_1.setId(Integer.parseInt(curso_1_id));
		
		Curso curso_2 = new Curso();
		if(curso_2_id != "" && curso_2_id != null) curso_2.setId(Integer.parseInt(curso_2_id));
		
		Endereco endereco = new Endereco(logradouro, bairro, cep, new Cidade(nome_cidade, new Estado(sigla_estado)));
		
		EntidadeDominio professor = new Professor(nome, cpf, email, registro_professor, curso_1, curso_2, endereco);

		if(id != "0" && id != "" && id != null) professor.setId(Integer.parseInt(id));
		
		return professor;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		
		if (resultado.isSucesso() && resultado.getOperacao() != "CONSULTAR") {
			req.getSession().setAttribute("resultado", resultado);
			//Atribui mensagem de sucesso à página e REDIRECIONA para home
			try {
				resp.sendRedirect("index.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			req.getSession().setAttribute("professores", resultado);
			//Encaminha novamente a alunos
			try {
				req.getRequestDispatcher("professores.jsp").forward(req, resp);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

	
}

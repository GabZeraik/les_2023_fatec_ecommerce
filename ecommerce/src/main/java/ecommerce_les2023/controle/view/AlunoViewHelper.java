package ecommerce_les2023.controle.view;

import java.io.IOException;

import ecommerce_les2023.modelo.Aluno;
import ecommerce_les2023.modelo.Cidade;
import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.Endereco;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Estado;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AlunoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		String id = req.getParameter("id_Aluno");
		String nome = req.getParameter("nome_Aluno");
		String cpf = req.getParameter("cpf_Aluno");
		String email = req.getParameter("email_Aluno");
		String dta_nascimento = req.getParameter("data_nascimento_Aluno");
		String registro_aluno = req.getParameter("registro_Aluno");
		String curso_nome = req.getParameter("curso_Aluno");
		String curso_id = req.getParameter("id_Curso");
		String logradouro = req.getParameter("logradouro_Aluno");
		String bairro = req.getParameter("bairro_Aluno");
		String cep = req.getParameter("cep_Aluno");
		String nome_cidade = req.getParameter("nome_cidade_Aluno");
		String sigla_estado = req.getParameter("sigla_estado_Aluno");
		
		Curso curso = new Curso();
		
		if(curso_nome != "0" && curso_nome != "" && curso_nome != null) curso.setNome_curso(curso_nome);
		if(curso_id != "0") curso.setId(Integer.parseInt(curso_id));
		
		Endereco endereco = new Endereco(logradouro, bairro, cep, new Cidade(nome_cidade, new Estado(sigla_estado)));
		
		EntidadeDominio aluno = new Aluno(nome, cpf, email, dta_nascimento, registro_aluno, curso, endereco);

		if(id != "0" && id != "" && id != null) aluno.setId(Integer.parseInt(id));
		
		return aluno;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		if (resultado.getOperacao() != "CONSULTAR") {
			req.getSession().setAttribute("resultado", resultado);
			//Atribui mensagem de sucesso à página e REDIRECIONA para home para não alterar o estado do servidor
			try {
				resp.sendRedirect("index.jsp");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			req.getSession().setAttribute("alunos", resultado);
			//Encaminha novamente a alunos
			try {
				req.getRequestDispatcher("alunos.jsp").forward(req, resp);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
}

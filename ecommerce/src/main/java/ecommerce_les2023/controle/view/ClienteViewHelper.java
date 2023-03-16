package ecommerce_les2023.controle.view;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import ecommerce_les2023.modelo.Aluno;
import ecommerce_les2023.modelo.Cidade;
import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.Endereco;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Estado;
import ecommerce_les2023.modelo.Pais;
import ecommerce_les2023.modelo.Telefone;
import ecommerce_les2023.modelo.Tipo;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ClienteViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		System.out.println("CHEGOU AQUI\n");
		
		for(Map.Entry<String, String[]> parametro : req.getParameterMap().entrySet()) {
			System.out.println(parametro.getKey() + " : " + parametro.getValue()[0]);
		}
		
		String usuario_cliente = req.getParameter("usuario_cliente");
		String senha_cliente = req.getParameter("senha_cliente");
		String nome_cliente = req.getParameter("nome_cliente");
		String genero_cliente = req.getParameter("genero_cliente");
		String data_nascimento_cliente = req.getParameter("data_nascimento_cliente").toString();
		String cpf_cliente = req.getParameter("cpf_cliente");
		String email_cliente = req.getParameter("email_cliente");
		String telefone_ddd_cliente = req.getParameter("telefone_ddd_cliente");
		String telefone_numero_cliente = req.getParameter("telefone_numero_cliente");
		String telefone_tipo_cliente = req.getParameter("telefone_tipo_cliente");
		
		Endereco endereco_cobranca = new Endereco();
		Endereco endereco_entrega = new Endereco();
		
		//endereco entrega
		String endereco_entrega_frase_cliente = req.getParameter("endereco_entrega_frase_cliente");
		String endereco_entrega_tipo_residencia_cliente = req.getParameter("endereco_entrega_tipo_residencia_cliente");
		String endereco_entrega_cep_cliente = req.getParameter("endereco_entrega_cep_cliente");
		String endereco_entrega_tipo_logradouro_cliente = req.getParameter("endereco_entrega_tipo_logradouro_cliente");
		String endereco_entrega_logradouro_cliente = req.getParameter("endereco_entrega_logradouro_cliente");
		String endereco_entrega_numero_cliente = req.getParameter("endereco_entrega_numero_cliente");
		String endereco_entrega_bairro_cliente = req.getParameter("endereco_entrega_bairro_cliente");
		String endereco_entrega_cidade_cliente = req.getParameter("endereco_entrega_cidade_cliente");
		String endereco_entrega_estado_cliente = req.getParameter("endereco_entrega_estado_cliente");
		String endereco_entrega_pais_cliente = req.getParameter("endereco_entrega_pais_cliente");
		String endereco_entrega_observacao_cliente = req.getParameter("endereco_entrega_observacao_cliente");
		
		endereco_entrega.setFrase(endereco_entrega_frase_cliente);
		endereco_entrega.setResidencia(endereco_entrega_tipo_residencia_cliente);
		endereco_entrega.setCep(endereco_entrega_cep_cliente);
		endereco_entrega.setTipo_logradouro(endereco_entrega_tipo_logradouro_cliente);
		endereco_entrega.setLogradouro(endereco_entrega_logradouro_cliente);
		endereco_entrega.setNumero(endereco_entrega_numero_cliente);
		endereco_entrega.setBairro(endereco_entrega_bairro_cliente);
		endereco_entrega.setCidade(new Cidade(endereco_entrega_cidade_cliente, new Estado(endereco_entrega_estado_cliente, endereco_entrega_estado_cliente, new Pais(endereco_entrega_pais_cliente, endereco_entrega_pais_cliente))));
		endereco_entrega.setObservacao(endereco_entrega_observacao_cliente);
		endereco_entrega.setTipo("ENTREGA");
		
		//endereco cobranca
		String endereco_cobranca_frase_cliente = req.getParameter("endereco_cobranca_frase_cliente");
		String endereco_cobranca_tipo_residencia_cliente = req.getParameter("endereco_cobranca_tipo_residencia_cliente");
		String endereco_cobranca_cep_cliente = req.getParameter("endereco_cobranca_cep_cliente");
		String endereco_cobranca_tipo_logradouro_cliente = req.getParameter("endereco_cobranca_tipo_logradouro_cliente");
		String endereco_cobranca_logradouro_cliente = req.getParameter("endereco_cobranca_logradouro_cliente");
		String endereco_cobranca_numero_cliente = req.getParameter("endereco_cobranca_numero_cliente");
		String endereco_cobranca_bairro_cliente = req.getParameter("endereco_cobranca_bairro_cliente");
		String endereco_cobranca_cidade_cliente = req.getParameter("endereco_cobranca_cidade_cliente");
		String endereco_cobranca_estado_cliente = req.getParameter("endereco_cobranca_estado_cliente");
		String endereco_cobranca_pais_cliente = req.getParameter("endereco_cobranca_pais_cliente");
		String endereco_cobranca_observacao_cliente = req.getParameter("endereco_cobranca_observacao_cliente");
		
		endereco_cobranca.setFrase(endereco_cobranca_frase_cliente);
		endereco_cobranca.setResidencia(endereco_cobranca_tipo_residencia_cliente);
		endereco_cobranca.setCep(endereco_cobranca_cep_cliente);
		endereco_cobranca.setTipo_logradouro(endereco_cobranca_tipo_logradouro_cliente);
		endereco_cobranca.setLogradouro(endereco_cobranca_logradouro_cliente);
		endereco_cobranca.setNumero(endereco_cobranca_numero_cliente);
		endereco_cobranca.setBairro(endereco_cobranca_bairro_cliente);
		endereco_cobranca.setCidade(new Cidade(endereco_cobranca_cidade_cliente, new Estado(endereco_cobranca_estado_cliente, endereco_cobranca_estado_cliente, new Pais(endereco_cobranca_pais_cliente, endereco_cobranca_pais_cliente))));
		endereco_cobranca.setObservacao(endereco_cobranca_observacao_cliente);
		endereco_cobranca.setTipo("COBRANCA");
		
		List<Endereco> list_enderecos = new ArrayList<Endereco>();
		list_enderecos.add(endereco_entrega);
		list_enderecos.add(endereco_cobranca);
				
		EntidadeDominio cliente = new Cliente(nome_cliente, cpf_cliente, email_cliente, genero_cliente, list_enderecos, data_nascimento_cliente, "ATIVO", "", usuario_cliente, senha_cliente, null, new Telefone(telefone_ddd_cliente, telefone_numero_cliente, telefone_tipo_cliente), null);	
		
		try {
			cliente.setId(Integer.parseInt(req.getParameter("id_cliente")));
		} catch (Exception e) {
			return cliente;
		}
		
		return cliente;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		if (resultado.getOperacao() != "CONSULTAR") {
			req.getSession().setAttribute("resultado", resultado);
			if(resultado.isSucesso()) {
				//Atribui mensagem de sucesso à página e REDIRECIONA para home para não alterar o estado do servidor
				try {
					resp.sendRedirect("sucesso.jsp");
					return;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				try {
					resp.sendRedirect("error.jsp");
					return;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			req.getSession().setAttribute("clientes", resultado);
			//Encaminha à página clientes
			try {
				req.getRequestDispatcher("admin_clientes.jsp").forward(req, resp);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
}

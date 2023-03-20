package ecommerce_les2023.controle.view;

import java.io.IOException;
import ecommerce_les2023.modelo.Cidade;
import ecommerce_les2023.modelo.Endereco;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Estado;
import ecommerce_les2023.modelo.Pais;
import ecommerce_les2023.utils.Resultado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AlterarEnderecoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio obterEntidade(HttpServletRequest req) {
		
		String tipo_endereco = req.getParameter("endereco_tipo");
		String endereco_frase = req.getParameter("endereco_" + tipo_endereco.toLowerCase() +"_frase_cliente");
		String endereco_residencia = req.getParameter("endereco_" + tipo_endereco.toLowerCase() +"_tipo_residencia_cliente");
		String endereco_cep = req.getParameter("endereco_" + tipo_endereco.toLowerCase() +"_cep_cliente");
		String endereco_tipo_logradouro = req.getParameter("endereco_" + tipo_endereco.toLowerCase() +"_tipo_logradouro_cliente");
		String endereco_logradouro = req.getParameter("endereco_" + tipo_endereco.toLowerCase() +"_logradouro_cliente");
		String endereco_numero = req.getParameter("endereco_" + tipo_endereco.toLowerCase() +"_numero_cliente");
		String endereco_bairro = req.getParameter("endereco_" + tipo_endereco.toLowerCase() +"_bairro_cliente");
		String endereco_cidade = req.getParameter("endereco_" + tipo_endereco.toLowerCase() +"_cidade_cliente");
		String endereco_estado = req.getParameter("endereco_" + tipo_endereco.toLowerCase() +"_estado_cliente");
		String endereco_pais = req.getParameter("endereco_" + tipo_endereco.toLowerCase() +"_pais_cliente");
		String endereco_observacao = req.getParameter("endereco_" + tipo_endereco.toLowerCase() +"_observacao_cliente");
		String id_cliente = req.getParameter("id_cliente");
				
		EntidadeDominio endereco = new Endereco(endereco_frase, endereco_logradouro, endereco_tipo_logradouro, endereco_numero, endereco_bairro, tipo_endereco, endereco_residencia, endereco_cep, new Cidade(endereco_cidade, new Estado(endereco_estado, new Pais(endereco_pais))), Integer.parseInt(id_cliente), endereco_observacao);
			
		return endereco;
	}
	
	@Override
	public void setView(Resultado resultado, HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().setAttribute("resultado", resultado);
		//Atribui mensagem de sucesso à página e REDIRECIONA para home para não alterar o estado do servidor
		try {
			resp.sendRedirect("resultado.jsp");
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

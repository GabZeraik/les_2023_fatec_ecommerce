package ecommerce_les2023.utils;

import java.util.List;

import com.google.gson.Gson;

import ecommerce_les2023.modelo.EntidadeDominio;

public class Resultado {
	private String mensagem;
	private boolean sucesso;
	private String operacao;
	private String nomeEntidade;
	private List<EntidadeDominio> dados;
	private String json;
	
	public Resultado(String mensagem, boolean sucesso, String operacao, String nomeEntidade, List<EntidadeDominio> dados){
		this.mensagem = mensagem;
		this.sucesso = sucesso;
		this.nomeEntidade = nomeEntidade;
		this.operacao = operacao;
		this.dados = dados;
		this.json = this.objetoToJson();
	}
	
	public Resultado() {
	}

	public String getMensagem() {
		return mensagem;
	}
	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	public boolean isSucesso() {
		return sucesso;
	}
	public String getOperacao() {
		return operacao;
	}

	public void setOperacao(String operacao) {
		this.operacao = operacao;
	}

	public String getNomeEntidade() {
		return nomeEntidade;
	}

	public void setNomeEntidade(String nomeEntidade) {
		this.nomeEntidade = nomeEntidade;
	}

	public List<EntidadeDominio> getDados() {
		return dados;
	}

	public void setDados(List<EntidadeDominio> dados) {
		this.dados = dados;
	}

	public void setSucesso(boolean sucesso) {
		this.sucesso = sucesso;
	}
	
	public String getJson() {
		return json;
	}

	public void setJson() {
		this.json = this.objetoToJson();
	}

	public String objetoToJson() {
		Gson gson = new Gson();
		String json = gson.toJson(this);
		return json;
	}
	
	@Override
	public String toString() {
		return this.json;
	}
}

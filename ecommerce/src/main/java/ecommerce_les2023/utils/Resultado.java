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
	private List<EntidadeDominio> bandeiras;
	private List<EntidadeDominio> fretes;
	private String json;
	private String json_dados;

	public Resultado(String mensagem, boolean sucesso, String operacao, String nomeEntidade, List<EntidadeDominio> dados, List<EntidadeDominio> bandeiras, List<EntidadeDominio> fretes){
		this.mensagem = mensagem;
		this.sucesso = sucesso;
		this.nomeEntidade = nomeEntidade;
		this.operacao = operacao;
		this.dados = dados;
		this.bandeiras = bandeiras;
		this.fretes = fretes;
		this.setJson();
		this.setJson_dados();
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
	
	public List<EntidadeDominio> getBandeiras() {
		return bandeiras;
	}

	public void setBandeiras(List<EntidadeDominio> bandeiras) {
		this.bandeiras = bandeiras;
	}

	public void setSucesso(boolean sucesso) {
		this.sucesso = sucesso;
	}
	
	public List<EntidadeDominio> getFretes() {
		return fretes;
	}

	public void setFretes(List<EntidadeDominio> fretes) {
		this.fretes = fretes;
	}
	
	public String getJson() {
		return json;
	}

	public void setJson() {
		this.json = "";
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
	
	public String getJson_dados() {
		return json_dados;
	}

	public void setJson_dados() {
		this.json_dados = "[";
		for(int i = 0; i < this.dados.size(); i++){
			if(i != this.dados.size() - 1) {
				this.json_dados += this.dados.get(i).objetoToJson() + ',';
			}else this.json_dados += this.dados.get(i).objetoToJson();
		}
		this.json_dados += "]";
	}
}

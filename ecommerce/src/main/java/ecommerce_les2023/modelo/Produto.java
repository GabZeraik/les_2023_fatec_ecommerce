package ecommerce_les2023.modelo;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.google.gson.Gson;

public class Produto extends EntidadeDominio {
	
	private String codigo;
	private String nome;
	private String tamanho;
	private String cor;
	private String genero;
	private String grupo_preco;
	private float preco_atual;
	private String codigo_barras;
	private String justificativa;
	private List<Categoria> categoria;
	private String json;
	
	public Produto() {};
	
	public Produto(String codigo, String nome, String tamanho, String cor, String genero, String grupo_preco,
			float preco_atual, String codigo_barras, String justificativa) {
		this.codigo = codigo;
		this.nome = nome;
		this.tamanho = tamanho;
		this.cor = cor;
		this.genero = genero;
		this.grupo_preco = grupo_preco;
		this.preco_atual = preco_atual;
		this.codigo_barras = codigo_barras;
		this.justificativa = justificativa;
		this.codigo = gerarCodigoUnico();
	}
	
	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTamanho() {
		return tamanho;
	}

	public void setTamanho(String tamanho) {
		this.tamanho = tamanho;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getGrupo_preco() {
		return grupo_preco;
	}

	public void setGrupo_preco(String grupo_preco) {
		this.grupo_preco = grupo_preco;
	}
	
	public float getPreco_atual() {
		return preco_atual;
	}
	
	public void setPreco_atual(float preco_atual) {
		this.preco_atual = preco_atual;
	}
	
	public String getCodigo_barras() {
		return codigo_barras;
	}
	
	public void setCodigo_barras(String codigo_barras) {
		this.codigo_barras = codigo_barras;
	}
	
	public String getJustificativa() {
		return justificativa;
	}
	
	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}
	
	public List<Categoria> getCategoria() {
		return categoria;
	}

	public void setCategoria(List<Categoria> categoria) {
		this.categoria = categoria;
	}

	public String gerarCodigoUnico() {
		UUID codigo_unico = UUID.randomUUID();
		return codigo_unico.toString();
	}

	public String getJson() {
		return this.json;
	}

	public void setJson() {
		this.json = this.objetoToJson();
	}

	public String objetoToJson() {
		Gson gson = new Gson();
		String json = gson.toJson(this);
		return json;
	}
	
	public void adicionaCategoria(Categoria categoria) {
		if(this.categoria == null) {
			this.categoria = new ArrayList<Categoria>();
		}
		this.categoria.add(categoria);
	}
}

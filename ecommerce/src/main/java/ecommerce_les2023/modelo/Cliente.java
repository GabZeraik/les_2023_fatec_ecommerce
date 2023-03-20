package ecommerce_les2023.modelo;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.google.gson.Gson;

public class Cliente extends Pessoa {
	
	private String dta_nascimento;
	private String codigo;
	private String situacao;
	private String ranking;
	private String usuario;
	private String senha;
	private String justificativa;
	private Cartao cartao;
	private Telefone telefone;
	private Cupom cupom;
	private String json;
	
	public Cliente(String nome, String cpf, String email, String genero, List<Endereco> enderecos, String dta_nascimento, String situacao, String ranking, String usuario, String senha, Cartao cartao,
			Telefone telefone, Cupom cupom) {
		super.nome = nome;
		super.cpf = cpf;
		super.email = email;
		super.genero = genero;
		super.endereco = enderecos;
		
		this.dta_nascimento = dta_nascimento;
		this.situacao = situacao;
		this.ranking = ranking;
		this.usuario = usuario;
		this.senha = senha;
		this.cartao = cartao;
		this.telefone = telefone;
		this.cupom = cupom;
		this.codigo = gerarCodigoUnico();
	}
	/*Usado para alterar cadastro parcial***/
	public Cliente(String nome, String cpf, String email, String genero, String dta_nascimento, String usuario, String senha, Telefone telefone) {
		super.nome = nome;
		super.cpf = cpf;
		super.email = email;
		super.genero = genero;
		
		this.dta_nascimento = dta_nascimento;
		this.usuario = usuario;
		this.senha = senha;
		this.telefone = telefone;
		this.codigo = gerarCodigoUnico();
	}
	
	/*Usado para alterar entrar***/
	public Cliente(String email, String senha) {
		super.email = email;
		this.senha = senha;
	}
	
	public Cliente() {};
	
	public String getDta_nascimento() {
		return dta_nascimento;
	}


	public void setDta_nascimento(String dta_nascimento) {
		this.dta_nascimento = dta_nascimento;
	}


	public String getCodigo() {
		return codigo;
	}


	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}


	public String getSituacao() {
		return situacao;
	}


	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}


	public String getRanking() {
		return ranking;
	}


	public void setRanking(String ranking) {
		this.ranking = ranking;
	}


	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getJustificativa() {
		return justificativa;
	}

	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}

	public Cartao getCartao() {
		return cartao;
	}


	public void setCartao(Cartao cartao) {
		this.cartao = cartao;
	}


	public Telefone getTelefone() {
		return telefone;
	}


	public void setTelefone(Telefone telefone) {
		this.telefone = telefone;
	}


	public Cupom getCupom() {
		return cupom;
	}


	public void setCupom(Cupom cupom) {
		this.cupom = cupom;
	}
	
	public String gerarCodigoUnico() {
		UUID codigo_unico = UUID.randomUUID();
		return codigo_unico.toString();
	}

	public void adicionaEndereco(Endereco end) {
		if(this.endereco == null) {
			this.endereco = new ArrayList<Endereco>();
		}
		this.endereco.add(end);
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
}

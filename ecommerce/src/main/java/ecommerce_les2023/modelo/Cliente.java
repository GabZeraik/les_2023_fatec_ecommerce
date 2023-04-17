package ecommerce_les2023.modelo;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class Cliente extends Pessoa {
	
	private String dta_nascimento;
	private String codigo;
	private String situacao;
	private String ranking;
	private String usuario;
	private String senha;
	private String justificativa;
	private Telefone telefone;
	private List<Cupom> cupom;
	private List<Cartao> cartao;
	private List<Pedido> pedido;
	
	public Cliente(String nome, String cpf, String email, String genero, List<Endereco> enderecos, String dta_nascimento, String situacao, String ranking, String usuario, String senha, Cartao cartao,
			Telefone telefone) {
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
		this.telefone = telefone;
		
		this.adicionaCartao(cartao);
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

	public Telefone getTelefone() {
		return telefone;
	}


	public void setTelefone(Telefone telefone) {
		this.telefone = telefone;
	}


	public List<Cupom> getCupom() {
		return cupom;
	}


	public void setCupom(List<Cupom> cupom) {
		this.cupom = cupom;
	}
	
	public List<Cartao> getCartao() {
		return cartao;
	}
	public void setCartao(List<Cartao> cartao) {
		this.cartao = cartao;
	}
	
	public List<Pedido> getPedido() {
		return pedido;
	}
	
	public void setPedido(List<Pedido> pedido) {
		this.pedido = pedido;
	}
	
	public void adicionaPedido(Pedido pedido) {
		if(this.pedido == null) {
			this.pedido = new ArrayList<Pedido>();
		}
		this.pedido.add(pedido);
		
	}

	public void adicionaEndereco(Endereco end) {
		if(this.endereco == null) {
			this.endereco = new ArrayList<Endereco>();
		}
		this.endereco.add(end);
	}
	
	public void adicionaCartao(Cartao cartao) {
		if(this.cartao == null) {
			this.cartao = new ArrayList<Cartao>();
		}
		this.cartao.add(cartao);
	}
	
	public void adicionaCupom(Cupom cupom) {
		if(this.cupom == null) {
			this.cupom = new ArrayList<Cupom>();
		}
		this.cupom.add(cupom);
	}
	
	public String gerarCodigoUnico() {
		UUID codigo_unico = UUID.randomUUID();
		return codigo_unico.toString();
	}
	
}

package ecommerce_les2023.modelo;

public class Cartao extends EntidadeDominio {
	
	private String numero;
	private String nome_impresso;
	private String validade;
	private String cod_seguranca;
	private String preferencial;
	private Bandeira bandeira;
	private int cliente_id;
	
	public Cartao(String numero, String nome_impresso, String validade, String cod_seguranca, String preferencial, Bandeira bandeira, int cliente_id) {
		this.numero = numero;
		this.nome_impresso = nome_impresso;
		this.validade = validade;
		this.cod_seguranca = cod_seguranca;
		this.preferencial = preferencial;
		this.bandeira = bandeira;
		this.cliente_id = cliente_id;
	}
	
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getNome_impresso() {
		return nome_impresso;
	}
	public void setNome_impresso(String nome_impresso) {
		this.nome_impresso = nome_impresso;
	}
	public String getCod_seguranca() {
		return cod_seguranca;
	}
	public void setCod_seguranca(String cod_seguranca) {
		this.cod_seguranca = cod_seguranca;
	}
	public String getPreferencial() {
		return preferencial;
	}
	public void setPreferencial(String preferencial) {
		this.preferencial = preferencial;
	}
	public Bandeira getBandeira() {
		return bandeira;
	}
	public void setBandeira(Bandeira bandeira) {
		this.bandeira = bandeira;
	}

	public int getCliente_id() {
		return cliente_id;
	}

	public void setCliente_id(int cliente_id) {
		this.cliente_id = cliente_id;
	}

	public String getValidade() {
		return validade;
	}

	public void setValidade(String validade) {
		this.validade = validade;
	}
}

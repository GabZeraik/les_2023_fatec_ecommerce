package ecommerce_les2023.modelo;

public class Cartao {
	
	private String numero;
	private String nome_impresso;
	private String cod_seguranca;
	private Boolean preferencial;
	private Bandeira bandeira;
	
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
	public Boolean getPreferencial() {
		return preferencial;
	}
	public void setPreferencial(Boolean preferencial) {
		this.preferencial = preferencial;
	}
	public Bandeira getBandeira() {
		return bandeira;
	}
	public void setBandeira(Bandeira bandeira) {
		this.bandeira = bandeira;
	}
}

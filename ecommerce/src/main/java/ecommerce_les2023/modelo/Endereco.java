package ecommerce_les2023.modelo;

public class Endereco extends EntidadeDominio{

	private String frase;
	private String cep;
	private String logradouro;
	private String tipo_logradouro;
	private String numero;
	private String bairro;
	private String tipo;
	private String residencia;
	private Cidade cidade;
	private int cliente_id;
	private String observacao;
	
	public Endereco(String frase, String logradouro, String tipo_logradouro, String numero, String bairro, String tipo, String residencia, String cep, Cidade cidade, int cliente_id, String observacao) {
		this.frase = frase;
		this.cep = cep;
		this.logradouro = logradouro;
		this.tipo_logradouro = tipo_logradouro;
		this.numero = numero;
		this.bairro = bairro;
		this.tipo = tipo;
		this.residencia = residencia;
		this.cidade = cidade;
		this.cliente_id = cliente_id;
		this.observacao = observacao;
	}
	
	public Endereco() {
	}

	public String getFrase() {
		return frase;
	}

	public void setFrase(String frase) {
		this.frase = frase;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	
	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getBairro() {
		return bairro;
	}
	
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	
	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getResidencia() {
		return residencia;
	}

	public void setResidencia(String residencia) {
		this.residencia = residencia;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}
	
	public int getCliente_id() {
		return cliente_id;
	}

	public void setCliente_id(int cliente_id) {
		this.cliente_id = cliente_id;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	
	public String getTipo_logradouro() {
		return tipo_logradouro;
	}

	public void setTipo_logradouro(String tipo_logradouro) {
		this.tipo_logradouro = tipo_logradouro;
	}
	
	@Override
	public String toString() {
		return this.logradouro + ", " + this.bairro + ", " + this.cidade.getNome_cidade() + " - " + this.cidade.getEstado().getSigla();
	}
}

package ecommerce_les2023.modelo;

public class Endereco {

	private String logradouro;
	private String bairro;
	private String cep;
	private Cidade cidade;
	
	public Endereco(String logradouro, String bairro, String cep, Cidade cidade) {
		this.logradouro = logradouro;
		this.bairro = bairro;
		this.cep = cep;
		this.cidade = cidade;
	}
	
	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getBairro() {
		return bairro;
	}
	
	public void setBairro(String bairro) {
		this.bairro = bairro;
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
	
	@Override
	public String toString() {
		return this.logradouro + ", " + this.bairro + ", " + this.cidade.getNome_cidade() + " - " + this.cidade.getEstado().getSigla();
	}
}

package ecommerce_les2023.modelo;

public class Curso extends EntidadeDominio {

	private String nome_curso;
	private String descricao;
	private String periodo;
	
	public Curso(String nome_curso, String descricao, String periodo) {
		this.nome_curso = nome_curso;
		this.descricao = descricao;
		this.periodo = periodo;
	}

	public Curso() {}

	public String getNome_curso() {
		return nome_curso;
	}

	public String getDescricao() {
		return descricao;
	}

	public String getPeriodo() {
		return periodo;
	}
	
	public void setNome_curso(String nome_curso) {
		this.nome_curso = nome_curso;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}
	
	@Override
	public String toString() {
		return "ID: " + this.id + " - " + this.nome_curso + "(" + this.periodo + ")";
	}
}

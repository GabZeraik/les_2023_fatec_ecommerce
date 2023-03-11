package ecommerce_les2023.modelo;

public class Aluno extends Pessoa {
	
	private String dta_nascimento;
	private String registro_aluno;
	private Curso curso;
	
	public Aluno(String nome, String cpf, String email, String dta_nascimento, String registro_aluno, Curso curso, Endereco endereco) {
		this.nome = nome;
		this.cpf = cpf;
		this.email = email;
		this.dta_nascimento = dta_nascimento;
		this.registro_aluno = registro_aluno;
		this.curso = curso;
		this.endereco = endereco;
	}
	
	public Aluno() {}

	public String getNome() {
		return nome;
	}
	
	public String getCpf() {
		return cpf;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getDta_nascimento() {
		return dta_nascimento;
	}

	public String getRegistro_aluno() {
		return registro_aluno;
	}

	public Curso getCurso() {
		return curso;
	}	
	
	public void setDta_nascimento(String dta_nascimento) {
		this.dta_nascimento = dta_nascimento;
	}

	public void setRegistro_aluno(String registro_aluno) {
		this.registro_aluno = registro_aluno;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	
	@Override
	public String toString() {
		return this.registro_aluno + " - " + this.nome;
	}

}

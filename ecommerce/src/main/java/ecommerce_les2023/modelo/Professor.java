package ecommerce_les2023.modelo;

import java.util.ArrayList;
import java.util.List;

public class Professor extends Pessoa {

	private String registro_professor;
	private List<Curso> cursos = new ArrayList<Curso>();
	
	public Professor(String nome, String cpf, String email, String registro_professor, Curso curso_1, Curso curso_2, Endereco endereco) {
		this.nome = nome;
		this.cpf = cpf;
		this.email = email;
		this.registro_professor = registro_professor;
		this.endereco = endereco;
		this.cursos.add(curso_1);
		this.cursos.add(curso_2);
	}
	
	public Professor() {}

	public String getNome() {
		return nome;
	}
	
	public String getCpf() {
		return cpf;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getRegistro_professor() {
		return registro_professor;
	}

	public List<Curso> getCursos() {
		return cursos;
	}

	public void setRegistro_professor(String registro_professor) {
		this.registro_professor = registro_professor;
	}

	public void setCursos(List<Curso> cursos) {
		this.cursos = cursos;
	}
	
	@Override
	public String toString() {
		return this.registro_professor + " - " + this.nome;
	}
}

package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.Aluno;
import ecommerce_les2023.modelo.Cidade;
import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.Endereco;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Estado;
import ecommerce_les2023.utils.Log;

public class ClienteDAO extends AbstractDAO {
	
	public ClienteDAO() {
		super("clientes", "cli_id");
	}

	@Override
	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		Cliente cliente = (Cliente) entidade;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ");
			sb.append(this.tabela);
			sb.append("(cli_codigo, cli_usuario, cli_senha, cli_situacao, cli_nome_completo, cli_genero, cli_data_nascimento, cli_cpf, cli_email, cli_ddd_telefone, cli_numero_telefone, cli_tipo_telefone, cli_ranking)");
			sb.append("VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			comandoSQL = this.conexao.prepareStatement(sb.toString(), Statement.RETURN_GENERATED_KEYS);
			comandoSQL.setString(1, cliente.getCodigo());
			comandoSQL.setString(2, cliente.getUsuario());
			comandoSQL.setString(3, cliente.getSenha());
			comandoSQL.setString(4, cliente.getSituacao());
			comandoSQL.setString(5, cliente.getNome());
			comandoSQL.setString(6, cliente.getGenero());
			comandoSQL.setString(7, cliente.getDta_nascimento());
			comandoSQL.setString(8, cliente.getCpf());
			comandoSQL.setString(9, cliente.getEmail());
			comandoSQL.setString(10, cliente.getTelefone().getDdd());
			comandoSQL.setString(11, cliente.getTelefone().getNumero());
			comandoSQL.setString(12, cliente.getTelefone().getTipo());
			comandoSQL.setString(13, cliente.getRanking());
			
			comandoSQL.executeUpdate();
			
			conexao.commit();
			
			ResultSet keysTabela = comandoSQL.getGeneratedKeys();
			int id = 0;
			if(keysTabela.next())
				id = keysTabela.getInt(1);
			cliente.setId(id);
			
			List<Endereco> endereco = cliente.getEndereco();
			for (Endereco end : endereco) {
				end.setCliente_id(cliente.getId());
				EnderecoDAO enderecoDAO = new EnderecoDAO(conexao);
				enderecoDAO.ctrlTransaction = false;
				enderecoDAO.salvar(end);
			}
			
			System.out.println(new Log().gerarLog(cliente, "Cadastro"));
			
		} catch (SQLException e) {
			try {
				conexao.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try {
				comandoSQL.close();
				conexao.close();
				System.out.println("CONEXÃO FINALIZADA!");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public void alterar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		return null;
	}

	/*@Override
	public void alterar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		Aluno aluno = (Aluno) entidade;
		
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE ");
			sb.append(this.tabela);
			sb.append(" SET alu_nome = ?, alu_cpf = ?, alu_email = ?, alu_dta_nasc = ?, alu_registro = ?, alu_logradouro = ?, alu_bairro = ?, alu_cep = ?, alu_cidade = ?, alu_estado = ?, alu_dta_cad = ?, curso_id = ?");
			sb.append(" WHERE ");
			sb.append(this.idTabela + " = ?;");
					
			Timestamp ts = Timestamp.from(aluno.getDta_cadastro().toInstant());
			comandoSQL = this.conexao.prepareStatement(sb.toString());
			comandoSQL.setString(1, aluno.getNome());
			comandoSQL.setString(2, aluno.getCpf());
			comandoSQL.setString(3, aluno.getEmail());
			comandoSQL.setString(4, aluno.getDta_nascimento());
			comandoSQL.setString(5, aluno.getRegistro_aluno());
			comandoSQL.setString(6, aluno.getEndereco().getLogradouro());
			comandoSQL.setString(7, aluno.getEndereco().getBairro());
			comandoSQL.setString(8, aluno.getEndereco().getCep());
			comandoSQL.setString(9, aluno.getEndereco().getCidade().getNome_cidade());
			comandoSQL.setString(10, aluno.getEndereco().getCidade().getEstado().getSigla());
			comandoSQL.setTimestamp(11, ts, aluno.getDta_cadastro());
			comandoSQL.setInt(12, aluno.getCurso().getId());
			comandoSQL.setInt(13, aluno.getId());
			comandoSQL.executeUpdate();
			
			conexao.commit();			
			System.out.println(new Log().gerarLog(aluno, "ALTERAÇÃO"));
			
		} catch (SQLException e) {
			try {
				conexao.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try {
				comandoSQL.close();
				conexao.close();
				System.out.println("CONEXÃO FINALIZADA!");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	*/
	/*
	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		List<EntidadeDominio> alunos = new ArrayList<EntidadeDominio>();
		String camposPesquisados = "CONSULTA ID: " 
				+ null 
				+ "; NOME: " 
				+ null 
				+ "; CPF: " 
				+ null
				+ "; EMAIL: " 
				+ null
				+ "; CURSO ID: " 
				+ null;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * FROM ");
			sb.append(this.tabela);
			
			if(entidade != null) {
				
				Aluno aluno = (Aluno) entidade;
				camposPesquisados = "CONSULTA ID: " 
						+ aluno.getId() 
						+ "; NOME: " 
						+ aluno.getNome() 
						+ "; CPF: " 
						+ aluno.getCpf()
						+ "; EMAIL: " 
						+ aluno.getEmail()
						+ "; CURSO: " 
						+ aluno.getRegistro_aluno();
				
				sb.append(" INNER JOIN cursos ON alunos.curso_id = cursos.cur_id ");
				
					//Pesquisa por id do aluno ou
					//pelo cpf ou
					//pelo curso ou
					//pelo nome ou pelo email
				 
				
				if(entidade != null) {
					if(aluno.getId() != 0) {
						sb.append(" WHERE ");
						sb.append(this.idTabela);
						sb.append(" = ?");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setInt(1, aluno.getId());
					}else if(aluno.getCpf() != null && aluno.getCpf() != "") {
						sb.append(" WHERE ");
						sb.append(" alu_cpf = ? ");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setString(1, aluno.getCpf());	
					}else if(aluno.getCurso().getNome_curso() != "" && aluno.getCurso().getNome_curso() != null){
						sb.append(" WHERE ");
						sb.append(" LOWER(cursos.cur_nome) LIKE LOWER(?)");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setString(1, "%" + aluno.getCurso().getNome_curso() + "%" );
					}else if(aluno.getCurso().getId() != 0){
						sb.append(" WHERE ");
						sb.append(" cursos.cur_id = ?");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setInt(1, aluno.getCurso().getId());
					}else if(aluno.getNome() != "" && aluno.getNome() != null){
						sb.append(" WHERE ");
						sb.append(" alu_nome LIKE ?");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setString(1, "%" + aluno.getNome() + "%");
					}else if(aluno.getEmail() != "" && aluno.getEmail() != "") {
						sb.append(" WHERE ");
						sb.append(" alu_email LIKE ?");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setString(1, "%" + aluno.getEmail() + "%");
					}else {
						comandoSQL = this.conexao.prepareStatement(sb.toString());
					}
				}
				
				sb.append(" ORDER BY alu_dta_cad ASC;");
					
				System.out.println(comandoSQL);
				ResultSet rs = comandoSQL.executeQuery();
				
				while (rs.next()) {
					Aluno alu = new Aluno();
					Curso curso = new Curso(rs.getString("cur_nome"), rs.getString("cur_descricao"), rs.getString("cur_periodo"));
					curso.setId(rs.getInt("cur_id"));
					
					alu.setId(rs.getInt("alu_id"));
					alu.setNome(rs.getString("alu_nome"));
					alu.setCpf(rs.getString("alu_cpf"));
					alu.setEmail(rs.getString("alu_email"));
					alu.setDta_nascimento(rs.getString("alu_dta_nasc"));
					alu.setRegistro_aluno(rs.getString("alu_registro"));
					//alu.setEndereco(new Endereco(rs.getString("alu_logradouro"), rs.getString("alu_bairro"), rs.getString("alu_cep"), new Cidade(rs.getString("alu_cidade"), new Estado(rs.getString("alu_estado")))));
					alu.setCurso(curso);
					alu.setDta_cadastro(rs.getTimestamp("alu_dta_cad").getTime());
					
					alunos.add(alu);
				}				
			}
			System.out.println(new Log().gerarLog(alunos, camposPesquisados));
			
		} catch (SQLException e) {
			try {
				conexao.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try {
				comandoSQL.close();
				conexao.close();
				System.out.println("CONEXÃO FINALIZADA!");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return alunos;
	}*/
}

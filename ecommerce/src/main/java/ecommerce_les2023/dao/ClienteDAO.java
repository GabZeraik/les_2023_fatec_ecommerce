package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.Cidade;
import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.Endereco;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Estado;
import ecommerce_les2023.modelo.Pais;
import ecommerce_les2023.modelo.Telefone;
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
		openConnection();
		PreparedStatement comandoSQL = null;
		Cliente cliente = (Cliente) entidade;
		
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE ");
			sb.append(this.tabela);
			
			if(cliente.getEndereco() == null) {
				if(cliente.getSituacao() == null) {
					sb.append(" SET cli_usuario = ?, cli_senha = ?, cli_nome_completo = ?, cli_genero = ?, cli_data_nascimento = ?, cli_cpf = ?, cli_email = ?, cli_ddd_telefone = ?, cli_numero_telefone = ?, cli_tipo_telefone = ?");
					sb.append(" WHERE ");
					sb.append(this.idTabela + " = ?;");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setString(1, cliente.getUsuario());
					comandoSQL.setString(2, cliente.getSenha());
					comandoSQL.setString(3, cliente.getNome());
					comandoSQL.setString(4, cliente.getGenero());
					comandoSQL.setString(5, cliente.getDta_nascimento());
					comandoSQL.setString(6, cliente.getCpf());
					comandoSQL.setString(7, cliente.getEmail());
					comandoSQL.setString(8, cliente.getTelefone().getDdd());
					comandoSQL.setString(9, cliente.getTelefone().getNumero());
					comandoSQL.setString(10, cliente.getTelefone().getTipo());
					comandoSQL.setInt(11, cliente.getId());
				}else{
					sb.append(" SET cli_situacao = ?, cli_justificativa = ?");
					sb.append(" WHERE ");
					sb.append(this.idTabela + " = ?;");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setString(1, cliente.getSituacao());
					comandoSQL.setString(2, cliente.getJustificativa());
					comandoSQL.setInt(3, cliente.getId());
				}
			}else {
				//alteração total de cadastro
			}
			comandoSQL.executeUpdate();
			
			conexao.commit();			
			System.out.println(new Log().gerarLog(cliente, "ALTERAÇÃO"));
			
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
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		List<EntidadeDominio> clientes = new ArrayList<EntidadeDominio>();
		String camposPesquisados = "CONSULTA ID: " 
				+ null 
				+ "; NOME: " 
				+ null 
				+ "; CPF: " 
				+ null
				+ "; EMAIL: " 
				+ null;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * FROM ");
			sb.append(this.tabela);
			
			if(entidade != null) {
				Cliente cliente = (Cliente) entidade;
				camposPesquisados = "CONSULTA ID: " 
						+ cliente.getId() 
						+ "; NOME: " 
						+ cliente.getNome() 
						+ "; CPF: " 
						+ cliente.getCpf()
						+ "; EMAIL: " 
						+ cliente.getEmail() + " ; ";
				
				sb.append(" INNER JOIN enderecos ON clientes.cli_id = enderecos.clientes_cli_id");
				
					//Pesquisa por id do cliente ou
					//pelo cpf ou
					//pelo nome ou pelo email
				 
				
				if(entidade != null) {
					if(cliente.getId() != 0) {
						sb.append(" WHERE ");
						sb.append(this.idTabela);
						sb.append(" = ?");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setInt(1, cliente.getId());
					}else if(cliente.getCpf() != null && cliente.getCpf() != "") {
						sb.append(" WHERE ");
						sb.append("cli_cpf = ? ");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setString(1, cliente.getCpf());	
					}else if(cliente.getNome() != "" && cliente.getNome() != null){
						sb.append(" WHERE ");
						sb.append("cli_nome_completo LIKE ?");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setString(1, "%" + cliente.getNome() + "%");
					}else if(cliente.getEmail() != "" && cliente.getEmail() != "") {
						sb.append(" WHERE ");
						sb.append("cli_email LIKE ?");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setString(1, "%" + cliente.getEmail() + "%");
					}else {
						comandoSQL = this.conexao.prepareStatement(sb.toString());
					}
				}
				
				sb.append(" ORDER BY cli_id ASC;");
					
				System.out.println(comandoSQL);
				ResultSet rs = comandoSQL.executeQuery();
				Cliente cli = null;
				
				while (rs.next()) {
					if(rs.isFirst()) {
						cli = criaClienteResultSet(rs);
						Endereco end = new Endereco(rs.getString("end_frase"), rs.getString("end_logradouro"), rs.getString("end_tipo_logradouro"), rs.getString("end_numero"), rs.getString("end_bairro"), rs.getString("end_tipo"), rs.getString("end_residencia"), rs.getString("end_cep"), new Cidade(rs.getString("end_cidade"), new Estado(rs.getString("end_estado"), new Pais(rs.getString("end_pais")))), rs.getInt("clientes_cli_id"), rs.getString("end_observacao"));
						end.setId(rs.getInt("end_id"));
						cli.adicionaEndereco(end);
						System.out.println(cli);
						continue;
					}
					System.out.println("CONTINUOU SIM");
					Cliente proximo_cli = new Cliente();
					proximo_cli.setId(rs.getInt("cli_id"));
					if(proximo_cli.getId() == cli.getId()) {
						Endereco end = new Endereco(rs.getString("end_frase"), rs.getString("end_logradouro"), rs.getString("end_tipo_logradouro"), rs.getString("end_numero"), rs.getString("end_bairro"), rs.getString("end_tipo"), rs.getString("end_residencia"), rs.getString("end_cep"), new Cidade(rs.getString("end_cidade"), new Estado(rs.getString("end_estado"), new Pais(rs.getString("end_pais")))), rs.getInt("clientes_cli_id"), rs.getString("end_observacao"));
						end.setId(rs.getInt("end_id"));
						cli.adicionaEndereco(end);
					}else {
						clientes.add(cli);
						cli = criaClienteResultSet(rs);
					}
					if(rs.isLast()) {
						clientes.add(cli);
					}
				}				
			}
			System.out.println(new Log().gerarLog(clientes, camposPesquisados));
			
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
		
		return clientes;
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
	
	private Cliente criaClienteResultSet(ResultSet rs) throws SQLException {
		Cliente cli = new Cliente();
		cli.setId(rs.getInt("cli_id"));
		cli.setUsuario(rs.getString("cli_usuario"));
		cli.setSenha(rs.getString("cli_senha"));
		cli.setNome(rs.getString("cli_nome_completo"));
		cli.setCpf(rs.getString("cli_cpf"));
		cli.setEmail(rs.getString("cli_email"));
		cli.setDta_nascimento(rs.getString("cli_data_nascimento"));
		cli.setCodigo(rs.getString("cli_codigo"));
		cli.setGenero(rs.getString("cli_genero"));
		cli.setRanking(rs.getString("cli_ranking"));
		cli.setSituacao(rs.getString("cli_situacao"));
		cli.setTelefone(new Telefone(rs.getString("cli_ddd_telefone"), rs.getString("cli_numero_telefone"), rs.getString("cli_tipo_telefone")));
		cli.setJustificativa(rs.getString("cli_justificativa"));
		return cli;
	}
}

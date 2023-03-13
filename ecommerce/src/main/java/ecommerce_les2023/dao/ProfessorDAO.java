package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.Cidade;
import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.Endereco;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Estado;
import ecommerce_les2023.modelo.Professor;
import ecommerce_les2023.utils.Log;

public class ProfessorDAO extends AbstractDAO {

	public ProfessorDAO() {
		super("professores", "pro_id");
	}

	@Override
	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		Professor professor = (Professor) entidade;
		
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ");
			sb.append(this.tabela);
			sb.append("(pro_nome, pro_cpf, pro_email, pro_registro, pro_logradouro, pro_bairro, pro_cep, pro_cidade, pro_estado, pro_dta_cad, curso_1_id, curso_2_id)");
			sb.append("VALUES (?,?,?,?,?,?,?,?,?,?,?, ?)");
					
			Timestamp ts = Timestamp.from(professor.getDta_cadastro().toInstant());
			comandoSQL = this.conexao.prepareStatement(sb.toString());
			comandoSQL.setString(1, professor.getNome());
			comandoSQL.setString(2, professor.getCpf());
			comandoSQL.setString(3, professor.getEmail());
			comandoSQL.setString(4, professor.getRegistro_professor());
			comandoSQL.setString(5, professor.getEndereco().getLogradouro());
			comandoSQL.setString(6, professor.getEndereco().getBairro());
			comandoSQL.setString(7, professor.getEndereco().getCep());
			comandoSQL.setString(8, professor.getEndereco().getCidade().getNome_cidade());
			comandoSQL.setString(9, professor.getEndereco().getCidade().getEstado().getSigla());
			comandoSQL.setTimestamp(10, ts, professor.getDta_cadastro());
			comandoSQL.setInt(11, professor.getCursos().get(0).getId());
			
			if(professor.getCursos().get(1).getId() == 0) comandoSQL.setNull(12, java.sql.Types.INTEGER);
			else comandoSQL.setInt(12, professor.getCursos().get(1).getId());
			
			comandoSQL.executeUpdate();
			
			conexao.commit();
			
			ResultSet keysTabela = comandoSQL.getGeneratedKeys();
			int id = 0;
			if(keysTabela.next())
				id = keysTabela.getInt(1);
			professor.setId(id);
			
			System.out.println(new Log().gerarLog(professor, "Cadastro"));
			
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
		Professor professor = (Professor) entidade;
		
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE ");
			sb.append(this.tabela);
			sb.append(" SET pro_nome = ?, pro_cpf = ?, pro_email = ?, pro_registro = ?, pro_logradouro = ?, pro_bairro = ?, pro_cep = ?, pro_cidade = ?, pro_estado = ?, pro_dta_cad = ?, curso_1_id = ?, curso_2_id = ?");
			sb.append(" WHERE ");
			sb.append(this.idTabela + " = ?;");
					
			Timestamp ts = Timestamp.from(professor.getDta_cadastro().toInstant());
			comandoSQL = this.conexao.prepareStatement(sb.toString());
			comandoSQL.setString(1, professor.getNome());
			comandoSQL.setString(2, professor.getCpf());
			comandoSQL.setString(3, professor.getEmail());
			comandoSQL.setString(4, professor.getRegistro_professor());
			comandoSQL.setString(5, professor.getEndereco().getLogradouro());
			comandoSQL.setString(6, professor.getEndereco().getBairro());
			comandoSQL.setString(7, professor.getEndereco().getCep());
			comandoSQL.setString(8, professor.getEndereco().getCidade().getNome_cidade());
			comandoSQL.setString(9, professor.getEndereco().getCidade().getEstado().getSigla());
			comandoSQL.setTimestamp(10, ts, professor.getDta_cadastro());
			comandoSQL.setInt(11, professor.getCursos().get(0).getId());
			comandoSQL.setInt(12, professor.getCursos().get(1).getId());
			comandoSQL.setInt(13, professor.getId());
			comandoSQL.executeUpdate();
			
			conexao.commit();			
			System.out.println(new Log().gerarLog(professor, "ALTERAÇÃO"));
			
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
		List<EntidadeDominio> professores = new ArrayList<EntidadeDominio>();
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
			sb.append("SELECT professores.*, curso1.*, curso2.cur_id as cur_2_id, curso2.cur_dta_cad as cur_2_dta_cad, curso2.cur_nome as cur_2_nome, curso2.cur_descricao as cur_2_descricao, curso2.cur_periodo as cur_2_periodo FROM ");
			sb.append(this.tabela);
			
			if(entidade != null) {
				
				Professor professor = (Professor) entidade;
				camposPesquisados = "CONSULTA ID: " 
						+ professor.getId() 
						+ "; NOME: " 
						+ professor.getNome() 
						+ "; CPF: " 
						+ professor.getCpf()
						+ "; EMAIL: " 
						+ professor.getEmail()
						+ "; CURSOS: " 
						+ professor.getCursos().toString();
				
				sb.append(" INNER JOIN cursos curso1 ON curso_1_id = curso1.cur_id LEFT JOIN cursos curso2 ON curso_2_id = curso2.cur_id");
				
				/*Pesquisa por id do professor ou
				 * pelo cpf ou
				 * pelo curso e pelo nome ou
				 * pelo nome ou pelo email
				 */
				
				if(professor.getId() != 0) {
					sb.append(" WHERE ");
					sb.append(this.idTabela);
					sb.append(" = ?");
					sb.append(" ORDER BY pro_dta_cad ASC;");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setInt(1, professor.getId());
				}else if(professor.getCpf() != null && professor.getCpf() != "") {
					sb.append(" WHERE ");
					sb.append(" pro_cpf = ? ");
					sb.append(" ORDER BY pro_dta_cad ASC;");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setString(1, professor.getCpf());
				}else if(professor.getCursos().get(0).getNome_curso() != "" && professor.getCursos().get(0).getNome_curso() != null){
					sb.append(" WHERE ");
					if(professor.getCursos().get(1).getNome_curso() != "" && professor.getCursos().get(1).getNome_curso() != null) {
						sb.append(" LOWER(curso1.cur_nome) LIKE LOWER(?) OR LOWER(curso2.cur_nome) LIKE LOWER(?)");
						sb.append(" ORDER BY pro_id, cursos.cur_id ASC ");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setString(1, "%" + professor.getCursos().get(0).getNome_curso() + "%" );
						comandoSQL.setString(2, "%" + professor.getCursos().get(1).getNome_curso() + "%" );
					}else {
						sb.append(" LOWER(curso1.cur_nome) LIKE LOWER(?)");
						sb.append(" ORDER BY pro_dta_cad ASC;");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setString(1, "%" + professor.getCursos().get(0).getNome_curso() + "%" );
					}
				}else if(professor.getCursos().get(0).getId() != 0){
					sb.append(" WHERE ");
					if(professor.getCursos().get(1).getId() != 0) {
						sb.append(" curso1.cur_id = ? OR curso2.cur_id = ?");
						sb.append(" ORDER BY pro_id, cursos.cur_id ASC ");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setInt(1, professor.getCursos().get(0).getId());
						comandoSQL.setInt(2, professor.getCursos().get(1).getId());
					}else {
						sb.append(" curso1.cur_id = ? ");
						sb.append(" ORDER BY pro_dta_cad ASC;");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setInt(1, professor.getCursos().get(0).getId());
					}
				}else if(professor.getNome() != "" && professor.getNome() != null){
					System.out.println("ENTROU NO IF");
					sb.append(" WHERE ");
					sb.append("LOWER(pro_nome) LIKE LOWER(?)");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setString(1, "%" + professor.getNome() + "%");
				}else if(professor.getEmail() != "" && professor.getEmail() != "") {
					sb.append(" WHERE ");
					sb.append(" pro_email LIKE ?");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setString(1, "%" + professor.getEmail() + "%");
				}else comandoSQL = this.conexao.prepareStatement(sb.toString()); 
				
				System.out.println(comandoSQL);
				
				ResultSet rs = comandoSQL.executeQuery();
				
				while (rs.next()) {
					Professor pro = new Professor();
					List<Curso> cursos = new ArrayList<Curso>();
					
					Curso curso_1 = new Curso(rs.getString("cur_nome"), rs.getString("cur_descricao"), rs.getString("cur_periodo"));
					curso_1.setId(rs.getInt("cur_id"));
					cursos.add(curso_1);
					
					Curso curso_2 = new Curso(rs.getString("cur_2_nome"), rs.getString("cur_2_descricao"), rs.getString("cur_2_periodo"));
					curso_2.setId(rs.getInt("cur_2_id"));
					cursos.add(curso_2);
					
					pro.setId(rs.getInt("pro_id"));
					pro.setNome(rs.getString("pro_nome"));
					pro.setCpf(rs.getString("pro_cpf"));
					pro.setEmail(rs.getString("pro_email"));
					pro.setRegistro_professor(rs.getString("pro_registro"));
					//pro.setEndereco(new Endereco(rs.getString("pro_logradouro"), rs.getString("pro_bairro"), rs.getString("pro_cep"), new Cidade(rs.getString("pro_cidade"), new Estado(rs.getString("pro_estado")))));
					pro.setCursos(cursos);
					pro.setDta_cadastro(rs.getTimestamp("pro_dta_cad").getTime());
					
					professores.add(pro);
				}				
			}
			System.out.println(new Log().gerarLog(professores, camposPesquisados));
			
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
		return professores;
	}
}


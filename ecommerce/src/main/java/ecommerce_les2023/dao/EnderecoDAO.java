package ecommerce_les2023.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.Curso;
import ecommerce_les2023.modelo.Endereco;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Log;

public class EnderecoDAO extends AbstractDAO  {
	
	protected EnderecoDAO(String table, String idTable) {
		super("enderecos", "end_id");	
	}
	
	public EnderecoDAO(Connection conexao){
		super(conexao, "enderecos", "end_id");
	}
	
	public EnderecoDAO(){
		super("enderecos", "end_id");			
	}
	
	public void salvar(EntidadeDominio entidade) {
		PreparedStatement comandoSQL = null;
		Endereco endereco = (Endereco) entidade;
		
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ");
			sb.append(this.tabela);
			sb.append("(end_frase, end_cep, end_logradouro, end_numero, end_bairro, end_cidade, end_estado, end_pais, end_observacao, end_tipo, end_residencia, end_tipo_logradouro, clientes_cli_id)");
			sb.append("VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			comandoSQL = this.conexao.prepareStatement(sb.toString(), Statement.RETURN_GENERATED_KEYS);			
			comandoSQL.setString(1, endereco.getFrase());
			comandoSQL.setString(2, endereco.getCep());
			comandoSQL.setString(3, endereco.getLogradouro());
			comandoSQL.setString(4, endereco.getNumero());
			comandoSQL.setString(5, endereco.getBairro());
			comandoSQL.setString(6, endereco.getCidade().getNome_cidade());
			comandoSQL.setString(7, endereco.getCidade().getEstado().getNome_estado());
			comandoSQL.setString(8, endereco.getCidade().getEstado().getPais().getNome_pais());
			comandoSQL.setString(9, endereco.getObservacao());
			comandoSQL.setString(10, endereco.getTipo());
			comandoSQL.setString(11, endereco.getResidencia());
			comandoSQL.setString(12, endereco.getTipo_logradouro());
			comandoSQL.setInt(13, endereco.getCliente_id());
			comandoSQL.executeUpdate();		
					
			ResultSet rs = comandoSQL.getGeneratedKeys();
			int idEnd=0;
			if(rs.next())
				idEnd = rs.getInt(1);
			endereco.setId(idEnd);
			
			conexao.commit();					
		} catch (SQLException e) {
			try {
				conexao.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();	
		}finally{
			if(ctrlTransaction){
				try {
					comandoSQL.close();
					if(ctrlTransaction)
						conexao.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
		}
	}
	
	@Override
	public void alterar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		Curso curso = (Curso) entidade;
		
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE ");
			sb.append(this.tabela);
			sb.append(" SET cur_nome = ?, cur_descricao = ?, cur_periodo = ?, cur_dta_cad = ?");
			sb.append(" WHERE ");
			sb.append(this.idTabela + " = ?;");
					
			Timestamp ts = Timestamp.from(curso.getDta_cadastro().toInstant());
			comandoSQL = this.conexao.prepareStatement(sb.toString());
			comandoSQL.setString(1, curso.getNome_curso());
			comandoSQL.setString(2, curso.getDescricao());
			comandoSQL.setString(3, curso.getPeriodo());			
			comandoSQL.setTimestamp(4, ts, curso.getDta_cadastro());
			comandoSQL.setInt(5, curso.getId());
			comandoSQL.executeUpdate();
			
			conexao.commit();			
			System.out.println(new Log().gerarLog(curso, "ALTERAÇÃO"));
			
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
		List<EntidadeDominio> cursos = new ArrayList<EntidadeDominio>();
		String camposPesquisados = "CONSULTA ID: " 
				+ null 
				+ "; NOME: " 
				+ null 
				+ "; PERIODO: " 
				+ null;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * FROM ");
			sb.append(this.tabela);
			
			if(entidade != null) {
				Curso curso = (Curso) entidade;
				camposPesquisados = "CONSULTA ID: " 
						+ curso.getId() 
						+ "; NOME: " 
						+ curso.getNome_curso() 
						+ "; PERIODO: " 
						+ curso.getPeriodo();
				
				if(curso.getId() != 0) {
					sb.append(" WHERE ");
					sb.append(this.idTabela);
					sb.append(" = ?");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setInt(1, curso.getId());
				}else if(curso.getPeriodo() != "" && curso.getPeriodo() != null && curso.getNome_curso() != "" && curso.getNome_curso() != null){
					sb.append(" WHERE ");
					sb.append(" cur_periodo = ? AND cur_nome LIKE ? ");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setString(1, curso.getPeriodo());
					comandoSQL.setString(2, "%" + curso.getNome_curso() + "%");				
				}else if(curso.getPeriodo() != "" && curso.getPeriodo() != null || curso.getNome_curso() != "" && curso.getNome_curso() != null){
					sb.append(" WHERE ");
					sb.append(" cur_periodo = ? OR cur_nome LIKE ? ");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setString(1, curso.getPeriodo());
					comandoSQL.setString(2, "%" + curso.getNome_curso() + "%");				
				}else comandoSQL = this.conexao.prepareStatement(sb.toString()); 
			}else comandoSQL = this.conexao.prepareStatement(sb.toString()); 
			
			System.out.println(comandoSQL);
			
			sb.append(" ORDER BY cur_dta_cad ASC;");
			
			ResultSet rs = comandoSQL.executeQuery();
			
			while (rs.next()) {
				Curso cur = new Curso();
				cur.setId(rs.getInt("cur_id"));
				cur.setNome_curso(rs.getString("cur_nome"));
				cur.setDescricao(rs.getString("cur_descricao"));
				cur.setPeriodo(rs.getString("cur_periodo"));
				cur.setDta_cadastro(rs.getTimestamp("cur_dta_cad").getTime());
				
				cursos.add(cur);
			}
			
			System.out.println(new Log().gerarLog(cursos, camposPesquisados));
			
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
		return cursos;
	}
}

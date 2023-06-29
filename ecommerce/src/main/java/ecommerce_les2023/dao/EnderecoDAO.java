package ecommerce_les2023.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

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
		
		if(this.acaoIndependente)
			openConnection();
		
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
			
			System.out.println(new Log().gerarLog(endereco, "ALTERAÇÃO"));
			
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
		Endereco endereco = (Endereco) entidade;
		System.out.println("ID: " + endereco.getId());
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE ");
			sb.append(this.tabela);
			sb.append(" SET end_frase = ?, end_cep = ?, end_logradouro = ?, end_numero = ?, end_bairro = ?, end_cidade = ?, end_estado = ?, end_pais = ?, end_observacao = ?, end_tipo = ?, end_residencia = ?, end_tipo_logradouro = ?, clientes_cli_id = ?");
			sb.append(" WHERE ");
			sb.append(this.idTabela + " = ?");
			
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
			comandoSQL.setInt(14, endereco.getId());
			
			comandoSQL.executeUpdate();		
								
			System.out.println(new Log().gerarLog(endereco, "ALTERAÇÃO"));
			
			conexao.commit();					
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		return null;
		
	}
}

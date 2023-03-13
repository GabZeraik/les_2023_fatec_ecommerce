package ecommerce_les2023.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.ConexaoBD;
import ecommerce_les2023.utils.Log;

public abstract class AbstractDAO implements IDAO {
	
	protected Connection conexao;
	protected String tabela;
	protected String idTabela;
	protected boolean ctrlTransaction=true;
	
	public AbstractDAO(Connection conexao, String tabela, String idTabela){
		this.tabela = tabela;
		this.idTabela = idTabela;
		this.conexao = conexao;
	}
	
	public AbstractDAO(String tabela, String idTabela){
		this.tabela = tabela;
		this.idTabela = idTabela;
	}
	
	
	@Override
	public void deletar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;		
		StringBuilder sb = new StringBuilder();
		sb.append("DELETE FROM ");
		sb.append(this.tabela);
		sb.append(" WHERE ");
		sb.append(this.idTabela);
		sb.append("=");
		sb.append("?");
		
		try {
			conexao.setAutoCommit(false);
			
			comandoSQL = conexao.prepareStatement(sb.toString());
			comandoSQL.setInt(1, entidade.getId());
			comandoSQL.executeUpdate();
			
			conexao.commit();
			
			System.out.println(new Log().gerarLog(entidade, "EXCLUSÃO"));
			
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
				
		}		
	}
	
	protected void openConnection(){
		try {
			if(conexao == null || conexao.isClosed()) 
				this.conexao = ConexaoBD.main(null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

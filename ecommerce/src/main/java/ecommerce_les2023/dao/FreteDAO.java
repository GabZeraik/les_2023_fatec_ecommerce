package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Frete;

public class FreteDAO extends AbstractDAO {
	
	public FreteDAO() {
		super("fretes", "fre_id");
	}

	@Override
	public void salvar(EntidadeDominio entidade) {
		return;
	}

	@Override
	public void alterar(EntidadeDominio entidade) {
		return;
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		List<EntidadeDominio> fretes = new ArrayList<EntidadeDominio>();
				
		try {
			this.conexao.setAutoCommit(false);
						
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * FROM ");
			sb.append(this.tabela);
		
			comandoSQL = this.conexao.prepareStatement(sb.toString());
				
			sb.append(" ORDER BY fre_id ASC;");
					
			ResultSet rs = comandoSQL.executeQuery();
			
			while (rs.next()) {
				Frete frete = new Frete(rs.getInt("fre_codigo"), rs.getFloat("fre_porcentagem"));
				frete.setId(rs.getInt("fre_id"));
				fretes.add(frete);
			}
			
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
		
		return fretes;
	}
}

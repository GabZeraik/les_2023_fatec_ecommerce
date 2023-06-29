package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.Bandeira;
import ecommerce_les2023.modelo.EntidadeDominio;

public class BandeiraDAO extends AbstractDAO {
	
	public BandeiraDAO() {
		super("bandeiras", "ban_id");
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
		List<EntidadeDominio> bandeiras = new ArrayList<EntidadeDominio>();
				
		try {
			this.conexao.setAutoCommit(false);
						
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * FROM ");
			sb.append(this.tabela);
		
			comandoSQL = this.conexao.prepareStatement(sb.toString());
				
			sb.append(" ORDER BY ban_id ASC;");
					
			ResultSet rs = comandoSQL.executeQuery();
			
			while (rs.next()) {
				Bandeira bandeira = new Bandeira(rs.getInt("ban_id"), rs.getString("ban_codigo"), rs.getString("ban_nome"));
				bandeiras.add(bandeira);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return bandeiras;
	}
}

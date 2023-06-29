package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemTroca;
import ecommerce_les2023.utils.Log;

public class ItemTrocaDAO extends AbstractDAO {
	
	public ItemTrocaDAO() {
		super("itens_trocas", "item_id");
	}

	@Override
	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		ItemTroca item = (ItemTroca) entidade;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ");
			sb.append(this.tabela);
			sb.append("(item_quantidade, item_preco_unitario, itens_pedidos_item_id, pedidos_trocas_tro_id) ");
			sb.append("VALUES (?, ?, ?, ?)");
			
			comandoSQL = this.conexao.prepareStatement(sb.toString(), Statement.RETURN_GENERATED_KEYS);
			comandoSQL.setInt(1, item.getQuantidade());
			comandoSQL.setFloat(2, item.getPreco_unitario());
			comandoSQL.setInt(3, item.getItem_pedido_id());
			comandoSQL.setInt(4, item.getPedido_troca_id());
						
			comandoSQL.executeUpdate();
			
			conexao.commit();
			
			ResultSet keysTabela = comandoSQL.getGeneratedKeys();
			int id = 0;
			if(keysTabela.next())
				id = keysTabela.getInt(1);
			item.setId(id);
			
			System.out.println(new Log().gerarLog(item, "Cadastro"));
			
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
		return;
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		List<EntidadeDominio> itens_trocas = new ArrayList<EntidadeDominio>();
				
		try {
			this.conexao.setAutoCommit(false);
						
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * FROM ");
			sb.append(this.tabela);
			sb.append(" WHERE ");
			sb.append(this.idTabela);
			sb.append(" = " + entidade.getId());
		
			comandoSQL = this.conexao.prepareStatement(sb.toString());
				
			sb.append(" ORDER BY item_id ASC;");
					
			ResultSet rs = comandoSQL.executeQuery();
			
			while (rs.next()) {
				ItemTroca item_troca = new ItemTroca(rs.getInt("item_quantidade"), rs.getFloat("item_preco_unitario"), rs.getInt("itens_pedidos_item_id"), rs.getInt("pedidos_trocas_tro_id"));
				item_troca.setId(rs.getInt("item_id"));
				itens_trocas.add(item_troca);
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
		
		return itens_trocas;
	}
}

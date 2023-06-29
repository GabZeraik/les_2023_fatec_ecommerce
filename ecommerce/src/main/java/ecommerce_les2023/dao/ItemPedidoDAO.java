package ecommerce_les2023.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemPedido;
import ecommerce_les2023.utils.Log;

public class ItemPedidoDAO extends AbstractDAO {
	
	public ItemPedidoDAO(Connection conexao){
		super(conexao, "itens_pedidos", "item_id");
	}
	
	public ItemPedidoDAO() {
		super("itens_pedidos", "item_id");
	}

	@Override
	public void salvar(EntidadeDominio entidade) {
		
		if(this.acaoIndependente)
			openConnection();
		
		PreparedStatement comandoSQL = null;
		ItemPedido item = (ItemPedido) entidade;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ");
			sb.append(this.tabela);
			sb.append("(item_quantidade, item_preco_unitario, produtos_pro_id, pedidos_ped_id) ");
			sb.append("VALUES (?, ?, ?, ?)");
			
			comandoSQL = this.conexao.prepareStatement(sb.toString(), Statement.RETURN_GENERATED_KEYS);
			comandoSQL.setInt(1, item.getQuantidade());
			comandoSQL.setFloat(2, item.getPreco_unitario());
			comandoSQL.setInt(3, item.getProduto_id());
			comandoSQL.setInt(4, item.getPedido_id());
						
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
			if(ctrlTransaction){
				try {
					comandoSQL.close();
					if(ctrlTransaction)
						conexao.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
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
		List<EntidadeDominio> itens_pedidos = new ArrayList<EntidadeDominio>();
				
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
				ItemPedido item_pedido = new ItemPedido(rs.getInt("item_quantidade"), rs.getFloat("item_preco_unitario"), rs.getInt("produtos_pro_id"), rs.getInt("pedidos_ped_id"));
				item_pedido.setId(rs.getInt("item_id"));
				itens_pedidos.add(item_pedido);
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
		
		return itens_pedidos;
	}
}

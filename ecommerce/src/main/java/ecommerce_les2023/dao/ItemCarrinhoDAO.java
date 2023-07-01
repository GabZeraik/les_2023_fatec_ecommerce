package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemCarrinho;
import ecommerce_les2023.utils.Log;

public class ItemCarrinhoDAO extends AbstractDAO {
	
	public ItemCarrinhoDAO() {
		super("itens_carrinhos", "item_id");
	}

	@Override
	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		ItemCarrinho item = (ItemCarrinho) entidade;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ");
			sb.append(this.tabela);
			sb.append("(item_quantidade, item_preco_unitario, produtos_pro_id, carrinhos_shop_id) ");
			sb.append("VALUES (?, ?, ?, ?)");
			
			comandoSQL = this.conexao.prepareStatement(sb.toString(), Statement.RETURN_GENERATED_KEYS);
			comandoSQL.setInt(1, item.getQuantidade());
			comandoSQL.setFloat(2, item.getPreco_unitario());
			comandoSQL.setInt(3, item.getProduto_id());
			comandoSQL.setInt(4, item.getCarrinho_id());
						
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void alterar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		ItemCarrinho item_carrinho = (ItemCarrinho) entidade;
		
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE ");
			sb.append(this.tabela);
			
			if(item_carrinho.getId() != 0) {
				sb.append(" SET item_quantidade = ?");
				sb.append(" WHERE ");
				sb.append(this.idTabela + " = ?;");
				comandoSQL = this.conexao.prepareStatement(sb.toString());
				comandoSQL.setInt(1, item_carrinho.getQuantidade());
				comandoSQL.setInt(2, item_carrinho.getId());
			}
			
			comandoSQL.executeUpdate();
			
			conexao.commit();			
			System.out.println(new Log().gerarLog(item_carrinho, "ALTERAÇÃO"));
			
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
		openConnection();
		PreparedStatement comandoSQL = null;
		List<EntidadeDominio> itens_carrinho = new ArrayList<EntidadeDominio>();
				
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
				ItemCarrinho item_carrinho = new ItemCarrinho(rs.getInt("item_quantidade"), rs.getFloat("item_preco_unitario"), rs.getInt("produtos_pro_id"), rs.getInt("carrinhos_shop_id"));
				item_carrinho.setId(rs.getInt("item_id"));
				itens_carrinho.add(item_carrinho);
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
		
		return itens_carrinho;
	}
}

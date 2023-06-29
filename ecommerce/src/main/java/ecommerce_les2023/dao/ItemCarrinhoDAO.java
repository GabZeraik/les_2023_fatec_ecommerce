package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
		return;
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		return null;
	}
}

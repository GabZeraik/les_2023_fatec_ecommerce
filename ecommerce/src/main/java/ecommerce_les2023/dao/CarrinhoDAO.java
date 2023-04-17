package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.Carrinho;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemCarrinho;
import ecommerce_les2023.utils.Log;

public class CarrinhoDAO extends AbstractDAO {
	
	public CarrinhoDAO() {
		super("carrinhos", "shop_id");
	}

	@Override
	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		Carrinho carrinho = (Carrinho) entidade;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ");
			sb.append(this.tabela);
			sb.append("(shop_session_id, clientes_cli_id) ");
			sb.append("VALUES (?,?)");
			
			comandoSQL = this.conexao.prepareStatement(sb.toString(), Statement.RETURN_GENERATED_KEYS);
			comandoSQL.setString(1, carrinho.getSession_id());
			if(carrinho.getCliente_id() == 0) comandoSQL.setObject(2, null);
			else comandoSQL.setInt(2, carrinho.getCliente_id());
						
			comandoSQL.executeUpdate();
			
			conexao.commit();
			
			ResultSet keysTabela = comandoSQL.getGeneratedKeys();
			int id = 0;
			if(keysTabela.next())
				id = keysTabela.getInt(1);
			carrinho.setId(id);
			
			System.out.println(new Log().gerarLog(carrinho, "Cadastro"));
			
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
		Carrinho carrinho = (Carrinho) entidade;
		
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE ");
			sb.append(this.tabela);
			
			if(carrinho.getCliente_id() > 0) {
				if(carrinho.getExpira_em() != null) {
					sb.append(" SET shop_session_id = ?, clientes_cli_id = ?, shop_expira_em = ?");
					sb.append(" WHERE ");
					sb.append(this.idTabela + " = ?;");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setString(1, carrinho.getSession_id());
					comandoSQL.setInt(2, carrinho.getCliente_id());
					comandoSQL.setInt(3, carrinho.getId());
					comandoSQL.setString(4, carrinho.getExpira_em());
				}else {
					sb.append(" SET shop_session_id = ?, clientes_cli_id = ?");
					sb.append(" WHERE ");
					sb.append(this.idTabela + " = ?;");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setString(1, carrinho.getSession_id());
					comandoSQL.setInt(2, carrinho.getCliente_id());
					comandoSQL.setInt(3, carrinho.getId());
				}
			}else {
				if(carrinho.getExpira_em() != null) {
					sb.append(" SET shop_session_id = ?, shop_expira_em = ?");
					sb.append(" WHERE ");
					sb.append(this.idTabela + " = ?;");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setString(1, carrinho.getSession_id());
					comandoSQL.setInt(2, carrinho.getCliente_id());
					comandoSQL.setInt(3, carrinho.getId());
					comandoSQL.setString(4, carrinho.getExpira_em());
				}else {
					sb.append(" SET shop_session_id = ?");
					sb.append(" WHERE ");
					sb.append(this.idTabela + " = ?;");
					comandoSQL = this.conexao.prepareStatement(sb.toString());
					comandoSQL.setString(1, carrinho.getSession_id());
					comandoSQL.setInt(2, carrinho.getId());
				}
			}
			
			comandoSQL.executeUpdate();
			
			conexao.commit();			
			System.out.println(new Log().gerarLog(carrinho, "ALTERAÇÃO"));
			
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
		Carrinho carrinho = (Carrinho) entidade;
		List<EntidadeDominio> carrinhos = new ArrayList<EntidadeDominio>();
				
		try {
			this.conexao.setAutoCommit(false);
						
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * FROM ");
			sb.append(this.tabela);
			
			if(carrinho.getId() > 0) {
				sb.append(" WHERE shop_id = ");
				sb.append(carrinho.getId());
				comandoSQL = this.conexao.prepareStatement(sb.toString());
			}else if(carrinho.getCliente_id() > 0){
				sb.append(" WHERE shop_session_id = ? AND clientes_cli_id = ?");
				comandoSQL = this.conexao.prepareStatement(sb.toString());
				comandoSQL.setString(1, carrinho.getSession_id());
				comandoSQL.setInt(2, carrinho.getCliente_id());
			}else{
				sb.append(" WHERE shop_session_id = ?");
				comandoSQL = this.conexao.prepareStatement(sb.toString());
				comandoSQL.setString(1, carrinho.getSession_id());
			}
				
			sb.append(" ORDER BY shop_id ASC;");
					
			ResultSet rs = comandoSQL.executeQuery();
			
			while (rs.next()) {
				Carrinho car = new Carrinho(rs.getString("shop_session_id"), rs.getInt("clientes_cli_id"));
				car.setId(rs.getInt("shop_id"));
				car.setExpira_em(rs.getString("shop_expira_em"));
				adicionaItensResultSet(car);
				car.setJson();
				carrinhos.add(car);
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
		
		return carrinhos;
	}
	
	private void adicionaItensResultSet(Carrinho car) throws SQLException {
		PreparedStatement comandoSQL = null;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * FROM itens_carrinhos INNER JOIN produtos ON produtos_pro_id = produtos.pro_id WHERE carrinhos_shop_id = ");
		sb.append(car.getId());
		comandoSQL = this.conexao.prepareStatement(sb.toString());
		ResultSet rs = comandoSQL.executeQuery();
		
		while (rs.next()) {
			ItemCarrinho item = new ItemCarrinho(rs.getInt("item_quantidade"), rs.getFloat("item_preco_unitario"), rs.getInt("produtos_pro_id"), rs.getInt("carrinhos_shop_id"));
			item.setNome(rs.getString("pro_nome"));
			item.setId(rs.getInt("item_id"));
			car.adicionaItens(item);
		}
		return;
	}
}

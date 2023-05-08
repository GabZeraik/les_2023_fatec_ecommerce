package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemPedido;
import ecommerce_les2023.modelo.Pedido;
import ecommerce_les2023.modelo.Transacao;
import ecommerce_les2023.utils.Log;

public class PedidoDAO extends AbstractDAO {
	
	public PedidoDAO() {
		super("pedidos", "ped_id");
	}

	@Override
	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		Pedido pedido = (Pedido) entidade;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ");
			sb.append(this.tabela);
			sb.append("(ped_codigo, ped_valor_total, ped_data_pedido, ped_situacao, ped_modificado_por, ped_ultima_atualizacao, clientes_cli_id)");
			sb.append("VALUES (?,?,?,?,?,?,?)");
			
			Timestamp ts = Timestamp.from(pedido.getDta_cadastro().toInstant());
			comandoSQL = this.conexao.prepareStatement(sb.toString(), Statement.RETURN_GENERATED_KEYS);
			comandoSQL.setString(1, pedido.getCodigo());
			comandoSQL.setFloat(2, pedido.getValor_total());
			comandoSQL.setTimestamp(3, ts, pedido.getDta_cadastro());
			comandoSQL.setString(4, pedido.getSituacao());
			comandoSQL.setString(5, pedido.getModificado_por());
			comandoSQL.setTimestamp(6, ts, pedido.getDta_cadastro());
			comandoSQL.setInt(7, pedido.getCliente_id());
			
						
			comandoSQL.executeUpdate();
			
			conexao.commit();
			
			ResultSet keysTabela = comandoSQL.getGeneratedKeys();
			int id = 0;
			if(keysTabela.next())
				id = keysTabela.getInt(1);
			pedido.setId(id);
						
			System.out.println(new Log().gerarLog(pedido, "Cadastro"));
			
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
		Pedido pedido = (Pedido) entidade;
		
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE ");
			sb.append(this.tabela);
			
			if(pedido.getId() != 0) {
				sb.append(" SET ped_situacao = ?");
				sb.append(" WHERE ");
				sb.append(this.idTabela + " = ?;");
				comandoSQL = this.conexao.prepareStatement(sb.toString());
				comandoSQL.setString(1, pedido.getSituacao());
				comandoSQL.setInt(2, pedido.getId());
			}
			
			comandoSQL.executeUpdate();
			
			conexao.commit();			
			System.out.println(new Log().gerarLog(pedido, "ALTERAÇÃO"));
			
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
		List<EntidadeDominio> pedidos = new ArrayList<EntidadeDominio>();
		String camposPesquisados = "CONSULTA ID: " 
				+ null 
				+ "; CODIGO: " 
				+ null 
				+ "; SITUACAO: " 
				+ null;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * FROM ");
			sb.append(this.tabela);
			
			if(entidade != null) {
				Pedido pedido = (Pedido) entidade;
				camposPesquisados = "CONSULTA ID: " 
						+ pedido.getId() 
						+ "; CODIGO: " 
						+ pedido.getCodigo() 
						+ "; SITUACAO: " 
						+ pedido.getSituacao();
				
				if(entidade != null) {
					if(pedido.getId() != 0) {
						sb.append(" WHERE ");
						sb.append(this.idTabela);
						sb.append(" = ?");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setInt(1, pedido.getId());
					}else if(pedido.getCodigo() != null && pedido.getCodigo() != "") {
						sb.append(" WHERE ");
						sb.append("ped_codigo = ? ");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setString(1, pedido.getCodigo());	
					}else if(pedido.getSituacao() != "" && pedido.getSituacao() != null) {
						sb.append(" WHERE ");
						sb.append("ped_situacao = ? ");
						comandoSQL = this.conexao.prepareStatement(sb.toString());
						comandoSQL.setString(1, pedido.getSituacao());
					}else {
						comandoSQL = this.conexao.prepareStatement(sb.toString());
					}
				}
				
				sb.append(" ORDER BY ped_id ASC;");
					
				System.out.println(comandoSQL);
				ResultSet rs = comandoSQL.executeQuery();
				Pedido ped = null;
				
				while (rs.next()) {
					ped = criaPedidoResultSet(rs);
					adicionaItensPedidoResultSet(ped);
					adicionaTransacaoResultSet(ped);
					
					if (ped != null) pedidos.add(ped);
				}
			}
			System.out.println(new Log().gerarLog(pedidos, camposPesquisados));
			
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
		
		return pedidos;
	}
	
	private Pedido criaPedidoResultSet(ResultSet rs) throws SQLException {
		Pedido ped = new Pedido();
		ped.setId(rs.getInt("ped_id"));
		ped.setCodigo(rs.getString("ped_codigo"));
		ped.setValor_total(Float.parseFloat(rs.getString("ped_valor_total")));
		ped.setData_pedido(rs.getDate("ped_data_pedido").toLocalDate().toString());
		ped.setSituacao(rs.getString("ped_situacao"));
		ped.setModificado_por(rs.getString("ped_modificado_por"));
		ped.setUltima_atualizacao(rs.getDate("ped_ultima_atualizacao").toLocalDate().toString());
		ped.setCliente_id(Integer.parseInt(rs.getString("clientes_cli_id")));
		ped.setCupom_id(rs.getInt("cupons_cup_id"));
		
		return ped;
	}
	
	private void adicionaItensPedidoResultSet(Pedido ped) throws SQLException {
		PreparedStatement comandoSQL = null;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * FROM itens_pedidos WHERE pedidos_ped_id = ");
		sb.append(ped.getId());
		comandoSQL = this.conexao.prepareStatement(sb.toString());
		ResultSet rs = comandoSQL.executeQuery();
		
		while (rs.next()) {
			ItemPedido item_pedido = new ItemPedido(rs.getInt("item_quantidade"), rs.getFloat("item_preco_unitario"), rs.getInt("produtos_pro_id"), rs.getInt("pedidos_ped_id"));
			item_pedido.setId(rs.getInt("item_id"));
			ped.adicionaItemPedido(item_pedido);
		}
		return;
	}
	
	private void adicionaTransacaoResultSet(Pedido ped) throws SQLException {
		PreparedStatement comandoSQL = null;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * FROM transacoes WHERE pedidos_ped_id = ");
		sb.append(ped.getId());
		comandoSQL = this.conexao.prepareStatement(sb.toString());
		ResultSet rs = comandoSQL.executeQuery();
		
		while (rs.next()) {
			Transacao transacao = new Transacao(rs.getInt("cartoes_car_id"), rs.getFloat("tra_valor_pago"), rs.getInt("pedidos_ped_id"));
			transacao.setId(rs.getInt("tra_id"));
			ped.adicionaTransacao(transacao);
		}
		return;
	}
}

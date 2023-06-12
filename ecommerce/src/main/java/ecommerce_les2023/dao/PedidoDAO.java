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
import ecommerce_les2023.modelo.ItemTroca;
import ecommerce_les2023.modelo.Pedido;
import ecommerce_les2023.modelo.PedidoTroca;
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
				
				sb.append(" ORDER BY ped_id DESC;");
					
				System.out.println(comandoSQL);
				ResultSet rs = comandoSQL.executeQuery();
				Pedido ped = null;
				
				while (rs.next()) {
					ped = criaPedidoResultSet(rs);
					this.adicionaItensPedidoResultSet(ped);
					this.adicionaTransacaoResultSet(ped);
					this.adicionaPedidosTrocas(ped);
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
		sb.append("SELECT IP.*, P.pro_nome as item_nome FROM itens_pedidos IP INNER JOIN produtos P ON P.pro_id = IP.produtos_pro_id WHERE pedidos_ped_id = ");
		sb.append(ped.getId());
		comandoSQL = this.conexao.prepareStatement(sb.toString());
		ResultSet rs = comandoSQL.executeQuery();
		
		while (rs.next()) {
			ItemPedido item_pedido = new ItemPedido(rs.getInt("item_quantidade"), rs.getFloat("item_preco_unitario"), rs.getInt("produtos_pro_id"), rs.getInt("pedidos_ped_id"));
			item_pedido.setId(rs.getInt("item_id"));
			item_pedido.setNome(rs.getString("item_nome"));
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
	
	private void adicionaItensTrocas(PedidoTroca pedido_troca) throws SQLException {
		PreparedStatement comandoSQL = null;
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT * FROM itens_trocas WHERE pedidos_trocas_tro_id = " + pedido_troca.getId());		
		comandoSQL = this.conexao.prepareStatement(sb.toString());
		ResultSet rs = comandoSQL.executeQuery();
		
		while (rs.next()) {
			ItemTroca item_troca = new ItemTroca(rs.getInt("item_quantidade"), rs.getFloat("item_preco_unitario"), rs.getInt("itens_pedidos_item_id"), rs.getInt("pedidos_trocas_tro_id"));
			item_troca.setId(rs.getInt("item_id"));
			pedido_troca.adicionaItemTroca(item_troca);
		}
		return;
	}
	
	private void adicionaPedidosTrocas(Pedido ped) throws SQLException {
		PreparedStatement comandoSQL = null;
		StringBuilder sb = new StringBuilder();
		
		if(ped.getItem_pedido().size() > 1) {
			for(int i=0; i < ped.getItem_pedido().size(); i++) {
				
				if(i == 0) sb.append("SELECT DISTINCT PT.*\r\n"
						+ "FROM pedidos_trocas PT\r\n"
						+ "JOIN itens_trocas IT \r\n"
						+ "ON IT.pedidos_trocas_tro_id = PT.tro_id\r\n"
						+ "JOIN itens_pedidos IP\r\n"
						+ "ON IP.item_id = IT.itens_pedidos_item_id\r\n"
						+ "WHERE IT.itens_pedidos_item_id =");
				else sb.append(" OR IT.itens_pedidos_item_id = ");
				
				sb.append(ped.getItem_pedido().get(i).getId());
			}
		}else if(ped.getItem_pedido().size() == 1){
			sb.append("SELECT DISTINCT PT.*\r\n"
					+ "FROM pedidos_trocas PT\r\n"
					+ "JOIN itens_trocas IT \r\n"
					+ "ON IT.pedidos_trocas_tro_id = PT.tro_id\r\n"
					+ "JOIN itens_pedidos IP\r\n"
					+ "ON IP.item_id = IT.itens_pedidos_item_id\r\n"
					+ "WHERE IT.itens_pedidos_item_id =");
			sb.append(ped.getItem_pedido().get(0).getId());
		}else return;
		
		comandoSQL = this.conexao.prepareStatement(sb.toString());
		ResultSet rs = comandoSQL.executeQuery();
		
		while (rs.next()) {
			PedidoTroca pedido_troca = criaPedidoTrocaResultSet(rs);
			pedido_troca.setId(rs.getInt("tro_id"));
			this.adicionaItensTrocas(pedido_troca);
			ped.adicionaPedidoTroca(pedido_troca);
		}
		return;
	}
	
	private PedidoTroca criaPedidoTrocaResultSet(ResultSet rs) throws SQLException {
		PedidoTroca ped = new PedidoTroca();
		ped.setId(rs.getInt("tro_id"));
		ped.setCodigo(rs.getString("tro_codigo"));
		ped.setValor_total(Float.parseFloat(rs.getString("tro_valor_total")));
		ped.setData_pedido(rs.getDate("tro_data_pedido").toLocalDate().toString());
		ped.setSituacao(rs.getString("tro_situacao"));
		ped.setModificado_por(rs.getString("tro_modificado_por"));
		ped.setUltima_atualizacao(rs.getDate("tro_ultima_atualizacao").toLocalDate().toString());
		ped.setCliente_id(Integer.parseInt(rs.getString("clientes_cli_id")));
		ped.setCupom_id(rs.getInt("cupons_cup_id"));
		
		return ped;
	}
}

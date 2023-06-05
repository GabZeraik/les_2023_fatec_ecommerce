package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.ItemTroca;
import ecommerce_les2023.modelo.PedidoTroca;
import ecommerce_les2023.utils.Log;

public class PedidoTrocaDAO extends AbstractDAO {

	public PedidoTrocaDAO() {
		super("pedidos_trocas", "tro_id");
	}
	
	@Override
	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		PedidoTroca pedido = (PedidoTroca) entidade;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ");
			sb.append(this.tabela);
			sb.append("(tro_codigo, tro_valor_total, tro_data_pedido, tro_situacao, tro_modificado_por, tro_ultima_atualizacao, clientes_cli_id)");
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
		PedidoTroca pedido = (PedidoTroca) entidade;
		
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE ");
			sb.append(this.tabela);
			
			if(pedido.getId() != 0) {
				sb.append(" SET tro_situacao = ?");
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
	public void deletar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub

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
				PedidoTroca pedido = (PedidoTroca) entidade;
				camposPesquisados = "CONSULTA ID: " 
						+ pedido.getId() 
						+ "; CODIGO: " 
						+ pedido.getCodigo()
						+ "; SITUACAO: " 
						+ pedido.getSituacao();
				
				
				sb.append(" WHERE ");
				sb.append(this.idTabela);
				sb.append(" = ?");
				comandoSQL = this.conexao.prepareStatement(sb.toString());
				comandoSQL.setInt(1, pedido.getId());
	
				sb.append(" ORDER BY tro_id ASC;");
				
				System.out.println(comandoSQL);
				ResultSet rs = comandoSQL.executeQuery();
				PedidoTroca ped = null;
			
				while (rs.next()) {
					ped = criaPedidoTrocaResultSet(rs);
					this.adicionaItensPedidoTrocaResultSet(ped);
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
	
	private void adicionaItensPedidoTrocaResultSet(PedidoTroca ped) throws SQLException {
		PreparedStatement comandoSQL = null;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * FROM itens_trocas WHERE pedidos_trocas_tro_id = ");
		sb.append(ped.getId());
		comandoSQL = this.conexao.prepareStatement(sb.toString());
		ResultSet rs = comandoSQL.executeQuery();
		
		while (rs.next()) {
			ItemTroca item_troca = new ItemTroca(rs.getInt("item_quantidade"), rs.getFloat("item_preco_unitario"), rs.getInt("itens_pedidos_item_id"), rs.getInt("pedidos_trocas_tro_id"));
			item_troca.setId(rs.getInt("item_id"));
			ped.adicionaItemTroca(item_troca);
		}
		return;
	}
	
	
}

package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.List;

import ecommerce_les2023.modelo.EntidadeDominio;
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
	public void deletar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		return null;
	}

}

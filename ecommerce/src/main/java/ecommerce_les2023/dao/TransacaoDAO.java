package ecommerce_les2023.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Transacao;
import ecommerce_les2023.utils.Log;

public class TransacaoDAO extends AbstractDAO {
	
	public TransacaoDAO(Connection conexao){
		super(conexao, "transacoes", "tra_id");
	}
	
	public TransacaoDAO() {
		super("transacoes", "tra_id");
	}

	@Override
	public void salvar(EntidadeDominio entidade) {
		
		if(this.acaoIndependente)
			openConnection();
		
		PreparedStatement comandoSQL = null;
		Transacao transacao = (Transacao) entidade;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ");
			sb.append(this.tabela);
			sb.append("(tra_valor_pago, cartoes_car_id, pedidos_ped_id) ");
			sb.append("VALUES (?, ?, ?)");
			
			comandoSQL = this.conexao.prepareStatement(sb.toString(), Statement.RETURN_GENERATED_KEYS);
			comandoSQL.setFloat(1, transacao.getValor_pago());
			comandoSQL.setInt(2, transacao.getCartao_id());
			comandoSQL.setInt(3, transacao.getPedido_id());
						
			comandoSQL.executeUpdate();
			
			conexao.commit();
			
			ResultSet keysTabela = comandoSQL.getGeneratedKeys();
			int id = 0;
			if(keysTabela.next())
				id = keysTabela.getInt(1);
			transacao.setId(id);
			
			System.out.println(new Log().gerarLog(transacao, "Cadastro"));
			
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
		return null;
	}
}

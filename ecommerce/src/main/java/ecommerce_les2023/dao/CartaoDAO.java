package ecommerce_les2023.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import ecommerce_les2023.modelo.Cartao;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Log;

public class CartaoDAO extends AbstractDAO  {
	
	protected CartaoDAO(String table, String idTable) {
		super("cartoes", "car_id");	
	}
	
	public CartaoDAO(Connection conexao){
		super(conexao, "cartoes", "car_id");
	}
	
	public CartaoDAO(){
		super("cartoes", "car_id");			
	}
	
	public void salvar(EntidadeDominio entidade) {
		PreparedStatement comandoSQL = null;
		Cartao cartao = (Cartao) entidade;
		
		if(this.acaoIndependente)
			openConnection();
		
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ");
			sb.append(this.tabela);
			sb.append("(car_numero, car_nome_impresso, car_codigo_seguranca, car_preferencial, car_validade, bandeiras_ban_id, clientes_cli_id)");
			sb.append("VALUES (?,?,?,?,?,?,?)");
			
			comandoSQL = this.conexao.prepareStatement(sb.toString(), Statement.RETURN_GENERATED_KEYS);			
			comandoSQL.setString(1, cartao.getNumero());
			comandoSQL.setString(2, cartao.getNome_impresso());
			comandoSQL.setString(3, cartao.getCod_seguranca());
			comandoSQL.setString(4, cartao.getPreferencial());
			comandoSQL.setString(5, cartao.getValidade());
			comandoSQL.setInt(6, cartao.getBandeira().getId());
			comandoSQL.setInt(7, cartao.getCliente_id());
			comandoSQL.executeUpdate();		
					
			ResultSet rs = comandoSQL.getGeneratedKeys();
			int idCartao = 0;
			if(rs.next())
				idCartao = rs.getInt(1);
			cartao.setId(idCartao);
			
			System.out.println(new Log().gerarLog(cartao, "CADASTRO"));
			
			conexao.commit();					
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
					// TODO Auto-generated catch block
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

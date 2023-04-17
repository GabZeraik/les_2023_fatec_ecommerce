package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import ecommerce_les2023.modelo.Cupom;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.utils.Log;

public class CupomDAO extends AbstractDAO {
	
	public CupomDAO() {
		super("cupons", "cup_id");
	}

	@Override
	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		Cupom cupom = (Cupom) entidade;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ");
			sb.append(this.tabela);
			sb.append("(cup_codigo, cup_valor, cup_tipo, clientes_cli_id, cup_valido) ");
			sb.append("VALUES (?,?,?,?,?)");
			
			comandoSQL = this.conexao.prepareStatement(sb.toString(), Statement.RETURN_GENERATED_KEYS);
			comandoSQL.setString(1, cupom.getCodigo());
			comandoSQL.setFloat(2, cupom.getValor());
			comandoSQL.setString(3, cupom.getTipo());
			comandoSQL.setInt(4, cupom.getCliente_id());
			comandoSQL.setInt(5, cupom.getValido());
			comandoSQL.executeUpdate();		
			
			conexao.commit();
			
			ResultSet keysTabela = comandoSQL.getGeneratedKeys();
			int id = 0;
			if(keysTabela.next())
				id = keysTabela.getInt(1);
			cupom.setId(id);
			
			System.out.println(new Log().gerarLog(cupom, "Cadastro"));
			
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
		Cupom cupom = (Cupom) entidade;
				
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE ");
			sb.append(this.tabela);
			sb.append(" SET cup_valido = ?");
			sb.append(" WHERE cup_id = ?");
			
			comandoSQL = this.conexao.prepareStatement(sb.toString());
			comandoSQL.setInt(1, cupom.getValido());
			comandoSQL.setInt(2, cupom.getId());
						
			comandoSQL.executeUpdate();
			
			conexao.commit();
			
			System.out.println(new Log().gerarLog(cupom, "Cadastro"));
			
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
		return null;
	}
}

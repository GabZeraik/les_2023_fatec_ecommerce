package ecommerce_les2023.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ecommerce_les2023.modelo.Categoria;
import ecommerce_les2023.modelo.EntidadeDominio;
import ecommerce_les2023.modelo.Produto;

public class ProdutoDAO extends AbstractDAO {
	
	public ProdutoDAO() {
		super("produtos", "pro_id");
	}

	@Override
	public void salvar(EntidadeDominio entidade) {
		return;
	}

	@Override
	public void alterar(EntidadeDominio entidade) {
		return;
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement comandoSQL = null;
		List<EntidadeDominio> produtos = new ArrayList<EntidadeDominio>();
		Produto prod = (Produto) entidade;
		
		System.out.println();
		try {
			this.conexao.setAutoCommit(false);
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * FROM ");
			sb.append(this.tabela);
			
			if(prod.getId() != 0) {
				sb.append(" WHERE ");
				sb.append(this.idTabela);
				sb.append(" = ?");
				comandoSQL = this.conexao.prepareStatement(sb.toString());
				comandoSQL.setInt(1, prod.getId());
			}else comandoSQL = this.conexao.prepareStatement(sb.toString());
			
			sb.append(" ORDER BY pro_id ASC;");
					
			ResultSet rs = comandoSQL.executeQuery();
			
			while (rs.next()) {
				Produto produto = new Produto(rs.getString("pro_codigo"), rs.getString("pro_nome"), rs.getString("pro_tamanho"), rs.getString("pro_cor"), rs.getString("pro_genero"), rs.getString("pro_grupo_preco"), rs.getFloat("pro_preco_atual"), rs.getString("pro_codigo_barras"), rs.getString("pro_justificativa"));
				produto.setId(rs.getInt("pro_id"));
				adicionaCategoriasResultSet(produto);
				produtos.add(produto);
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
		return produtos;
	}
	
	private void adicionaCategoriasResultSet(Produto prod) throws SQLException {
		PreparedStatement comandoSQL = null;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT cat_id, cat_nome FROM produtos JOIN produto_categorias as prod_cat ON produtos.pro_id = prod_cat.produtos_pro_id JOIN categorias ON categorias.cat_id = prod_cat.categorias_cat_id WHERE pro_id = ");
		sb.append(prod.getId());
		comandoSQL = this.conexao.prepareStatement(sb.toString());
		ResultSet rs = comandoSQL.executeQuery();
		
		while (rs.next()) {
			Categoria categoria = new Categoria(rs.getInt("cat_id"), rs.getString("cat_nome"));
			prod.adicionaCategoria(categoria);
		}
		return;
	}
}

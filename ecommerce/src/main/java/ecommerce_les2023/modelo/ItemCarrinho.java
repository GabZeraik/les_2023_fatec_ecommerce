package ecommerce_les2023.modelo;

public class ItemCarrinho extends EntidadeDominio{
	
	private String nome;
	private int quantidade;
	private float preco_unitario;
	private int produto_id;
	private int carrinho_id;
	
	public ItemCarrinho(int quantidade, float preco_unitario, int produto_id, int carrinho_id) {
		this.quantidade = quantidade;
		this.preco_unitario = preco_unitario;
		this.produto_id = produto_id;
		this.carrinho_id = carrinho_id;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public float getPreco_unitario() {
		return preco_unitario;
	}
	public void setPreco_unitario(float preco_unitario) {
		this.preco_unitario = preco_unitario;
	}
	public int getProduto_id() {
		return produto_id;
	}
	public void setProduto_id(int produto_id) {
		this.produto_id = produto_id;
	}
	public int getCarrinho_id() {
		return carrinho_id;
	}
	public void setCarrinho_id(int carrinho_id) {
		this.carrinho_id = carrinho_id;
	}

}

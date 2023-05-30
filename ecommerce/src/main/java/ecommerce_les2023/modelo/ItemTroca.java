package ecommerce_les2023.modelo;

public class ItemTroca extends EntidadeDominio{
	
	private int quantidade;
	private float preco_unitario;
	private int item_pedido_id;
	private int pedido_troca_id;
	
	public ItemTroca(int quantidade, float preco_unitario, int item_pedido_id, int pedido_troca_id) {
		this.quantidade = quantidade;
		this.preco_unitario = preco_unitario;
		this.item_pedido_id = item_pedido_id;
		this.pedido_troca_id = pedido_troca_id;
	}
	
	public ItemTroca() {
		// TODO Auto-generated constructor stub
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
	
	public int getItem_pedido_id() {
		return item_pedido_id;
	}
	
	public void setItem_pedido_id(int item_pedido_id) {
		this.item_pedido_id = item_pedido_id;
	}
	
	public int getPedido_troca_id() {
		return pedido_troca_id;
	}

	public void setPedido_troca_id(int pedido_troca_id) {
		this.pedido_troca_id = pedido_troca_id;
	}
}

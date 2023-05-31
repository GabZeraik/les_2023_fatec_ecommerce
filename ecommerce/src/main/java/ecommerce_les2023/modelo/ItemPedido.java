package ecommerce_les2023.modelo;

import java.util.ArrayList;
import java.util.List;

public class ItemPedido extends EntidadeDominio{
	
	private String nome;
	private int quantidade;
	private float preco_unitario;
	private int produto_id;
	private int pedido_id;
	private List<ItemTroca> item_troca;
	
	public ItemPedido(int quantidade, float preco_unitario, int produto_id, int pedido_id) {
		this.quantidade = quantidade;
		this.preco_unitario = preco_unitario;
		this.produto_id = produto_id;
		this.pedido_id = pedido_id;
	}
	
	public ItemPedido() {
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
	public int getProduto_id() {
		return produto_id;
	}
	public void setProduto_id(int produto_id) {
		this.produto_id = produto_id;
	}
	public int getPedido_id() {
		return pedido_id;
	}
	public void setPedido_id(int pedido_id) {
		this.pedido_id = pedido_id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public void adicionaItemTroca(ItemTroca item) {
		if(this.item_troca == null) {
			this.item_troca = new ArrayList<ItemTroca>();
		}
		this.item_troca.add(item);
	}
}

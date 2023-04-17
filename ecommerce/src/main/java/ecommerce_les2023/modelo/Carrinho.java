package ecommerce_les2023.modelo;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.google.gson.Gson;

public class Carrinho extends EntidadeDominio {
	
	private String session_id;
	private int cliente_id;
	private List<ItemCarrinho> itens;
	
	public Carrinho() {};
	
	public Carrinho(String session_id, int cliente_id) {
		this.session_id = session_id;
		this.cliente_id = cliente_id;
		this.itens = new ArrayList<ItemCarrinho>();
	}

	public String getSession_id() {
		return session_id;
	}

	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}

	public int getCliente_id() {
		return cliente_id;
	}

	public void setCliente_id(int cliente_id) {
		this.cliente_id = cliente_id;
	}

	public List<ItemCarrinho> getItens() {
		return itens;
	}

	public void setItens(List<ItemCarrinho> itemCarrinho) {
		this.itens = itemCarrinho;
	}

	public String gerarCodigoUnico() {
		UUID codigo_unico = UUID.randomUUID();
		return codigo_unico.toString();
	}
	
	public void adicionaItens(ItemCarrinho item) {
		if(this.itens == null) {
			this.itens = new ArrayList<ItemCarrinho>();
		}
		this.itens.add(item);
	}
}

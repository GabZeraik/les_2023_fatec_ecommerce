package ecommerce_les2023.modelo;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class Pedido extends EntidadeDominio {

	private String codigo;
	private float valor_total;
	private String situacao;
	private String data_pedido;
	private String modificado_por;
	private String ultima_atualizacao;
	private int cliente_id;
	private List<ItemPedido> item_pedido;
	private List<Transacao> transacao;
	private int cupom_id;
	private List<PedidoTroca> pedido_troca;

	public Pedido(float valor_total, String situacao, String modificado_por, String ultima_atualizacao,
			int cliente_id) {
		this.codigo = this.gerarCodigoUnico();
		this.valor_total = valor_total;
		this.situacao = situacao;
		this.modificado_por = modificado_por;
		this.ultima_atualizacao = ultima_atualizacao;
		this.cliente_id = cliente_id;
	}
	
	public Pedido(String codigo, float valor_total, String data_pedido, String situacao, String modificado_por, String ultima_atualizacao,
			int cliente_id) {
		this.codigo = codigo;
		this.valor_total = valor_total;
		this.situacao = situacao;
		this.modificado_por = modificado_por;
		this.ultima_atualizacao = ultima_atualizacao;
		this.cliente_id = cliente_id;
		this.data_pedido = data_pedido;
	}
	
	public Pedido(String codigo, String situacao, int cliente_id) {
		this.codigo = codigo;
		this.situacao = situacao;
		this.cliente_id = cliente_id;
		
	}
	
	public Pedido(String codigo) {
		this.codigo = codigo;
	}

	public Pedido() {
		
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public float getValor_total() {
		return valor_total;
	}

	public void setValor_total(float valor_total) {
		this.valor_total = valor_total;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public String getModificado_por() {
		return modificado_por;
	}

	public void setModificado_por(String modificado_por) {
		this.modificado_por = modificado_por;
	}

	public String getUltima_atualizacao() {
		return ultima_atualizacao;
	}

	public void setUltima_atualizacao(String ultima_atualizacao) {
		this.ultima_atualizacao = ultima_atualizacao;
	}

	public int getCliente_id() {
		return cliente_id;
	}

	public void setCliente_id(int cliente_id) {
		this.cliente_id = cliente_id;
	}

	public List<ItemPedido> getItem_pedido() {
		return item_pedido;
	}

	public void setItem_pedido(List<ItemPedido> item_pedido) {
		this.item_pedido = item_pedido;
	}

	public List<Transacao> getTransacao() {
		return transacao;
	}

	public void setTransacao(List<Transacao> transacao) {
		this.transacao = transacao;
	}

	public int getCupom_id() {
		return cupom_id;
	}

	public void setCupom_id(int cupom_id) {
		this.cupom_id = cupom_id;
	}
	
	public String gerarCodigoUnico() {
		UUID codigo_unico = UUID.randomUUID();
		return codigo_unico.toString();
	}

	public void adicionaItemPedido(ItemPedido item) {
		if(this.item_pedido == null) {
			this.item_pedido = new ArrayList<ItemPedido>();
		}
		this.item_pedido.add(item);
	}
	
	public void adicionaTransacao(Transacao transacao) {
		if(this.transacao == null) {
			this.transacao = new ArrayList<Transacao>();
		}
		this.transacao.add(transacao);
	}

	public String getData_pedido() {
		return data_pedido;
	}

	public void setData_pedido(String data_pedido) {
		this.data_pedido = data_pedido;
	}

	public void adicionaPedidoTroca(PedidoTroca pedido) {
		if(this.pedido_troca == null) {
			this.pedido_troca = new ArrayList<PedidoTroca>();
		}
		this.pedido_troca.add(pedido);
	}
	
	public List<PedidoTroca> getPedido_troca() {
		return pedido_troca;
	}
}

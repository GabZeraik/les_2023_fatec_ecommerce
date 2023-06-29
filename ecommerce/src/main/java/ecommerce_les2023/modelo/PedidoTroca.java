package ecommerce_les2023.modelo;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class PedidoTroca extends EntidadeDominio {

	private String codigo;
	private float valor_total;
	private String situacao;
	private String data_pedido;
	private String modificado_por;
	private String ultima_atualizacao;
	private int cliente_id;
	private List<ItemTroca> item_troca;
	private List<Transacao> transacao;
	private int cupom_id;
	
	public PedidoTroca(float valor_total, String situacao, String modificado_por, String ultima_atualizacao,
			int cliente_id) {
		this.codigo = this.gerarCodigoUnico();
		this.valor_total = valor_total;
		this.situacao = situacao;
		this.modificado_por = modificado_por;
		this.ultima_atualizacao = ultima_atualizacao;
		this.cliente_id = cliente_id;
	}
	
	public PedidoTroca(String codigo, float valor_total, String data_pedido, String situacao, String modificado_por, String ultima_atualizacao,
			int cliente_id) {
		this.codigo = codigo;
		this.valor_total = valor_total;
		this.situacao = situacao;
		this.modificado_por = modificado_por;
		this.ultima_atualizacao = ultima_atualizacao;
		this.cliente_id = cliente_id;
		this.data_pedido = data_pedido;
	}
	
	public PedidoTroca(String codigo, String situacao, int cliente_id) {
		this.codigo = codigo;
		this.situacao = situacao;
		this.cliente_id = cliente_id;
	}
	
	public PedidoTroca(String codigo) {
		this.codigo = codigo;
	}

	public PedidoTroca() {
		
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

	public List<ItemTroca> getItem_troca() {
		return item_troca;
	}

	public void setItem_troca(List<ItemTroca> item_troca) {
		this.item_troca = item_troca;
	}

	public List<Transacao> getTransacao() {
		return transacao;
	}

	public void setTransacao(List<Transacao> transacao) {
		this.transacao = transacao;
	}

	public String gerarCodigoUnico() {
		UUID codigo_unico = UUID.randomUUID();
		return codigo_unico.toString();
	}

	public void adicionaItemTroca(ItemTroca item) {
		if(this.item_troca == null) {
			this.item_troca = new ArrayList<ItemTroca>();
		}
		this.item_troca.add(item);
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
	
	public void calculaValorTotal() {
		for(ItemTroca item : this.item_troca) {
			this.valor_total += (item.getPreco_unitario() * item.getQuantidade());
		}
	}

	public int getCupom_id() {
		return cupom_id;
	}

	public void setCupom_id(int cupom_id) {
		this.cupom_id = cupom_id;
	}
	
}

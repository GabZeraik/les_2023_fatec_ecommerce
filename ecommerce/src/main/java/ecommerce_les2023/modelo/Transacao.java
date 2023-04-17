package ecommerce_les2023.modelo;

public class Transacao extends EntidadeDominio{

	private int cartao_id;
	private float valor_pago;
	private int pedido_id;
	
	public Transacao(int cartao_id, float valor_pago, int pedido_id) {
		this.cartao_id = cartao_id;
		this.valor_pago = valor_pago;
		this.pedido_id = pedido_id;
	}
	
	public int getPedido_id() {
		return pedido_id;
	}

	public void setPedido_id(int pedido_id) {
		this.pedido_id = pedido_id;
	}

	public int getCartao_id() {
		return cartao_id;
	}

	public void setCartao_id(int cartao_id) {
		this.cartao_id = cartao_id;
	}

	public float getValor_pago() {
		return valor_pago;
	}

	public void setValor_pago(float valor_pago) {
		this.valor_pago = valor_pago;
	}
}

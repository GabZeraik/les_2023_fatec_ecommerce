package ecommerce_les2023.modelo;

public class Cupom extends EntidadeDominio{

	private String codigo;
	private float valor;
	private String tipo;
	private int cliente_id;
	private int pedido_id;
	private int valido;
	
	public Cupom() {
		// TODO Auto-generated constructor stub
	}
	
	public Cupom(String codigo, float valor, String tipo, int cliente_id, int valido) {
		this.codigo = codigo;
		this.valor = valor;
		this.tipo = tipo;
		this.cliente_id = cliente_id;
		this.valido = valido;
	}
	
	public Cupom(int id, String codigo, float valor, String tipo, int cliente_id, int pedido_id, int valido) {
		this.id = id;
		this.codigo = codigo;
		this.valor = valor;
		this.tipo = tipo;
		this.cliente_id = cliente_id;
		this.pedido_id = pedido_id;
		this.valido = valido;
	}

	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public float getValor() {
		return valor;
	}
	public void setValor(float valor) {
		this.valor = valor;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public int getCliente_id() {
		return cliente_id;
	}
	public void setCliente_id(int cliente_id) {
		this.cliente_id = cliente_id;
	}

	public int getValido() {
		return valido;
	}

	public void setValido(int valido) {
		this.valido = valido;
	}

	public int getPedido_id() {
		return pedido_id;
	}

	public void setPedido_id(int pedido_id) {
		this.pedido_id = pedido_id;
	}
}

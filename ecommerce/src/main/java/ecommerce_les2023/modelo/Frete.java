package ecommerce_les2023.modelo;

public class Frete extends EntidadeDominio{
	
	private int codigo;
	private float porcentagem;
	
	public Frete() {
		// TODO Auto-generated constructor stub
	}
	
	public Frete(int codigo, float porcentagem) {
		this.codigo = codigo;
		this.porcentagem = porcentagem;
	}
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public float getPorcentagem() {
		return porcentagem;
	}
	public void setPorcentagem(float porcentagem) {
		this.porcentagem = porcentagem;
	}
}

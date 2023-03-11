package ecommerce_les2023.modelo;

import java.util.Calendar;

public class EntidadeDominio {
	
	protected int id;
	protected Calendar dta_cadastro;
	
	public EntidadeDominio() {
		this.dta_cadastro = Calendar.getInstance();
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public Calendar getDta_cadastro() {
		return dta_cadastro;
	}
	
	public void setDta_cadastro(Calendar dta_cadastro) {
		this.dta_cadastro = dta_cadastro;
	}
	
	public void setDta_cadastro(long dta_cadastro) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(dta_cadastro);
		this.dta_cadastro = calendar;
	}
}

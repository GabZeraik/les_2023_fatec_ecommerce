package ecommerce_les2023.utils;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import ecommerce_les2023.modelo.EntidadeDominio;

public class Log {

	public String gerarLog(EntidadeDominio entidade, String operacao){
		StringBuilder sb = new StringBuilder();
		sb.append("**** LOG DE OPERAÇÃO **** \n");
		String dta_cadastro = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(entidade.getDta_cadastro().getTime()).toString();
		sb.append(operacao + " realizado(a) em: " + new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(Calendar.getInstance().getTime()).toString()  + '\n');
		List<Field> lista_atributos = this.getAllFields(entidade.getClass());
		for(Field field : lista_atributos) {
			field.setAccessible(true);
			try {
				sb.append(field.getName() + " - ");
				sb.append(field.getName() == "dta_cadastro" ? dta_cadastro : field.get(entidade));
				sb.append('\n');
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
        return sb.toString();
	}
	
	public String gerarLog(List<EntidadeDominio> entidades, String operacao){
		StringBuilder sb = new StringBuilder();
		sb.append("**** LOG DE OPERAÇÃO **** \n");
		sb.append(operacao + " realizado(a) em: " + new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(Calendar.getInstance().getTime()).toString()  + '\n');
		for(EntidadeDominio entidade : entidades) {
			String dta_cadastro = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(entidade.getDta_cadastro().getTime()).toString();
			List<Field> lista_atributos = this.getAllFields(entidade.getClass());
			for(Field field : lista_atributos) {
				field.setAccessible(true);
				try {
					sb.append(field.getName() + " - ");
					sb.append(field.getName() == "dta_cadastro" ? dta_cadastro : field.get(entidade));
					sb.append('\n');
				} catch (IllegalArgumentException | IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
        return sb.toString();
	}
	
	/*
	 * Realiza iteração em todas as superclasses, recursivamente, para obter todos os atributos das mesmas e da própria classe e retornar uma lista de Fields
	 */
	public List<Field> getAllFields(Class classe){
		if (classe == null) {
	        return Collections.emptyList();
	    }
		
		List<Field> result = new ArrayList<>(getAllFields(classe.getSuperclass()));
		List<Field> filteredFields = Arrays.stream(classe.getDeclaredFields())
			      .collect(Collectors.toList());
		result.addAll(filteredFields);
		return result;
	}

}

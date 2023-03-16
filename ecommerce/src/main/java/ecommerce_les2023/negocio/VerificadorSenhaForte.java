package ecommerce_les2023.negocio;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import ecommerce_les2023.modelo.Cliente;
import ecommerce_les2023.modelo.EntidadeDominio;

public class VerificadorSenhaForte implements IStrategy {

	@Override
	public String processarStrategy(EntidadeDominio entidade) {
		System.out.println("ENTROU NA STRATEGY " + this.getClass().getName());
		
		if(entidade instanceof Cliente){
			Cliente cliente = (Cliente) entidade;
			String senha = cliente.getSenha();
			if(senha.length() >= 8) {
				Pattern letras = Pattern.compile("([A-Z])([a-z])");
				Pattern numeros = Pattern.compile("[0-9]");
		        Pattern especial = Pattern.compile ("[!@#$%&*()_+=|<>?{}\\[\\]~-]");
		        		        
		        Matcher temLetra = letras.matcher(senha);
		        Matcher temNumero = numeros.matcher(senha);
		        Matcher temEspecial = especial.matcher(senha);

		        if(!temLetra.find() && !temNumero.find() && !temEspecial.find()) {
		        	return "RNF0031 - A senha cadastrada pelo usuário deve ser composta de pelo menos 8 caracteres, ter letras maiúsculas e minúsculas além de conter caracteres especiais.";
		        }
			}
		}
		return null;
	}

}

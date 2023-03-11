package ecommerce_les2023.controle;

//Instancia uma nova fachada, já que todos os Commands utilizarão uma instância da Fachada
public abstract class AbstractCommand implements ICommand {
	protected IFachada fachada = new Fachada();
}

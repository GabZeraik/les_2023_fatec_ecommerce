package test.testes;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.RepeatedTest;
import org.junit.jupiter.api.RepetitionInfo;
import org.junit.jupiter.api.AfterAll;

import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.io.FileHandler;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class TesteSolicitarTroca {
	//private static List<String> massa_cadastro;
	//private static Path path_arquivo = Paths.get("C:\\Users\\gbrie\\Documents\\GitHub\\les_2023_fatec_ecommerce\\ecommerce\\src\\main\\java\\test\\massa_testes\\TESTE_ALTERAR_STATUS_PEDIDO.txt");
	private static WebDriver driver = new FirefoxDriver();
	//private static TesteAlterarStatusPedido statusPedido = new TesteAlterarStatusPedido();
	
	@BeforeAll
	public static void init(){
        System.out.println("*****Teste de solicitação de troca de itens*****");
    }
	
	@BeforeEach
	public void inicioTeste(){
        System.out.println("Preenchendo formulário");
    }
			
    @RepeatedTest(1)
    @DisplayName("Teste de solicitação de troca de itens que devem ser concluídos com sucesso.")
    public void solicitacaoTroca (RepetitionInfo repetitionInfo){
    	
    	WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
    	
    	driver.get("localhost:8080/ecommerce_les/login.jsp");  	
    	
    	WebElement botaoEntrar = wait.until(ExpectedConditions.elementToBeClickable(new By.ByName("entrar_cliente")));
    	botaoEntrar.click();
    	
    	driver.get("localhost:8080/ecommerce_les/account.jsp");  	
  
    	driver.findElement(new By.ByCssSelector("#resultado_tabela_pedidos > tbody > tr:first-child td a")).click();
    	WebElement botao_troca = wait.until(ExpectedConditions.visibilityOfElementLocated(new By.ByCssSelector("#resultado_tabela_pedidos > tbody > tr:first-child input[value=\"Solicitar troca/devolução\"]")));
    	botao_troca.click();
		    	
    	//wait.until(ExpectedConditions.visibilityOfElementLocated(new By.ByCssSelector(".container-modal-teste ")));
    	List<WebElement> checkboxes = driver.findElements(new By.ByCssSelector(".modal.fade.in input[type='checkbox']"));
    	for(WebElement cb : checkboxes) {
    		cb.click();
    	}
    	
    	List<WebElement> inputs_quantidades = driver.findElements(new By.ByCssSelector(".modal.fade.in input[type=\"number\"]"));
    	for(WebElement ip : inputs_quantidades) {
    		ip.clear();
    		ip.sendKeys("1");
    	}
    	
    	driver.findElement(new By.ByCssSelector(".modal.fade.in button[type=\"submit\"]")).click();
    	
    	wait.until(ExpectedConditions.presenceOfElementLocated(By.id("mensagem_resultado")));
    	
    	String texto_resultado = driver.findElement(By.id("mensagem_resultado")).getText();
    	
    	//tenta tirar print da tela
		try {
			obtemPrintTela();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	assertTrue(texto_resultado, texto_resultado.contains("sucesso"));
		
    }
    
    public String obtemDataHoraTeste() {
		DateTimeFormatter dh = DateTimeFormatter.ofPattern("dd-MM-yyyy_HH-mm-ss");
    	LocalDateTime dia_hora = LocalDateTime.now();
		return dh.format(dia_hora);
	}
		
	public void obtemPrintTela() throws IOException {
		File scrFile = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
    	FileHandler.copy(scrFile, new File("C:\\Users\\gbrie\\Documents\\GitHub\\les_2023_fatec_ecommerce\\ecommerce\\src\\main\\java\\test\\testes\\prints_tela\\" + this.getClass().getTypeName() + "_" + obtemDataHoraTeste() + ".png"));
	}

	@AfterAll
	public static void finalizaTeste(){
        System.out.println("Teste finalizado");
        driver.quit();
    }
}

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
import java.util.ArrayList;
import java.util.List;

public class TesteRealizarCompra {
	//private static List<String> massa_cadastro;
	//private static Path path_arquivo = Paths.get("");
	private static WebDriver driver = new FirefoxDriver();	
	
	@BeforeAll
	public static void init(){
        System.out.println("*****Teste de compra iniciado*****");
    }
	
	@BeforeEach
	public void inicioTeste(){
        System.out.println("Realizando compra");
    }
			
    @RepeatedTest(1)
    @DisplayName("Teste de realização de compra.")
    public void cadastroClientes (RepetitionInfo repetitionInfo){ 
		    	
    	driver.get("localhost:8080/ecommerce_les/products.jsp");
    	
    	List<WebElement> produtos = driver.findElements(new By.ByCssSelector(".product-box p:nth-child(2) > a"));
    	List<String> url_produtos = new ArrayList<>();
    	
    	for (WebElement produto : produtos) {
    		url_produtos.add(produto.getAttribute("href"));
    	}
    	
		for (String url : url_produtos) {
    		driver.get(url);
    		try{
    			WebElement input_quantidade = new WebDriverWait(driver, Duration.ofSeconds(3)).until(ExpectedConditions.presenceOfElementLocated(new By.ByName("item_carrinho_quantidade")));
    			int quantidade_maxima = Integer.parseInt(input_quantidade.getAttribute("max"));
    			input_quantidade.clear();
    			if(quantidade_maxima > 2) quantidade_maxima = 2;
    			input_quantidade.sendKeys(String.valueOf(quantidade_maxima));
    			driver.findElement(new By.ById("btnAdicionarAoCarrinho")).click();
        	}catch (Exception e) {
    			System.out.println("Produto esgotado");
    		}finally {
				driver.navigate().back();
			}
    	}
		   	
    	driver.get("localhost:8080/ecommerce_les/cart.jsp");
    	
    	WebElement botaoFinalizar = new WebDriverWait(driver, Duration.ofSeconds(3)).until(ExpectedConditions.elementToBeClickable(new By.ById("checkout")));
    	botaoFinalizar.click();
    	
    	WebElement botaoEntrar = new WebDriverWait(driver, Duration.ofSeconds(3)).until(ExpectedConditions.elementToBeClickable(new By.ByName("entrar_cliente")));
    	botaoEntrar.click();
    	
    	botaoFinalizar = new WebDriverWait(driver, Duration.ofSeconds(3)).until(ExpectedConditions.elementToBeClickable(new By.ById("checkout")));
    	botaoFinalizar.click();
    	
    	driver.findElement(new By.ByCssSelector("#wrapper > section.main-content > div > div > section:nth-child(1) > div.accordion-heading > a")).click();
    	driver.findElement(new By.ByCssSelector("input[name=\"endereco_selecionado_id\"]")).click();
    	
    	String valor_compra = driver.findElement(new By.ById("span_resumo_total_final")).getAttribute("innerHTML");
    	valor_compra = valor_compra.replace("R$", "");
    	valor_compra = valor_compra.replace(",", ".");
    	
    	driver.findElement(new By.ByCssSelector("#wrapper > section.main-content > div > div > section.finalizar-compra > div > div.accordion-heading > a")).click();
    	driver.findElement(new By.ByClassName("card")).click();
    	
    	WebElement input = new WebDriverWait(driver, Duration.ofSeconds(3)).until(ExpectedConditions.presenceOfElementLocated(new By.ByCssSelector(".cartoes_disponiveis input[type=\"text\"]")));
    	input.sendKeys(valor_compra);
    	    	
    	driver.findElement(new By.ById("btnFinalizarCompra")).click();
    	
    	WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));

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

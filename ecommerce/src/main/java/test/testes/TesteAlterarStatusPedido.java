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
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class TesteAlterarStatusPedido {
	private static List<String> massa_cadastro;
	private static Path path_arquivo = Paths.get("C:\\Users\\gbrie\\Documents\\GitHub\\les_2023_fatec_ecommerce\\ecommerce\\src\\main\\java\\test\\massa_testes\\TESTE_ALTERAR_STATUS_PEDIDO.txt");
	private static WebDriver driver = new FirefoxDriver();	
	
	static {
        try{
        	massa_cadastro = Files.readAllLines(path_arquivo);
        } catch (IOException e){
            System.out.println("Não foi possível ler o arquivo específicado");
        }
    }
	
	@BeforeAll
	public static void init(){
        System.out.println("*****Teste de alteração de status do pedido*****");
    }
	
	@BeforeEach
	public void inicioTeste(){
        System.out.println("Preenchendo formulário");
    }
			
    @RepeatedTest(1)
    @DisplayName("Teste com alteração de pedidos que devem ser concluídos com sucesso.")
    public void alterarStatusPedido (RepetitionInfo repetitionInfo, String valorStatus){ 
		if(valorStatus.isEmpty()) valorStatus = "ENTREGUE";
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
		    	
    	driver.get("localhost:8080/ecommerce_les/admin_pedidos.jsp");
    	
    	driver.findElement(new By.ById("botao_consultar")).click();
    	
    	driver.findElement(new By.ByCssSelector("#resultado_tabela_pedidos > tbody > tr:last-child td button")).click();
    	
    	WebElement select = wait.until(ExpectedConditions.presenceOfElementLocated(new By.ByCssSelector("#resultado_tabela_pedidos > tbody > tr:last-child td select")));
    	Select dropdown = new Select(select);
    	driver.manage().timeouts().implicitlyWait(Duration.ofMillis(5000));
    	
    	dropdown.selectByValue(valorStatus);
    	
    	driver.findElement(new By.ByCssSelector("#resultado_tabela_pedidos > tbody > tr:last-child > td:nth-child(6) > div > div > div > div > input")).click();   	
		
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

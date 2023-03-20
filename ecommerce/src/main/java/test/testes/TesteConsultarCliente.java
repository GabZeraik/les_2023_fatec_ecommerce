package test.testes;

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

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.RepeatedTest;
import org.junit.jupiter.api.RepetitionInfo;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.io.FileHandler;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class TesteConsultarCliente{
	private static List<String> massa_cadastro;
	private static Path path_arquivo = Paths.get("C:\\Users\\gbrie\\Documents\\GitHub\\les_2023_fatec_ecommerce\\ecommerce\\src\\main\\java\\test\\massa_testes\\TESTE_CONSULTA_CLIENTE.txt");
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
        System.out.println("*****Teste de consulta de cliente iniciado*****");
    }
	
	@BeforeEach
	public void inicioTeste(){
        System.out.println("Preenchendo formulário");
    }
			
    @RepeatedTest(3)
    @DisplayName("Teste de consulta de cadastros que devem ser concluídos com sucesso. 1 - por nome. 2 - por email. 3 - por cpf")
    public void cadastroClientes (RepetitionInfo repetitionInfo){ 
		int linha = repetitionInfo.getCurrentRepetition() - 1;
		String[] valores = massa_cadastro.get(linha).split(";");
		    	
    	driver.get("localhost:8080/ecommerce_les/admin_clientes.jsp");
    	
    	driver.manage().timeouts().implicitlyWait(Duration.ofMillis(1000));
    	
    	if(linha == 0) {
	    	//consulta por nome
    		driver.findElement(new By.ById("filtro_nome_cliente")).clear();
	    	driver.findElement(new By.ById("filtro_nome_cliente")).sendKeys(valores[0]);
    	}else if(linha == 1) {
    		//consulta por email
    		driver.findElement(new By.ById("filtro_email_cliente")).clear();
	    	driver.findElement(new By.ById("filtro_email_cliente")).sendKeys(valores[0]);
    	}else {
    		//consulta por cpf
    		driver.findElement(new By.ById("filtro_cpf_cliente")).clear();
	    	driver.findElement(new By.ById("filtro_cpf_cliente")).sendKeys(valores[0]);
    	}
        	
    	driver.findElement(new By.ById("botao_consultar")).click();
    	driver.manage().timeouts().implicitlyWait(Duration.ofMillis(2000));
    	
    	WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));

    	wait.until(ExpectedConditions.presenceOfElementLocated(By.id("tabela_resultado")));
    	    	
    	for(WebElement td : driver.findElements(new By.ByCssSelector("#tabela_resultado tbody tr td"))) {
    		System.out.println(td.getText());
    		if(td.getText().contains(valores[0])) {
    			//tenta tirar print da tela
    			try {
    				obtemPrintTela();
    			} catch (IOException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    			
    			assertTrue("Resultado da pesquisa obtido com sucesso.", td.getText().contains(valores[0]));
    		}
    	}
    	
    	try {
			obtemPrintTela();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	assertTrue("Resultado não encontrado", false);
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

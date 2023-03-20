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
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.io.FileHandler;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class TesteAlterarCliente {
	private static List<String> massa_cadastro;
	private static Path path_arquivo = Paths.get("C:\\Users\\gbrie\\Documents\\GitHub\\les_2023_fatec_ecommerce\\ecommerce\\src\\main\\java\\test\\massa_testes\\TESTE_ALTERAR_CLIENTE.txt");
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
        System.out.println("*****Teste de alteração de cliente iniciado*****");
    }
	
	@BeforeEach
	public void inicioTeste(){
        System.out.println("Preenchendo formulário");
    }
			
    @RepeatedTest(1)
    @DisplayName("Teste para alteração de cadastro que deve ser concluídos com sucesso.")
    public void cadastroClientes (RepetitionInfo repetitionInfo){ 
		int linha = repetitionInfo.getCurrentRepetition() - 1;
		String[] valores = massa_cadastro.get(linha).split(";");
		    	
    	driver.get("localhost:8080/ecommerce_les/admin_clientes.jsp");
    	
    	driver.manage().timeouts().implicitlyWait(Duration.ofMillis(1000));
    	
    	driver.findElement(new By.ByCssSelector("input[value='CONSULTAR']")).click();
    	
    	driver.manage().timeouts().implicitlyWait(Duration.ofMillis(1000));
    	
    	driver.findElement(new By.ByCssSelector("button[value='ALTERAR']")).click();
    	
    	driver.findElement(new By.ByCssSelector("button[title='Editar']")).click();
    	
    	//altera nome e telefone
    	
    	try {
			Thread.sleep(5000);
			driver.manage().timeouts().implicitlyWait(Duration.ofMillis(5000));
			driver.findElement(new By.ById("formAlterarCadastroParcial_nome_completo")).clear();
			driver.findElement(new By.ById("formAlterarCadastroParcial_telefone_numero")).clear();
			driver.findElement(new By.ById("formAlterarCadastroParcial_nome_completo")).sendKeys(valores[0]);
			driver.findElement(new By.ById("formAlterarCadastroParcial_telefone_numero")).sendKeys(valores[1]);
	    	driver.findElement(new By.ById("btn_alterar_cadastro")).submit();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));

    	wait.until(ExpectedConditions.presenceOfElementLocated(By.id("mensagem_resultado")));
    	
    	String texto_resultado = driver.findElement(By.id("mensagem_resultado")).getText();
    	
    	assertTrue(texto_resultado, texto_resultado.contains("sucesso"));
    	
    	//tenta tirar print da tela
		try {
			obtemPrintTela();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

		@AfterAll
		public static void finalizaTeste(){
	        System.out.println("Teste finalizado");
	        driver.quit();
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
}

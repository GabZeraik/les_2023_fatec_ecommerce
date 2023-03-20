package test.testes;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.RepeatedTest;
import org.junit.jupiter.api.RepetitionInfo;
import org.junit.jupiter.api.AfterAll;

import static org.junit.Assert.assertTrue;

import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.io.FileHandler;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class TesteCadastrarCliente_Erro_Strategy {
	private static List<String> massa_cadastro;
	private static Path path_arquivo = Paths.get("C:\\Users\\gbrie\\Documents\\GitHub\\les_2023_fatec_ecommerce\\ecommerce\\src\\main\\java\\test\\massa_testes\\TESTE_CADASTRO_CLIENTE.txt");
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
        System.out.println("*****Teste de cadastro de cliente iniciado*****");
    }
	
	@BeforeEach
	public void inicioTeste(){
        System.out.println("Preenchendo formulário");
    }
			
    @RepeatedTest(3)
    @DisplayName("Teste com cadastros que devem falhar por causa das strategies.")
    public void cadastroClientes (RepetitionInfo repetitionInfo){ 
		int linha = repetitionInfo.getCurrentRepetition();
		String[] valores = massa_cadastro.get(linha).split(";");
		    	
    	driver.get("localhost:8080/ecommerce_les/register.jsp");
    	
    	driver.manage().timeouts().implicitlyWait(Duration.ofMillis(1000));
    	
    	driver.findElement(new By.ById("usuario")).sendKeys(valores[0]);
    	
    	driver.findElement(new By.ById("senha")).sendKeys(valores[1]);
    	
    	driver.findElement(new By.ById("nome_completo")).sendKeys(valores[2]);
    	
    	driver.findElement(new By.ById("data_nascimento")).sendKeys(valores[3]);
    	
    	driver.findElement(new By.ById("genero")).sendKeys(valores[4]);
    	
    	driver.findElement(new By.ById("cpf")).sendKeys(valores[5]);
    	
    	driver.findElement(new By.ById("email")).sendKeys(valores[6]);
    	
    	driver.findElement(new By.ById("telefone_ddd")).sendKeys(valores[7]);
    	
    	driver.findElement(new By.ById("telefone_numero")).sendKeys(valores[8]);
    	
    	driver.findElement(new By.ById("telefone_tipo")).sendKeys(valores[9]);
    	
    	driver.findElement(new By.ById("endereco_entrega_frase_curta")).sendKeys(valores[10]);
    	
    	driver.findElement(new By.ById("endereco_entrega_tipo_residencia")).sendKeys(valores[11]);
    	
    	driver.findElement(new By.ById("endereco_entrega_cep")).sendKeys(valores[12]);
    	
    	driver.findElement(new By.ById("endereco_entrega_tipo_logradouro")).sendKeys(valores[13]);
    	
    	driver.findElement(new By.ById("endereco_entrega_logradouro")).sendKeys(valores[14]);
    	
    	driver.findElement(new By.ById("endereco_entrega_numero")).sendKeys(valores[15]);
    	
    	driver.findElement(new By.ById("endereco_entrega_bairro")).sendKeys(valores[16]);
    	
    	driver.findElement(new By.ById("endereco_entrega_cidade")).sendKeys(valores[17]);
    	
    	driver.findElement(new By.ById("endereco_entrega_estado")).sendKeys(valores[18]);
    	
    	driver.findElement(new By.ById("endereco_entrega_pais")).sendKeys(valores[19]);
    	
    	driver.findElement(new By.ById("endereco_entrega_observacao")).sendKeys(valores[20]);
    	
    	driver.findElement(new By.ById("endereco_cobranca_frase_curta")).sendKeys(valores[21]);
    	
    	driver.findElement(new By.ById("endereco_cobranca_tipo_residencia")).sendKeys(valores[22]);
    	
    	driver.findElement(new By.ById("endereco_cobranca_cep")).sendKeys(valores[23]);
    	
    	driver.findElement(new By.ById("endereco_cobranca_tipo_logradouro")).sendKeys(valores[24]);
    	
    	driver.findElement(new By.ById("endereco_cobranca_logradouro")).sendKeys(valores[25]);
    	
    	driver.findElement(new By.ById("endereco_cobranca_numero")).sendKeys(valores[26]);
    	
    	driver.findElement(new By.ById("endereco_cobranca_bairro")).sendKeys(valores[27]);
    	
    	driver.findElement(new By.ById("endereco_cobranca_cidade")).sendKeys(valores[28]);
    	
    	driver.findElement(new By.ById("endereco_cobranca_estado")).sendKeys(valores[29]);
    	
    	driver.findElement(new By.ById("endereco_cobranca_pais")).sendKeys(valores[30]);
    	
    	driver.findElement(new By.ById("endereco_cobranca_observacao")).sendKeys(valores[31]);
    	
    	driver.findElement(new By.ById("botao_submit")).click();
    	
       	WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));

    	wait.until(ExpectedConditions.presenceOfElementLocated(By.id("mensagem_resultado")));
    	
    	String texto_resultado = driver.findElement(By.id("mensagem_resultado")).getText();
    	
    	assertTrue(texto_resultado, !texto_resultado.contains("sucesso"));	
    	
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

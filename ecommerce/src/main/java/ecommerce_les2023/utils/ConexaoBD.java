package ecommerce_les2023.utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoBD {
	
	private static String driver;
	private static String url;
	private static String user;
	private static String password;
	private static Connection conexaoBD;
	
	public static Connection main(String args[]) throws SQLException {
		try {
			conexaoBD = getConnectionPostgres();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			conexaoBD = null;
		}finally {
			if(conexaoBD == null)
				System.out.println("NÃO FOI POSSÍVEL CONECTAR!!!!");
			else 
				System.out.println("CONECTADO!!!!");
		}
		return conexaoBD;
	}

	public static Connection getConnectionPostgres() throws ClassNotFoundException, SQLException {
		driver = "org.postgresql.Driver";
		url = "jdbc:postgresql://localhost:5432/ecommerce_les";
		user = "postgres";
		password = "admin";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}

}


package database;
import java.sql.Connection;
import java.sql.DriverManager;


public class Database {

	private static final String USERNAME = "root";

	private static final String PASSWORD = "19RubI97";

	private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/vayvem";
	
	public static Connection createConnectionToMySql() throws
Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection connection = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
		return connection;

	}
	
	public static void main(String[] args) throws Exception{
		Connection con = createConnectionToMySql();
		
		if (con != null) {
			System.out.println("Conexão Obitida com Sucesso!" + con);
			con.close();
		}
		
	}
}
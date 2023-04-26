package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB_Conn {

	public String _sql;

	Connection conn = null;

	public DB_Conn() {
		Connection();
	}

	public DB_Conn(String _sql) {
		Connection();
		this._sql = _sql;
	}

	void Connection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost/book?characterEncoding=UTF-8&serverTimezone=UTC";
			String id = "root";
			String pwd = "1234"; // mysql 접속 비번
			conn = DriverManager.getConnection(url, id, pwd);
			System.out.println("db접속 성공");
		} catch (Exception e) {

			System.out.println("db접속 실패");
			e.printStackTrace();
		}

	}
}
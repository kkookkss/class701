package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	// Oracle에서 제공하는 JDBC 드라이버 (각 DBMS 회사에서 제공하는 라이브러리 압축파일) 이름
	static final String ORACLE_DRIVER = "oracle.jdbc.driver.OracleDriver";
	static final String ORACLE_URL = "jdbc:oracle:thin:@175.193.80.187:49192:xe";

	// MySQL에서 제공하는 JDBC 드라이버 (각 DBMS 회사에서 제공하는 라이브러리 압축파일) 이름
	static final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String MYSQL_URL = "jdbc:mysql://localhost:3306/class701?serverTimezone=Asia/Seoul";
//	static final String MYSQL_URL = "jdbc:mysql://192.168.0.27:3306/bitcamp?serverTimezone=Asia/Seoul";

	public DbConnect() {
		try {
			// JDBC 드라이버 로드
			// Class.forName() 메서드를 호출하여,
			// Oracle에서 제공하는 Driver 클래스를 JVM method area에 로딩시킨다. 
			Class.forName(ORACLE_DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("Oracle 드라이버 오류: " + e.getMessage());
		}

		try {
			// JDBC 드라이버 로드
			// Class.forName() 메서드를 호출하여,
			// MySQL에서 제공하는 Driver 클래스를 JVM method area에 로딩시킨다. 
			Class.forName(MYSQL_DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("MySQL 드라이버 오류: " + e.getMessage());
		}
	}

	// Oracle 서버 연결
	public Connection getOracleConnection() {
		
		// 데이터베이스 연결
		// Connection 객체 생성
		Connection conn = null;
		try {
			// DriverManager 클래스의 static 메서드인 getConnecting() 메서드를 호출하여
			// Oracle에 연결하기 위한 커넥션 정보(url, user, password)를 입력
			conn = DriverManager.getConnection(ORACLE_URL, "angel", "a1234");
		} catch (SQLException e) {
			System.out.println("오라클 연결 실패" + e.getMessage());
		}
		// getConnecting() 메서드 수행 결과로 Connecting 객체를 반환
		// Connecting 객체를 통해 쿼리를 날리는 statement를 작성할 수 있음
		// SELECT 쿼리에서는 createStatement() 호출
		// INSERT 쿼리에서는 prepareStatement() 호출
		return conn;
	}

	// MySQL 서버 연결
	public Connection getMysqlConnection() {
		
		// 데이터베이스 연결
		// Connection 객체 생성
		Connection conn = null;
		try {
			// DriverManager 클래스의 static 메서드인 getConnecting() 메서드를 호출하여
			// MySQL에 연결하기 위한 커넥션 정보(url, user, password)를 입력
			conn = DriverManager.getConnection(MYSQL_URL, "angel", "1234");
		} catch (SQLException e) {
			System.out.println("MySQL 연결 실패" + e.getMessage());
		}
		// getConnecting() 메서드 수행 결과로 Connecting 객체를 반환
		// Connecting 객체를 통해 쿼리를 날리는 statement를 작성할 수 있음
		// SELECT 쿼리에서는 createStatement() 호출
		// INSERT 쿼리에서는 prepareStatement() 호출
		return conn;
	}

	// close 들 - overloading method
	public void dbClose(Connection conn, Statement stmt) {

		// 호출하는 메서드의 클래스 타입은 레퍼런스 즉 주소가 넘어오므로
		// 호출하는 메서드의 변수가 close된다.
		try {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {

		}
	}

	public void dbClose(Connection conn, Statement stmt, ResultSet rs) {

		// 호출하는 메서드의 클래스 타입은 레퍼런스 즉 주소가 넘어오므로
		// 호출하는 메서드의 변수가 close된다.
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {

		}
	}
	
	// PreparedStatement용 dbclose 생성
	public void dbClose(Connection conn, PreparedStatement pstmt) {

		// 호출하는 메서드의 클래스 타입은 레퍼런스 즉 주소가 넘어오므로
		// 호출하는 메서드의 변수가 close된다.
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {

		}
	}
	
	// PreparedStatement용 dbclose 생성
	public void dbClose(Connection conn, PreparedStatement pstmt, ResultSet rs) {

		// 호출하는 메서드의 클래스 타입은 레퍼런스 즉 주소가 넘어오므로
		// 호출하는 메서드의 변수가 close된다.
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {

		}
	}
}
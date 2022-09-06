package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.UserDto;
import db.DbConnect;

public class UserDao {

	DbConnect db = new DbConnect();
	
	public void insertUser(UserDto dto) {
		
		String sql = "insert into users (email, pwd, nickname, profile_image) values (?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getNickname());
			pstmt.setString(4, dto.getProfile_image());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	public String signIn(String email, String pwd) {
		 
		String sql = "select user_id from users where email=? and pwd=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String user_id = null;
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("user_id") != null ) {
					user_id = rs.getString("user_id");
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return user_id;
	}
	
	// num에 해당하는 dto반환
	public UserDto getUser(String user_id) {
		
		UserDto dto = new UserDto();
		
		String sql = "select * from users where user_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getMysqlConnection();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			// 바인딩
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	
				dto.setUser_id(rs.getString("user_id"));
				dto.setEmail(rs.getString("email"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPhone(rs.getString("phone"));
				dto.setProfile_image(rs.getString("profile_image"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
	
	public void updateUser(UserDto dto) {
		
		String sql = "update users set email=?, nickname=?, phone=?, pwd=?, profile_image=? where user_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getNickname());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getPwd());
			pstmt.setString(5, dto.getProfile_image());
			pstmt.setString(6, dto.getUser_id());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	public void deleteUser(String user_id) {
		
		String sql = "delete from users where user_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	public boolean isPassCheck(String user_id, String pwd) {
		
		boolean check = false;
		
		String sql = "select count(*) count from users where user_id=? and pwd=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 바인딩
			pstmt.setString(1, user_id);
			pstmt.setString(2, pwd);
			
			// 실행
			rs = pstmt.executeQuery();
			
			// 쿼리 실행결과가 있는 경우 check를 true로 변환
			if(rs.next()) {
				// 초기값이 false이므로 else는 굳이 안줘도 됨
				if(rs.getInt(1)==1) {
					check = true;					
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
		return check;
	}
}

package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.CartDto;
import data.dto.ClassDto;
import db.DbConnect;

public class CartDao {
	DbConnect db = new DbConnect();

	// 전체 조회
	public List<CartDto> getAllDatas(){
		
		List<CartDto> list = new ArrayList<>();
		
		String sql = "select * from carts";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getMysqlConnection();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartDto dto = new CartDto();
				
				dto.setCart_id(rs.getString("cart_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setClass_id(rs.getString("class_id"));
				dto.setPurchase_date(rs.getTimestamp("purchase_date"));
				
				// list에 추가
				list.add(dto);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	
	// 장바구니 클래스 리스트 조회
	public List<CartDto> getMyCartDatas(String user_id){
		
		List<CartDto> list = new ArrayList<>();
		
		String sql = "select * from carts where user_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getMysqlConnection();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartDto dto = new CartDto();
				
				dto.setCart_id(rs.getString("cart_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setClass_id(rs.getString("class_id"));
				dto.setPurchase_date(rs.getTimestamp("purchase_date"));
				
				// list에 추가
				list.add(dto);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	
	public void insertCart(CartDto dto) {
		
		String sql = "insert into carts (user_id, class_id, purchase_date) values (?,?,now())";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getClass_id());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	public void deleteCart(String cart_id) {
		
		String sql = "delete from carts where cart_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cart_id);
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	// 전체갯수 반환
	public int getTotalCount() {
		
		String sql = "select count(*) from carts";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		int total=0;
		
		conn = db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1); // 1번열
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		return total;
	}
	
	// 유저가 수강중인 클래스의 갯수
	public int getMyCount(String user_id) {
		
		String sql = "select count(*) from carts where user_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		int total=0;
		
		conn = db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1); // 1번열
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		return total;
	}
}

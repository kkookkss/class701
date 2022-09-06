package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.CategoryDto;
import db.DbConnect;

public class CategoryDao {
	DbConnect db = new DbConnect();

	public List<CategoryDto> getAllCategory() {
		
		List<CategoryDto> list = new Vector<>();
		
		String sql = "select * from categories order by category_name asc";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CategoryDto dto = new CategoryDto();
				
				dto.setCategory_id(rs.getString("category_id"));
				dto.setCategory_name(rs.getString("category_name"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	
	public CategoryDto getCategory(String category_id) {
		
		CategoryDto dto = new CategoryDto();
		
		String sql = "select * from categories where category_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setCategory_id(rs.getString("category_id"));
				dto.setCategory_name(rs.getString("category_name"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
}

package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.ClassDto;
import db.DbConnect;

public class ClassDao {
	DbConnect db = new DbConnect();
	
	public List<ClassDto> getAllData(){
		
		List<ClassDto> list = new ArrayList<>();
		
		String sql = "select * from classes order by releasedate asc";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getMysqlConnection();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ClassDto dto = new ClassDto();
				
				dto.setClass_id(rs.getString("class_id"));
				dto.setTitle(rs.getString("title"));
				dto.setMentor(rs.getString("mentor"));
				dto.setContent(rs.getString("content"));
				dto.setThumbnail_image(rs.getString("thumbnail_image"));
				dto.setMain_image(rs.getString("main_image"));
				dto.setPrice(rs.getString("price"));
				dto.setClass_option(rs.getString("class_option"));
				dto.setReleasedate(rs.getTimestamp("releasedate"));
				dto.setCategory_id(rs.getString("category_id"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	
	public ClassDto getData(String class_id){
		
		String sql = "select * from classes where class_id=?";
		
		ClassDto dto = new ClassDto();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getMysqlConnection();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, class_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setClass_id(rs.getString("class_id"));
				dto.setTitle(rs.getString("title"));
				dto.setMentor(rs.getString("mentor"));
				dto.setContent(rs.getString("content"));
				dto.setThumbnail_image(rs.getString("thumbnail_image"));
				dto.setMain_image(rs.getString("main_image"));
				dto.setPrice(rs.getString("price"));
				dto.setClass_option(rs.getString("class_option"));
				dto.setReleasedate(rs.getTimestamp("releasedate"));
				dto.setCategory_id(rs.getString("category_id"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
	// 전체갯수 반환
	public int getTotalCount() {
		
		String sql = "select count(*) from classes";
		
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
	// delete
	public void deleteClass(String class_id) {
		
		String sql = "delete from classes where class_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 바인딩
			pstmt.setString(1, class_id);
			
			// 실행
			pstmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	// insert
		public void insertClass(ClassDto dto) {
			
			String sql = "insert into classes (title, mentor, content, thumbnail_image, main_image, price, class_option, releasedate, category_id) values (?,?,?,?,?,?,?,now(),?)";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			conn = db.getMysqlConnection();
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				// 바인딩
				pstmt.setString(1, dto.getTitle());
				pstmt.setString(2, dto.getMentor());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getThumbnail_image());
				pstmt.setString(5, dto.getMain_image());
				pstmt.setString(6, dto.getPrice());
				pstmt.setString(7, dto.getClass_option());
				pstmt.setString(8, dto.getCategory_id());
				
				
				// 실행
				pstmt.execute();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				db.dbClose(conn, pstmt);
			}
		}
}

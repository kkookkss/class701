package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import data.dto.BoardDto;
import data.dto.ClassDto;
import db.DbConnect;

public class BoardDao {
	DbConnect db = new DbConnect();
	
	public List<BoardDto> getAllBoard(String sclass){
		
		List<BoardDto> list = new Vector<>();
		
		String sql = "select * from boards where subject like ? order by writeday desc";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getMysqlConnection();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+sclass+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDto dto = new BoardDto();
				
				dto.setBoard_id(rs.getString("board_id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setBlike(rs.getInt("blike"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setClass_id(rs.getString("class_id"));
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
	
	public void insertBoard(BoardDto dto) {
		
		String sql = "insert into boards (subject, content, writeday, user_id, category_id) values (?,?,now(),?,?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getUser_id());
			pstmt.setString(4, dto.getCategory_id());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	public void deleteBoard(String board_id) {
		
		String sql = "delete from boards where board_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, board_id);
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
}

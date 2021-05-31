package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.test.mvc.MemberDTO;
import com.util.mvc.DBConn;

public class MemberDAO
{
	private Connection conn;
		
		// 데이터베이스 연결 담당 메소드
		public Connection connection() throws ClassNotFoundException, SQLException
		{
			conn = DBConn.getConnection();
			return conn;
		}
		
		// 데이터베이스 입력 담당 메소드
		public int add(MemberDTO dto) throws SQLException
		{
			int result = 0;
			String sql = "INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES(?, ?, ?, ?, ?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMemberId());
			pstmt.setString(2, dto.getMemberPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		}
		
		
		// 회원 리스트 출력 담당 메소드
		public ArrayList<MemberDTO> lists() throws SQLException
		{
			ArrayList<MemberDTO> lists = new ArrayList<MemberDTO>();
			
			String sql = "SELECT ID, PW, NAME, TEL, EMAIL FROM TBL_MEMBERLIST ORDER BY NAME";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				MemberDTO dto = new MemberDTO();
				
				dto.setMemberId(rs.getString("ID"));
				dto.setMemberPw(rs.getString("PW"));
				dto.setName(rs.getString("NAME"));
				dto.setTel(rs.getString("TEL"));
				dto.setEmail(rs.getString("EMAIL"));
				
				lists.add(dto);
			}
			pstmt.close();
			rs.close();
			return lists;
		}
		
		// 인원 수 확인 담당 메소드
		public int count() throws SQLException
		{
			int result = 0;
			String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
		    
			while (rs.next())
			{
				result = rs.getInt("COUNT");
			}
			rs.close();
			pstmt.close();
			return result;
		}
		

		// 데이터베이스 연결 종료 담당 메소드
		public void close() throws SQLException
		{
			DBConn.close();
		}
		 
}

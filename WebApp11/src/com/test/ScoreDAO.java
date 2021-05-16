package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{

	private Connection conn;
	
	// DB 연결
   public ScoreDAO() throws ClassNotFoundException, SQLException
   {
      conn = DBConn.getConnection();
   }

	// DB 종료
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	
	// 데이터 입력 
	public int add(ScoreDTO dto) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("INSERT INTO TBL_SCORE (SID, NAME, KOR, ENG, MAT)"
					+ "VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)"
					, dto.getName(), dto.getKor(), dto.getEng(), dto.getMat());
		
		result = stmt.executeUpdate(sql);
		stmt.close();
		return result;
	}
	
	
	// 데이터 전체 수 
	public int count() throws SQLException
	{
		int result = 0;
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
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
	
	// 전체 조회
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT,"
				+ " (KOR+ENG+MAT) AS TOT,"
				+ " TRUNC(((KOR+ENG+MAT)/3),2) AS AVG"
				+ " FROM TBL_SCORE"
				+ " ORDER BY SID";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			
			result.add(dto);
		}
		
		// 리소스 반납
		rs.close();
      	stmt.close();
		return result;
	}
}

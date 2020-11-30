package likey;



import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.SQLException;



public class LikeyDAO {



	private Connection conn;



	public LikeyDAO() {

		try {

			String dbURL = "jdbc:mysql://us-cdbr-east-02.cleardb.com";

			String dbID = "b14849b31c5f24";

			String dbPassword = "b998eadb";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	

	public int like(String userID, String postID, String userIP) {

		String SQL = "INSERT INTO LIKEY VALUES (?, ?, ?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			pstmt.setString(2, postID);

			pstmt.setString(3, userIP);

			return pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return -1; // 추천 중복 오류

	}

	

}
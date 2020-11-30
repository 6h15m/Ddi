package post;



import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.util.ArrayList;



public class PostDAO {



	private Connection conn;

	private ResultSet rs;



	public PostDAO() {

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

	

	public int write(PostDTO postDTO) {

		PreparedStatement pstmt = null;

		try {

			String SQL = "INSERT INTO POST VALUES (NULL, ?, ?, ?, ?, 0);";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, postDTO.getUserID());
			pstmt.setString(2, postDTO.getPostDivide());
			pstmt.setString(3, postDTO.getPostTitle());
			pstmt.setString(4, postDTO.getPostContent());
			
			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if(pstmt != null) pstmt.close();

				if(conn != null) conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return -1;

	}
	
	public ArrayList<PostDTO> getList(String postDivide, String searchType, String search, int pageNumber) {

		if(postDivide.equals("전체")) {

			postDivide = "";

		}

		ArrayList<PostDTO> postList = null;

		PreparedStatement pstmt = null;

		String SQL = "";

		try {

			if(searchType.equals("최신순")) {

				SQL = "SELECT * FROM POST WHERE postDivide LIKE ? AND CONCAT(postTitle, postContent) LIKE ? ORDER BY postID DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;

			} else if(searchType.equals("추천순")) {

				SQL = "SELECT * FROM POST WHERE postDivide LIKE ? AND CONCAT(postTitle, postContent) LIKE ? ORDER BY likeCount DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;

			}

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, "%" + postDivide + "%");
			pstmt.setString(2, "%" + search + "%");

			rs = pstmt.executeQuery();

			postList = new ArrayList<PostDTO>();

			while(rs.next()) {

				PostDTO post = new PostDTO(

					rs.getInt(1),

					rs.getString(2),

					rs.getString(3),

					rs.getString(4),
					
					rs.getString(5),

					rs.getInt(6)

				);

				postList.add(post);

			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if(rs != null) rs.close();

				if(pstmt != null) pstmt.close();

				if(conn != null) conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return postList;

	}
	
	public int like(String postID) {

		PreparedStatement pstmt = null;

		try {

			String SQL = "UPDATE POST SET likeCount = likeCount + 1 WHERE postID = ?";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, Integer.parseInt(postID));

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if(pstmt != null) pstmt.close();

				if(conn != null) conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return -1;

	}

	

	public int delete(String postID) {

		PreparedStatement pstmt = null;

		try {

			String SQL = "DELETE FROM post WHERE postID = ?";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, Integer.parseInt(postID));

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if(pstmt != null) pstmt.close();

				if(conn != null) conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return -1;

	}

	

	public String getUserID(String postID) {

		PreparedStatement pstmt = null;

		try {

			String SQL = "SELECT userID FROM POST WHERE postID = ?";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, Integer.parseInt(postID));

			rs = pstmt.executeQuery();

			while(rs.next()) {

				return rs.getString(1);

			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if(pstmt != null) pstmt.close();

				if(conn != null) conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return null;

	}


}
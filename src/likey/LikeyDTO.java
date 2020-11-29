package likey;



public class LikeyDTO {



	String userID;

	int postID;

	String userIP;

	

	public String getUserID() {

		return userID;

	}

	public void setUserID(String userID) {

		this.userID = userID;

	}

	public int getpostID() {

		return postID;

	}

	public void setpostID(int postID) {

		this.postID = postID;

	}

	public String getUserIP() {

		return userIP;

	}

	public void setUserIP(String userIP) {

		this.userIP = userIP;

	}

	

	public LikeyDTO(String userID, int postID, String userIP) {

		this.userID = userID;

		this.postID = postID;

		this.userIP = userIP;

	}



}
package post;



public class PostDTO {

	int postID;
	String userID;
	String postDivide;
	String postTitle;
	String postContent;
	int likeCount;
	
	public int getPostID() {
		return postID;
	}
	public void setPostID(int postID) {
		this.postID = postID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPostDivide() {
		return postDivide;
	}
	public void setPostDivide(String postDivide) {
		this.postDivide = postDivide;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	public PostDTO(int postID, String userID, String postDivide, String postTitle, String postContent,
			int likeCount) {
		super();
		this.postID = postID;
		this.userID = userID;
		this.postDivide = postDivide;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.likeCount = likeCount;
	}

}
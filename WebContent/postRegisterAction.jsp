<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="post.PostDTO"%>

<%@ page import="post.PostDAO"%>

<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");



	String userID = null;

	if(session.getAttribute("userID") != null) {

		userID = (String) session.getAttribute("userID");

	}

	if(userID == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('로그인을 해주세요.');");

		script.println("location.href = 'userLogin.jsp'");

		script.println("</script>");

		script.close();

		return;

	}

	request.setCharacterEncoding("UTF-8");

	String postDivide = null;

	String postTitle = null;

	String postContent = null;

	if(request.getParameter("postDivide") != null) {

		postDivide = (String) request.getParameter("postDivide");

	}

	if(request.getParameter("postTitle") != null) {

		postTitle = (String) request.getParameter("postTitle");

	}

	if(request.getParameter("postContent") != null) {

		postContent = (String) request.getParameter("postContent");

	}


	if (postDivide == null || postTitle == null || postContent == null || postTitle.equals("") || postContent.equals("")) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('입력이 안 된 사항이 있습니다.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();

		return;

	} else {

		PostDAO postDAO = new PostDAO();

		int result = postDAO.write(new PostDTO(0, userID, postDivide, postTitle, postContent, 0));

		if (result == -1) {

	PrintWriter script = response.getWriter();

	script.println("<script>");

	script.println("alert('글 등록에 실패했습니다.');");

	script.println("history.back();");

	script.println("</script>");

	script.close();

	return;

		} else {

	PrintWriter script = response.getWriter();

	script.println("<script>");

	script.println("location.href = './index.jsp';");

	script.println("</script>");

	script.close();

	return;

		}

	}
%>
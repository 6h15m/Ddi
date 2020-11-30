<%@page import="javax.mail.Transport"%>

<%@page import="javax.mail.Message"%>

<%@page import="javax.mail.Address"%>

<%@page import="javax.mail.internet.InternetAddress"%>

<%@page import="javax.mail.internet.MimeMessage"%>

<%@page import="javax.mail.Session"%>

<%@page import="javax.mail.Authenticator"%>

<%@page import="java.util.Properties"%>

<%@page import="java.io.PrintWriter"%>

<%@page import="user.UserDAO"%>

<%@page import="util.SHA256"%>

<%@page import="util.Gmail"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

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

	String depositName = null;
	String depositMoney = null;
	String depositDay = null;
	String deliverName = null;
	String phoneNumber = null;
	String location = null;
	String zipCode = null;

	if(request.getParameter("depositName") != null) {
		depositName = (String) request.getParameter("depositName");
	}
	if(request.getParameter("depositMoney") != null) {
		depositMoney = (String) request.getParameter("depositMoney");
	}
	if(request.getParameter("depositDay") != null) {
		depositDay = (String) request.getParameter("depositDay");
	}
	if(request.getParameter("deliverName") != null) {
		deliverName = (String) request.getParameter("deliverName");
	}
	if(request.getParameter("phoneNumber") != null) {
		phoneNumber = (String) request.getParameter("phoneNumber");
	}
	if(request.getParameter("location") != null) {
		location = (String) request.getParameter("location");
	}
	if(request.getParameter("zipCode") != null) {
		zipCode = (String) request.getParameter("zipCode");
	}

	if (depositName == null || depositMoney == null || depositDay == null || deliverName == null 
			|| phoneNumber == null || location == null || zipCode == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('입력이 안 된 사항이 있습니다.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();

		return;

	}

	

	// 사용자에게 보낼 메시지를 기입합니다.

	String host = "http://localhost:8010/DIB/";

	String from = "myso0615m";

	String to = "myso0615m@gmail.com";

	String subject = "[띠] 매거진 구독 구매서입니다.";

	String content = "구독자 아이디: " + userID + "<br>입금자 이름: " + depositName
			+ "<br>입금액: " + depositMoney
			+ "<br>입금일: " + depositDay
			+ "<br>수령인: " + deliverName
			+ "<br>전화번호: " + phoneNumber
			+ "<br>주소: " + location
			+ "<br>우편번호: " + zipCode;

	

	// SMTP에 접속하기 위한 정보를 기입합니다.

	Properties p = new Properties();

	p.put("mail.smtp.user", from);

	p.put("mail.smtp.host", "smtp.googlemail.com");

	p.put("mail.smtp.port", "465");

	p.put("mail.smtp.starttls.enable", "true");

	p.put("mail.smtp.auth", "true");

	p.put("mail.smtp.debug", "true");

	p.put("mail.smtp.socketFactory.port", "465");

	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	p.put("mail.smtp.socketFactory.fallback", "false");

	 

	try{

	    Authenticator auth = new Gmail();

	    Session ses = Session.getInstance(p, auth);

	    ses.setDebug(true);

	    MimeMessage msg = new MimeMessage(ses); 

	    msg.setSubject(subject);

	    Address fromAddr = new InternetAddress(from);

	    msg.setFrom(fromAddr);

	    Address toAddr = new InternetAddress(to);

	    msg.addRecipient(Message.RecipientType.TO, toAddr);

	    msg.setContent(content, "text/html;charset=UTF-8");

	    Transport.send(msg);

	} catch(Exception e){

	    e.printStackTrace();

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('오류가 발생했습니다.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();		

	    return;

	}

	PrintWriter script = response.getWriter();

	script.println("<script>");

	script.println("alert('정상적으로 접수되었습니다.');");
	script.println("location.href = 'buyResult.jsp';");

	script.println("</script>");

	script.close();		

    return;

%>
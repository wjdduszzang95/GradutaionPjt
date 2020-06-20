<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" %>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<%
	PreparedStatement pstm = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	String myUrl = "jdbc:mysql://34.64.201.195/user_information";
	Connection conn = DriverManager.getConnection(myUrl,"protein","protein");

	String quary = "select id,pw from user where id = ?";
	pstm = conn.prepareStatement(quary);
	pstm.setString(1,id);

	try{
		ResultSet rs = pstm.executeQuery();
		String password;
		rs.next();
		password = rs.getString("pw");

		if(password.equals(pwd)) {
			out.print("login success!!");
		}
		else{
			out.print("login fail!!");
		}
	}
	catch(Exception e){
		out.print("fail~~~~~~~~~~");	
	}
conn.close();
%>
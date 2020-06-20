<%@ page langudge="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" %>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String number = request.getParameter("number");
%>
<%
	PreparedStatement pstm = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	String myUrl = "jdbc:mysql://34.64.201.195/user_information";
	Connection conn = DriverManager.getConnection(myUrl,"protein","protein");

	String quary = "insert into user(id,pw,number) values(?,?,?)";
	pstm = conn.prepareStatement(quary);
	pstm.setString(1,id);
	pstm.setString(2,pwd);
	pstm.setString(3,number);

	try{
		int n = 	pstm.executeUpdate();
		if ( n == 1){
			out.print("success");
	}
		else{
			out.print("fail");	
}
	pstm.close();
}
	catch(Exception e){
		out.print("fail~~~~~~~~~~");
}
conn.close();
%>
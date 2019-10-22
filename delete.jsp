<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    try{
        String dbURL = "jdbc:mysql://localhost:3306/prueba_exposicion";
        String username = "root";
        String password = "";
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection(dbURL, username, password);
        Statement statement = conn.createStatement();
        String sql = "DELETE FROM alumno WHERE id_alumno = "+id;

        int rowsInserted = statement.executeUpdate(sql);
        if (rowsInserted > 0) {
            System.out.println("A new user was deleted successfully!");
        }
        conn.close();
        response.sendRedirect("index.jsp");
    }
    catch(SQLException e){
        System.out.print(e);
        e.printStackTrace();
    }
%>
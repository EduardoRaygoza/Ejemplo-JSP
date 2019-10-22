<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String fecha = request.getParameter("fecha_nacimiento");
    String carrera = request.getParameter("carrera");

    try{
        String dbURL = "jdbc:mysql://localhost:3306/prueba_exposicion";
        String username = "root";
        String password = "";
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection(dbURL, username, password);
        String sql = "UPDATE alumno SET nombre = ?, apellido=?, fecha_nacimiento=?, carrera=? WHERE id_alumno = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, nombre);
        statement.setString(2, apellido);
        statement.setString(3, fecha);
        statement.setString(4, carrera);
        statement.setInt(5, id);

        int rowsInserted = statement.executeUpdate();
        if (rowsInserted > 0) {
            System.out.println("A new user was inserted successfully!");
        }
        conn.close();
        response.sendRedirect("index.jsp");
    }
    catch(SQLException e){
        System.out.print(e);
        e.printStackTrace();
    }
%>
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
        String sql = "INSERT INTO alumno (id_alumno, nombre, apellido, fecha_nacimiento, carrera) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, id);
        statement.setString(2, nombre);
        statement.setString(3, apellido);
        statement.setString(4, fecha);
        statement.setString(5, carrera);

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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    String dbURL = "jdbc:mysql://localhost:3306/prueba_exposicion";
    String username = "root";
    String password = "";
    Class.forName("com.mysql.jdbc.Driver");
    int id = Integer.parseInt(request.getParameter("id"));
    System.out.println("ID: "+id);
    try{
        Connection conn = DriverManager.getConnection(dbURL, username, password);
        Statement statement = conn.createStatement();
        String sql = "SELECT * FROM alumno WHERE id_alumno = "+id;
        ResultSet resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
            int id_alumno = resultSet.getInt("id_alumno");
            String nombre = resultSet.getString("nombre");
            String apellido = resultSet.getString("apellido");
            String fecha= resultSet.getString("fecha_nacimiento");
%>
            <form action="edited.jsp" method="post">
                ID: <input type="text" name="id" value="<%= id_alumno%>" readonly="true"> <br>
                Nombre: <input type="text" name="nombre" value="<%= nombre%>"> <br>
                Apellido: <input type="text" name="apellido" value="<%=apellido%>"> <br>
                Fecha de nacimiento: <input type="date" name="fecha_nacimiento" value="<%=fecha%>"> <br>
                Carrera: <select name="carrera" id="">
                <option value="ISC">Sistemas</option>
                   <option value="IEX">Electromecanica</option>
                   <option value="IEG">Gestion</option>
                </select> <br>
                <button type="submit">Enviar</button>
            </form>            
<%
        }
        conn.close();
    } catch (SQLException ex){
        System.out.println(ex.getMessage());
    }
%>
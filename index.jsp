<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>Ejemplo JSP</title>
</head>

<body>

   <%
   String dbURL = "jdbc:mysql://localhost:3306/prueba_exposicion";
   String username = "root";
   String password = "";
   Class.forName("com.mysql.jdbc.Driver");
   %>

   <table border=1>
      <tr>
         <th>ID alumno</th>
         <th>Nombre</th>
         <th>Apellido</th>
         <th>Fecha de nacimiento</th>
         <th>Carrera</th>

      </tr>
      <%
      try{
         Connection conn = DriverManager.getConnection(dbURL, username, password);
         Statement statement = conn.createStatement();
         String sql = "SELECT * FROM alumno";
         ResultSet resultSet = statement.executeQuery(sql);
         while(resultSet.next()){
            int id = resultSet.getInt("id_alumno");
      %>
            <tr>
               <td><%= id%></td>
               <td><%= resultSet.getString("nombre")%></td>
               <td><%= resultSet.getString("apellido")%></td>
               <td><%= resultSet.getDate("fecha_nacimiento")%></td>
               <td><%= resultSet.getString("carrera")%></td>
               <td><a href="edit.jsp?id=<%= id%>"><img src="edit.png" alt="" width="20px" height="20px"></a></td>
               <td><a href="delete.jsp?id=<%= id%>"><img src="delete.png" alt="" width="20px" height="20px"></a></td>
            </tr>
      <%
         }
         conn.close();
      } catch (SQLException ex){
         System.out.println(ex.getMessage());
      }
      %>
   </table> <br>
   <br>
   <br>
   <h2>Insertar registros</h2>
   <form action="posted.jsp" method="post">
      ID: <input type="text" name="id" id=""> <br>
      Nombre: <input type="text" name="nombre" id=""> <br>
      Apellido: <input type="text" name="apellido" id=""> <br>
      Fecha de nacimiento: <input type="date" name="fecha_nacimiento" id=""> <br>
      Carrera: <select name="carrera" id="">
         <option value="ISC">Sistemas</option>
         <option value="IEX">Electromecanica</option>
         <option value="IEG">Gestion</option>
      </select> <br>
      <button type="submit">Enviar</button>
   </form>
</body>

</html>
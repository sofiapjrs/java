<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
%@page contentType="text/html" pageEncoding="utf-8"%>
<! DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Listagem de produtos</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
         
<body>
<%
   try {
         Connection conecta;
         PreparedStatement st;
         Class.forName("com.mysql.cj.jdbc.Driver");
         conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "2311");

         st = conecta.prepareStatement("SELECT * FROM produto");

         ResultSet rs = st.execute Query();
         
        %>
        
        <table border="1">
            <tr>
                <th>Código</th><th>Nome</th><th>Marca</th><th>Preço</th>
            </tr>
            
        <%
            while (rs.next()) {
        %>
        
        <tr>
            <td><%= rs.getString("codigo")%></td>
            <td><%= rs.getString("nome")%></td>
            <td><%= rs.getString("marca")%></td>
            <td><%= rs.getString("preco")%></td>
        </tr>
        
        <%
         }
     
        %>
        </table>
        <%
        } catch(Exception x) {
          out.print("Mensagem de erro:" + x.getMessage());
        }
 
        %>
</body>
</html>
            
        
        
        






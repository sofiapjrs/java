<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>   
    </head>
    <body>
        <%
            int c;
            String n, m;
            double p;
            c = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            m = request.getParameter("marca");
            p = Double.parseDouble(request.getParameter("preco"));
            try{
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta=DriverManager.getConnection("jdbc:mysql://localhost:3306/produtos", "root", "27072012s");
                
                st = conecta.prepareStatement("INSERT INTO cadastro_de_produtos VALUES(?,?,?,?)");
                st.setInt(1,c);
                st.setString(2, n);
                st.setString(3, m);
                st.setDouble(4, p);
                st.executeUpdate();
                out.print("Produto cadastrado com sucesso");
            } catch (Exception x){
               out.print("Mensagem de erro:" + x.getMessage());
               String erro = x.getMessage();
               
               if(erro.contains("Duplicate entry")) {
               out.print("<p style='color#5cceee;font-size:20px'>Este código de produto já existe!</p>");
               }
               
               else{
               out.print("<p style='color#5cceee;font-size:20px'>Mensagem de erro:" + erro + "</p>");
               } 
            }
        %>
    </body>  
</html>

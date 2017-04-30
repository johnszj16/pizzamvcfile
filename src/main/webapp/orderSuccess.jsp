<%-- 
    Document   : order
    Created on : Feb 7, 2017, 3:13:05 PM
    Author     : John Phillips
--%>

<%@page import="pizzamvc.PizzaOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Zach's Online Pizza Store</title>
        <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>
        <h1><a href="home.html">Zach's Online Pizza Store</a></h1>
        <h2>Order Success! Thank you for your order!</h2>
        <h3>Order details:</h3>
        <p>Email = ${myOrder.email}</p>
        <p>Size = ${myOrder.size}</p>
        <p>Toppings: ${myOrder.toppings}</p>
        <p>
            <%
            String[] toppingArray = request.getParameterValues("toppings");
            double price = 0.0;
            if (toppingArray != null && toppingArray.length > 0) {
                if (toppingArray.length == 1) {
                    price += 0.75;
                } else if (toppingArray.length > 1) {
                    for (int i = 0; i < toppingArray.length; i++) {
                        price += 0.75;
                    }
                }
            }
            if (request.getParameter("size").equals("small")) {
                price += 5.00;
            } else if (request.getParameter("size").equals("medium")) {
                price += 6.00;
            } else if (request.getParameter("size").equals("large")) {
                price += 7.00;
            }
            if (request.getParameter("style").equals("pan")) {
                price += 1.00;
            } else if (request.getParameter("style").equals("hand-tossed")) {
                price += 0.50;
            }
            out.println("<p>Order Price = $" + price + "</p>");
        %> 
        </p>
        <p><a href='home.html'>Return to home page</a></p>
    </body>
</html>

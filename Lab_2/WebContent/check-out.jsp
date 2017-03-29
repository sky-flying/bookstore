<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>check out</title>
</head>
<body>
<%@page import="bookstore.*" %>
<%@page import="java.util.ArrayList" %>
<% ShoppingCart shoppingCarts=(ShoppingCart)session.getAttribute("bookstore.cart");
    double total=shoppingCarts.getTotalPrice();
    %>
    Your total purchase is: <%=total %> <p></p>
	To purchase the item in your shopping cart, please provide us the following information:
	
	<script type="text/javascript" language="JavaScript">
function isBlank(s) {
     var i;
     for(i=0;i<s.length;i++){
        if (s.charAt(i)!=" ")
          return false
          }
          return true
}
function validate(filevalue1,filevalue2) {
       if(isBlank(filevalue1)||isBlank(filevalue2))
       {       alert("No input! please write again");
       return false
       }
        return true
 
}
</script>
	
    <form name="checkout" method="post" action="ReceiptServlet" onsubmit="return validate(customerName.value, cardNumber.value)">
	<b>Name: </b> <input type="text" name="customerName" size=20 value="Chen Jinsong"><br>
	<b>Credit Card Number</b><input type="text" name="cardNumber" size=16 value="15111795d"> <br>
	<input type="submit" value="Submit Information"> &nbsp; &nbsp; 
	<input type="button" value="Cancel" onClick="JavaScript:window.location='show-order.jsp';">
	</form>	
</body>
</html>
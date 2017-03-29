<%@page import="java.io.PrintWriter"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="bookstore.*" %>
<% ShoppingCart shoppingCarts=(ShoppingCart)session.getAttribute("bookstore.cart");
   int numBooks =shoppingCarts.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Info</title>
</head>
<body>
Student Name:chen jinsong<br>
Student ID:15111795d<br>
<center id="showtimes">

<script type="text/javascript"> function showtime() {
        document.getElementById("showtimes").innerHTML="The time now is :"+new Date();
	
} setInterval("showtime()",100)
</script> </center><br>
<center>You have <%=numBooks %> item(s) in your shopping cart </center><br>
<% if (numBooks > 0) { %>
<table border="1" align="center" cellpadding="10">
<tr><th> </th><th>Title</th><th>price</th></tr>
<%for (int i=0;i<numBooks;i++){ 
    Book book=shoppingCarts.get(i);
   
   %>
<tr><th><%=i+1 %> </th><th><%=book.getTitle() %></th><th><%=book.getPrice()%></th>
</tr>
<%} %>
<tr><th></th><th>Total:</th><th><%=shoppingCarts.getTotalPrice() %>
</table>
<%} %>
<center> <input type="button" value="back" onclick="JavaScript:window.location='BookInfo.jsp';" >&nbsp;&nbsp;
<input type="button" value="Check Out" onclick="JavaScript:window.location='check-out.jsp';" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="Remove All" onclick="JavaScript:window.location='remove-all.jsp';">
</center>

</body>
</html>
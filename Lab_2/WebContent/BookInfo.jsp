<%@page import="java.io.PrintWriter"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="bookstore.*" %>
<% ArrayList<Book> books=(ArrayList<Book>)session.getAttribute("foundBooks");
   int numBooks =books.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Info</title>
</head>
<body>
Student Name: chen jinsong<br>
Student ID:15111795d<br>
<center id="showtimes">

<script type="text/javascript"> function showtime() {
        document.getElementById("showtimes").innerHTML="The time now is :"+new Date();
	
} setInterval("showtime()",100)
</script> </center>

<table border="1" align="center" cellpadding="10">
<tr><th>ISBN</th><th>Title</th><th>Author</th><th>Edition Number</th><th>Publisher</th><th>Copyright</th></tr>
<%for (int i=0;i<numBooks;i++){ 
       Book book=books.get(i);
   %>
<tr><th><%=book.getIsbn() %> </th><th><%=book.getTitle() %></th><th><%=book.getAuthor()%></th><th><%=book.getEdition()%></th><th><%=book.getPublisher() %></th><th><%=book.getCopyright()%></th>
<th> <a href="<%=request.getContextPath()%>/OrderSerlvet?selectedBook=<%=i%>"> Add to Cart</a></th>
</tr>
<%} %>
</table>
<center><a href="SearchBook.html">Home </a> </center>

</body>
</html>
<%@ page import="java.sql.*, beans.MovieBean" %>
<html>
<head>
<title>Daniel Graham - Update Movie</title>
</head>
<body>

<h2>Daniel Graham - Movie Database</h2>
<p>Select a movie ID to update.</p>

<form action="update.jsp" method="post">

<select name="movie_id" required>
<option value="">-- Select Movie ID --</option>

<%
MovieBean bean = new MovieBean();
ResultSet rs = bean.getAllMovieIDs();
while(rs.next()){
%>
<option value="<%= rs.getInt("movie_id") %>">
<%= rs.getInt("movie_id") %>
</option>
<%
}
%>

</select>

<br><br>
<input type="submit" value="Load Movie">

</form>

</body>
</html>

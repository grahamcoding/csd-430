<%@ page import="java.sql.*, beans.MovieBean" %>
<html>
<head>
<title>Daniel Graham - Delete Movies</title>
</head>
<body>

<h2>Daniel Graham - Movie Database (Delete)</h2>
<p>Select a movie ID to delete.</p>

<%
MovieBean bean = new MovieBean();

String deleteId = request.getParameter("movie_id");
if(deleteId != null){
    bean.deleteMovie(Integer.parseInt(deleteId));
}
%>

<form method="post">

<select name="movie_id" required>
<option value="">-- Select Movie ID --</option>

<%
ResultSet ids = bean.getAllMovieIDs();
while(ids.next()){
%>
<option value="<%= ids.getInt("movie_id") %>">
<%= ids.getInt("movie_id") %>
</option>
<%
}
%>

</select>

<input type="submit" value="Delete Movie">
</form>

<br>

<h3>All Movies</h3>

<table border="1">
<thead>
<tr>
<th>ID</th>
<th>Title</th>
<th>Genre</th>
<th>Director</th>
<th>Year</th>
<th>Rating</th>
</tr>
</thead>
<tbody>

<%
ResultSet rs = bean.getAllMovies();
while(rs.next()){
%>
<tr>
<td><%= rs.getInt("movie_id") %></td>
<td><%= rs.getString("title") %></td>
<td><%= rs.getString("genre") %></td>
<td><%= rs.getString("director") %></td>
<td><%= rs.getInt("release_year") %></td>
<td><%= rs.getDouble("rating") %></td>
</tr>
<%
}
%>

</tbody>
</table>

</body>
</html>

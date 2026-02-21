<%@ page import="beans.MovieBean" %>
<html>
<head>
<title>Updated Movie</title>
</head>
<body>

<%
MovieBean movie = new MovieBean();

movie.setMovie_id(Integer.parseInt(request.getParameter("movie_id")));
movie.setTitle(request.getParameter("title"));
movie.setGenre(request.getParameter("genre"));
movie.setDirector(request.getParameter("director"));
movie.setRelease_year(Integer.parseInt(request.getParameter("release_year")));
movie.setRating(Double.parseDouble(request.getParameter("rating")));

movie.updateMovie();
%>

<h2>Updated Movie Record</h2>

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
<tr>
<td><%= movie.getMovie_id() %></td>
<td><%= movie.getTitle() %></td>
<td><%= movie.getGenre() %></td>
<td><%= movie.getDirector() %></td>
<td><%= movie.getRelease_year() %></td>
<td><%= movie.getRating() %></td>
</tr>
</tbody>
</table>

<br>
<a href="index.jsp">Update another movie</a>

</body>
</html>

<%@ page import="beans.MovieBean" %>
<html>
<head>
<title>Edit Movie</title>
</head>
<body>

<%
int id = Integer.parseInt(request.getParameter("movie_id"));

MovieBean movie = new MovieBean();
movie.loadMovieById(id);
%>

<h2>Edit Movie</h2>

<form action="result.jsp" method="post">

Movie ID: <b><%= movie.getMovie_id() %></b>
<input type="hidden" name="movie_id" value="<%= movie.getMovie_id() %>">

<br><br>

Title:
<input type="text" name="title" value="<%= movie.getTitle() %>"><br><br>

Genre:
<input type="text" name="genre" value="<%= movie.getGenre() %>"><br><br>

Director:
<input type="text" name="director" value="<%= movie.getDirector() %>"><br><br>

Release Year:
<input type="number" name="release_year" value="<%= movie.getRelease_year() %>"><br><br>

Rating:
<input type="text" name="rating" value="<%= movie.getRating() %>"><br><br>

<input type="submit" value="Update Movie">

</form>

</body>
</html>

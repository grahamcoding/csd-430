<%@ page import="java.sql.*, beans.MovieBean" %>
<html>
<head>
<title>Movie Database - Add Movie</title>
</head>
<body>

<h2>Daniel's Movie Database</h2>
<p>Use this form to add a new movie to the database.</p>

<!-- MOVIE INPUT FORM -->
<form method="post">
Title: <input type="text" name="title" required><br><br>
Genre: <input type="text" name="genre" required><br><br>
Director: <input type="text" name="director" required><br><br>
Release Year: <input type="number" name="release_year" required><br><br>
Rating: <input type="text" name="rating" required><br><br>

<input type="submit" value="Add Movie">
</form>

<hr>

<%
String title = request.getParameter("title");

if(title != null){
    MovieBean movie = new MovieBean();

    movie.setTitle(title);
    movie.setGenre(request.getParameter("genre"));
    movie.setDirector(request.getParameter("director"));
    movie.setRelease_year(Integer.parseInt(request.getParameter("release_year")));
    movie.setRating(Double.parseDouble(request.getParameter("rating")));

    movie.insertMovie();
}
%>

<h3>All Movies in Database</h3>

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
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM daniel_movies_data");

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
conn.close();
%>

</tbody>
</table>

</body>
</html>

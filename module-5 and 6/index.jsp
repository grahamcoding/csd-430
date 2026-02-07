<%@ page import="java.sql.*, beans.MovieBean" %>
<html>
<head>
<title>Movie Database</title>
</head>
<body>

<h2>Daniel's Movie Database</h2>
<p>Select a movie ID to view details.</p>

<form method="post">
<select name="movie_id">
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT movie_id FROM daniel_movies_data");

    while(rs.next()){
%>
    <option value="<%= rs.getInt("movie_id") %>">
        <%= rs.getInt("movie_id") %>
    </option>
<%
    }
    conn.close();
%>
</select>
<input type="submit" value="View Movie">
</form>

<%
String id = request.getParameter("movie_id");

if(id != null){
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn2 = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

    PreparedStatement ps = conn2.prepareStatement(
        "SELECT * FROM daniel_movies_data WHERE movie_id=?");
    ps.setInt(1, Integer.parseInt(id));

    ResultSet rs2 = ps.executeQuery();

    if(rs2.next()){
%>

<h3>Movie Details</h3>
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
<td><%= rs2.getInt("movie_id") %></td>
<td><%= rs2.getString("title") %></td>
<td><%= rs2.getString("genre") %></td>
<td><%= rs2.getString("director") %></td>
<td><%= rs2.getInt("release_year") %></td>
<td><%= rs2.getDouble("rating") %></td>
</tr>
</tbody>
</table>

<%
    }
    conn2.close();
}
%>

</body>
</html>

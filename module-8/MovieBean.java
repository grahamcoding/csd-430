package beans;

import java.sql.*;

public class MovieBean {

    private int movie_id;
    private String title;
    private String genre;
    private String director;
    private int release_year;
    private double rating;

    public int getMovie_id() { return movie_id; }
    public void setMovie_id(int movie_id) { this.movie_id = movie_id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }

    public int getRelease_year() { return release_year; }
    public void setRelease_year(int release_year) { this.release_year = release_year; }

    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    // get all IDs for dropdown
    public ResultSet getAllMovieIDs() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

        Statement stmt = conn.createStatement();
        return stmt.executeQuery("SELECT movie_id FROM daniel_movies_data");
    }

    // load one movie
    public void loadMovieById(int id) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

        String sql = "SELECT * FROM daniel_movies_data WHERE movie_id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            movie_id = rs.getInt("movie_id");
            title = rs.getString("title");
            genre = rs.getString("genre");
            director = rs.getString("director");
            release_year = rs.getInt("release_year");
            rating = rs.getDouble("rating");
        }

        conn.close();
    }

    // update record
    public void updateMovie() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

        String sql = "UPDATE daniel_movies_data SET title=?, genre=?, director=?, release_year=?, rating=? WHERE movie_id=?";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, title);
        ps.setString(2, genre);
        ps.setString(3, director);
        ps.setInt(4, release_year);
        ps.setDouble(5, rating);
        ps.setInt(6, movie_id);

        ps.executeUpdate();
        conn.close();
    }
}

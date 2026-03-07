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

    public ResultSet getAllMovies() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

        Statement stmt = conn.createStatement();
        return stmt.executeQuery("SELECT * FROM daniel_movies_data");
    }

    public ResultSet getAllMovieIDs() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

        Statement stmt = conn.createStatement();
        return stmt.executeQuery("SELECT movie_id FROM daniel_movies_data");
    }

    public void deleteMovie(int id) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

        String sql = "DELETE FROM daniel_movies_data WHERE movie_id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        conn.close();
    }
}

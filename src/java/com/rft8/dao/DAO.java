/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rft8.dao;

import com.rft8.model.Album;
import com.rft8.model.Artist;
import com.rft8.model.Favorite;
import com.rft8.model.Genre;
import com.rft8.model.Track;
import com.rft8.model.User;
import com.rft8.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class DAO {

    public ArrayList<Artist> getAllArtists() {
        Connection conn = DBConnection.getConnection();
        ArrayList<Artist> list = new ArrayList<>();
        try {
            ResultSet rs = conn.prepareStatement("Select * from Artists").executeQuery();
            while (rs.next()) {
                Artist artist = new Artist(rs.getString("id"), rs.getString("picture"), rs.getString("name"),
                        rs.getString("description"), rs.getString("years_active"));
                list.add(artist);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addArtist(Artist artist) {
        Connection conn = DBConnection.getConnection();
        String sql = "insert into Artists(id, picture, name, description, years_active) values(?,?,?,?,?)";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, artist.getId());
            stm.setString(2, artist.getPic());
            stm.setString(3, artist.getName());
            stm.setString(4, artist.getDes());
            stm.setString(5, artist.getYearsActive());
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addGenres(Genre genre) {
        Connection conn = DBConnection.getConnection();
        String sql = "insert into genres(id, name, description) values(?,?,?)";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, genre.getId());
            stm.setString(2, genre.getName());
            stm.setString(3, genre.getDes());
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Genre> getAllGenres() {
        Connection conn = DBConnection.getConnection();
        ArrayList<Genre> list = new ArrayList<>();
        try {
            ResultSet rs = conn.prepareStatement("Select * from Genres").executeQuery();
            while (rs.next()) {
                Genre genre = new Genre(rs.getString("id"), rs.getString("name"), rs.getString("description"));
                list.add(genre);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getArtistNameById(String id) {
        for (Artist artist : getAllArtists()) {
            if (artist.getId().equals(id)) {
                return artist.getName();
            }
        }
        return null;
    }

    public String getAlbumNameById(String id) {
        for (Album album : getAllAlbums()) {
            if (album.getId().equals(id)) {
                return album.getName();
            }
        }
        return null;
    }

    public String getAlbumReleaseById(String id) {
        for (Album album : getAllAlbums()) {
            if (album.getId().equals(id)) {
                return album.getReleaseDate();
            }
        }
        return null;
    }

    public String getAlbumGenreIdById(String id) {
        for (Album album : getAllAlbums()) {
            if (album.getId().equals(id)) {
                return album.getGenreId();
            }
        }
        return null;
    }

    public String getAlbumArtistIdIdById(String id) {
        for (Album album : getAllAlbums()) {
            if (album.getId().equals(id)) {
                return album.getArtist();
            }
        }
        return null;
    }

    public ArrayList<Album> getAllAlbumIdByArtistId(String id) {
        ArrayList<Album> list = new ArrayList<>();
        for (Album album : getAllAlbums()) {
            if (album.getArtist().equals(id)) {
                list.add(album);
            }
        }
        return list;
    }

    public String getGenreNameById(String id) {
        for (Genre genre : getAllGenres()) {
            if (genre.getId().equals(id)) {
                return genre.getName();
            }
        }
        return null;
    }

    public String getGenreDesById(String id) {
        for (Genre genre : getAllGenres()) {
            if (genre.getId().equals(id)) {
                return genre.getDes();
            }
        }
        return null;
    }

    public String getArtistPicById(String id) {
        for (Artist artist : getAllArtists()) {
            if (artist.getId().equals(id)) {
                return artist.getPic();
            }
        }
        return null;
    }

    public String getTrackNameById(int id) {
        for (Track track : getAllTracks()) {
            if (track.getId() == id) {
                return track.getName();
            }
        }
        return null;
    }

    public String getAlbumPicById(String id) {
        for (Album album : getAllAlbums()) {
            if (album.getId().equals(id)) {
                return album.getPic();
            }
        }
        return null;
    }

    public ArrayList<Track> getTracksByArtistId(String id) {
        ArrayList<Track> list = new ArrayList<>();
        for (Track track : getAllTracks()) {
            if (track.getArtistId().equals(id)) {
                list.add(track);
            }
        }
        return list;
    }

    public Track getTrackByTrackId(int id) {
        Connection conn = DBConnection.getConnection();
        String sql = "select * from tracks where id=?";
        Track track = null;
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                track = new Track(rs.getInt(1), rs.getString("album_id"), rs.getString("name"), rs.getString("name_file"), rs.getString("artists_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return track;

    }

    public ArrayList<Track> getTracksByAlbumId(String id) {
        Connection conn = DBConnection.getConnection();
        ArrayList<Track> list = new ArrayList<>();
        String sql = "select * from tracks where album_id=?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Track(rs.getString("album_id"), rs.getString("name"), rs.getString("name_file"), rs.getString("artists_id")));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Album getAlbumByAlbumId(String albumId) {
        for (Album album : getAllAlbums()) {
            if (album.getId().equals(albumId)) {
                return album;
            }
        }
        return null;
    }

    public String getArtistDesById(String id) {
        for (Artist artist : getAllArtists()) {
            if (artist.getId().equals(id)) {
                return artist.getDes();
            }
        }
        return null;
    }

    public String getArtistYearById(String id) {
        for (Artist artist : getAllArtists()) {
            if (artist.getId().equals(id)) {
                return artist.getYearsActive();
            }
        }
        return null;
    }

    public ArrayList<Album> getAllAlbums() {
        Connection conn = DBConnection.getConnection();
        ArrayList<Album> list = new ArrayList<>();
        try {
            ResultSet rs = conn.prepareStatement("Select * from Albums").executeQuery();
            while (rs.next()) {
                Album album = new Album(rs.getString("id"), rs.getString("artists"), rs.getString("name"),
                        rs.getString("release_date"), rs.getString("genre_id"), rs.getString("picture"));
                list.add(album);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addAlbum(Album album) {
        Connection conn = DBConnection.getConnection();
        String sql = "insert into albums(id, artists, name, release_date, genre_id, picture) values(?,?,?,?,?,?)";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, album.getId());
            stm.setString(2, album.getArtist());
            stm.setString(3, album.getName());
            stm.setString(4, album.getReleaseDate());
            stm.setString(5, album.getGenreId());
            stm.setString(6, album.getPic());
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addTrack(Track track) {
        Connection conn = DBConnection.getConnection();
        String sql = "insert into Tracks(album_id, name, name_file, artists_id) values(?,?,?,?)";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, track.getAlbumId());
            stm.setString(2, track.getName());
            stm.setString(3, track.getNameFile());
            stm.setString(4, track.getArtistId());
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addFavoriteTrack(Favorite favorite) {
        Connection conn = DBConnection.getConnection();
        String sql = "insert into favorites(user_id, track_id) values(?,?)";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, favorite.getUserId());
            stm.setInt(2, favorite.getTrackId());
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addFavoriteAlbum(Favorite favorite) {
        Connection conn = DBConnection.getConnection();
        String sql = "insert into favorites(user_id, album_id) values(?,?)";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, favorite.getUserId());
            stm.setString(2, favorite.getAlbumId());
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Track> getAllTracks() {
        Connection conn = DBConnection.getConnection();
        ArrayList<Track> list = new ArrayList<>();
        try {
            ResultSet rs = conn.prepareStatement("Select * from tracks").executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                String albumId = rs.getString("album_id");
                String name = rs.getString("name");
                String nameFile = rs.getString("name_file");
                String artists_id = rs.getString("artists_id");
                Track track = new Track(id, albumId, name, nameFile, artists_id);
                list.add(track);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Track> searchTrackByName(String search) {
        Connection conn = DBConnection.getConnection();
        ArrayList<Track> list = new ArrayList<>();
        String sql = "select * from tracks where [name] like '%"+search+"%'";
        try {

            PreparedStatement stm = conn.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                String albumId = rs.getString("album_id");
                String name = rs.getString("name");
                String nameFile = rs.getString("name_file");
                String artists_id = rs.getString("artists_id");
                Track track = new Track(id, albumId, name, nameFile, artists_id);
                list.add(track);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Album> getFavoriteAlbumByUserId(int userId) {
        Connection conn = DBConnection.getConnection();
        ArrayList<Album> list = new ArrayList<>();
        String sql = "select id,artists,name,release_date,genre_id,picture "
                + "from favorites "
                + "inner join albums\n"
                + "on favorites.album_id = albums.id "
                + "where user_id=?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Album(rs.getString("id"), rs.getString("artists"), rs.getString("name"), rs.getString("release_date"),
                        rs.getString("genre_id"), rs.getString("picture")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Track> getFavoriteTrackByUserId(int userId) {
        Connection conn = DBConnection.getConnection();
        ArrayList<Track> list = new ArrayList<>();
        String sql = "SELECT id,name,name_file,artists_id\n"
                + "FROM favorites\n"
                + "INNER JOIN tracks\n"
                + "ON favorites.track_id = tracks.id "
                + "where user_id=?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = Integer.valueOf(rs.getString("id"));
                list.add(new Track(id, rs.getString("name"), rs.getString("name_file"),
                        rs.getString("artists_id")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Integer> getFavoriteTrackIdByUserId(int userId) {
        ArrayList<Integer> list = new ArrayList<>();
        for (Track track : getFavoriteTrackByUserId(userId)) {
            list.add(track.getId());
        }
        return list;
    }

    public boolean checkFavoriteTrackIdExist(int userId, int trackId) {
        Integer trackid = new Integer(trackId);
        for (Integer id : getFavoriteTrackIdByUserId(userId)) {
            if (id.equals(trackid)) {
                return true;
            }
        }
        return false;
    }

    public ArrayList<String> getFavoriteAlbumIdByUserId(int userId) {
        ArrayList<String> list = new ArrayList<>();
        for (Album album : getFavoriteAlbumByUserId(userId)) {
            list.add(album.getId());
        }
        return list;
    }

    public boolean checkFavoriteAlbumIdExist(int userId, String albumId) {
        String trackid = new String(albumId);
        for (String id : getFavoriteAlbumIdByUserId(userId)) {
            if (id.equals(trackid)) {
                return true;
            }
        }
        return false;
    }

    public ArrayList<Track> getTopTracks() {
        Connection conn = DBConnection.getConnection();
        ArrayList<Track> list = new ArrayList<>();
        try {
            ResultSet rs = conn.prepareStatement("select top 5 * from tracks order by id desc").executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                Track track = new Track(id, rs.getString("album_id"), rs.getString("name"), rs.getString("name_file"),
                        rs.getString("artists_id"));
                list.add(track);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Album> getTopAlbums() {
        Connection conn = DBConnection.getConnection();
        ArrayList<Album> list = new ArrayList<>();
        try {
            ResultSet rs = conn.prepareStatement("select top 5 * from albums order by id desc").executeQuery();
            while (rs.next()) {
                Album album = new Album(rs.getString("id"), rs.getString("artists"), rs.getString("name"),
                        rs.getString("release_date"), rs.getString("genre_id"), rs.getString("picture"));
                list.add(album);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public User login(String email, String pass) {
        Connection conn = DBConnection.getConnection();
        boolean isAdmin = false;
        String sql = "select * from [user] where email=? and password=?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int intBoolean = Integer.parseInt(rs.getString("isAdmin"));
                if (intBoolean == 1) {
                    isAdmin = true;
                } else {
                    isAdmin = false;
                }
                return new User(rs.getInt(1), rs.getString("email"), rs.getString("username"), rs.getString("password"), isAdmin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public User checkUserExist(String email) {
        Connection conn = DBConnection.getConnection();
        String sql = "select * from [user] where email= ?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new User(rs.getString("email"), rs.getString("username"), rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkIdArtistExist(String id) {
        for (Artist artist : getAllArtists()) {
            if (artist.getId().equalsIgnoreCase(id)) {
                return true;
            }
        }
        return false;
    }

    public boolean checkIdGenreExist(String id) {
        for (Genre genre : getAllGenres()) {
            if (genre.getId().equalsIgnoreCase(id)) {
                return true;
            }
        }
        return false;
    }

    public boolean checkIdAlbumExist(String id) {
        for (Album album : getAllAlbums()) {
            if (album.getId().equalsIgnoreCase(id)) {
                return true;
            }
        }
        return false;
    }

    public void register(String email, String username, String pass) {
        Connection conn = DBConnection.getConnection();
        String sql = "insert into [user](email,username,password,isAdmin)values(?,?,?,'0')";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, username);
            stm.setString(3, pass);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void editArtist(Artist artist) {
        Connection conn = DBConnection.getConnection();
        String sql = "UPDATE [rft8db].[dbo].[artists] \n"
                + "SET picture=?, name=?, description = ?,years_active=? \n"
                + "WHERE id = ?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, artist.getPic());
            stm.setString(2, artist.getName());
            stm.setString(3, artist.getDes());
            stm.setString(4, artist.getYearsActive());
            stm.setString(5, artist.getId());
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editGenre(Genre genre) {
        Connection conn = DBConnection.getConnection();
        String sql = "UPDATE [rft8db].[dbo].[genres] \n"
                + "SET  name=?, description = ? \n"
                + "WHERE id = ?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, genre.getName());
            stm.setString(2, genre.getDes());
            stm.setString(3, genre.getId());
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editAlbum(Album album) {
        Connection conn = DBConnection.getConnection();
        String sql = "UPDATE [rft8db].[dbo].[albums] \n"
                + "SET  artists=?, name = ?,release_date=?,genre_id=?,picture=?\n"
                + "WHERE id = ?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, album.getArtist());
            stm.setString(2, album.getName());
            stm.setString(3, album.getReleaseDate());
            stm.setString(4, album.getGenreId());
            stm.setString(5, album.getPic());
            stm.setString(6, album.getId());
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editTrack(Track track) {

        Connection conn = DBConnection.getConnection();
        String sql = "UPDATE [rft8db].[dbo].[tracks] \n"
                + "SET  album_id=?, name = ?,name_file=?,artists_id=? \n"
                + "WHERE id = ?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, track.getAlbumId());
            stm.setString(2, track.getName());
            stm.setString(3, track.getNameFile());
            stm.setString(4, track.getArtistId());
            stm.setInt(5, track.getId());
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteFavoriteTrackId(int userId, int trackId) {
        Connection conn = DBConnection.getConnection();
        String sql = "DELETE FROM favorites WHERE track_id=? and user_id= ?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(2, userId);
            stm.setInt(1, trackId);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteFavoriteAlbumId(int userId, String albumId) {
        Connection conn = DBConnection.getConnection();
        String sql = "DELETE FROM favorites WHERE album_id=? and user_id= ?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(2, userId);
            stm.setString(1, albumId);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteArtist(String artistId) {

        Connection conn = DBConnection.getConnection();
        String sql = "DELETE FROM tracks where artists_id=?\n"
                + "DELETE FROM artists WHERE id=?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, artistId);
            stm.setString(2, artistId);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteGenre(String genreId) {
        Connection conn = DBConnection.getConnection();
        String sql = "DELETE FROM genres WHERE id=?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, genreId);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteAlbum(String albumId) {
        Connection conn = DBConnection.getConnection();
        String sql = "DELETE from tracks where album_id=?\n"
                + "DELETE FROM albums WHERE id=?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, albumId);
            stm.setString(2, albumId);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteTrack(int trackId) {
        Connection conn = DBConnection.getConnection();
        String sql = "DELETE FROM tracks WHERE id=?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, trackId);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
//        for (Track track : dao.getTracksByAlbumId("A01")) {
//            System.out.println(track.getName());
//        }
//        User a = dao.login("vnxa01@gmail.com", "1");
//        System.out.println(a.getUsername());
//        dao.register("tetst@gmail.com","tuitest","1");
//        System.out.println();
//            System.out.println(dao.getTracksByArtistId("R02"));
//        dao.addGenres(new Genre("1", "love", "rap about love"));
//        dao.addTrack(new Track("tay to", "to.mp3", "R02"));
//        dao.addAlbum(new Album("1","R01","xa","2021","1","hehe.jpg"));

//        ArrayList<Integer> list = dao.getFavoriteTrackIdByUserId(8);
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println(list.get(i));
//        }
//        for (Track track : dao.getAllTracks()) {
//            System.out.println(track.getId());
//        }
//        if (dao.checkFavoriteTrackIdExist(8, 15)) {
//            System.out.println("ok");
//        } else {
//            System.out.println("no");
//        }
//        for (Track track : dao.getFavoriteTrackByUserId(8)) {
//            System.out.println(track.getId());
//
//        }
//        dao.addFavoriteAlbum(new Favorite(8, "A01"));
//        for (Album album : dao.getFavoriteAlbumByUserId(8)) {
//            System.out.println(album.getName());
//        }
//        if (dao.checkFavoriteAlbumIdExist(8, "A01")) {
//            System.out.println("ok");
//        } else {
//            System.out.println("no");
//        }
//        Album album = dao.getAlbumByAlbumId("A01");
//        System.out.println(album.getName());
//        for(Album album: dao.getAllAlbumIdByArtistId("R02")){
//            System.out.println(album.getName());
//        }
//        User user = dao.login("vnxa01@gmail.com", "1");
//        if (user == null) {
//            System.out.println("fail");
//        } else {
//            if (user.isAdmin()) {
//                System.out.println("ok");
//            } else {
//                System.out.println("fail");
//            }
//
//        }
//        if (dao.checkIdAlbumExist("g01")) {
//            System.out.println("exist");
//        } else {
//            System.out.println("no");
//        }
//        dao.editArtist(new Artist("test", "nger.jpg", "test23", "test2", "2013"));
//        for (Track track : dao.getAllTracks()) {
//            System.out.println(track.getAlbumId());
//        }
        for (Track t : dao.searchTrackByName("muốn")) {
            System.out.println(t.getName());
        }
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rft8.model;

/**
 *
 * @author Administrator
 */
public class Favorite {

    private int userId;
    private String albumId;
    private int trackId;

    public Favorite() {
    }

    public Favorite(int userId, String albumId, int trackId) {
        this.userId = userId;
        this.albumId = albumId;
        this.trackId = trackId;
    }

    public Favorite(int userId, String albumId) {
        this.userId = userId;
        this.albumId = albumId;
    }

    public Favorite(int userId, int trackId) {
        this.userId = userId;
        this.trackId = trackId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAlbumId() {
        return albumId;
    }

    public void setAlbumId(String albumId) {
        this.albumId = albumId;
    }

    public int getTrackId() {
        return trackId;
    }

    public void setTrackId(int trackId) {
        this.trackId = trackId;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rft8.model;

/**
 *
 * @author vnxa0
 */
public class Track {

    private int id;
    private String albumId;
    private String name;
    private String nameFile;
    private String artistId;

    public Track() {
    }

    public Track(int id, String name, String nameFile, String artistId) {
        this.id = id;
        this.name = name;
        this.nameFile = nameFile;
        this.artistId = artistId;
    }

    public Track(int id, String albumId, String name, String nameFile, String artistId) {
        this.id = id;
        this.albumId = albumId;
        this.name = name;
        this.nameFile = nameFile;
        this.artistId = artistId;
    }

    public Track(String name, String nameFile, String artistId) {
        this.name = name;
        this.nameFile = nameFile;
        this.artistId = artistId;
    }

    public Track(String albumId, String name, String nameFile, String artistId) {
        this.albumId = albumId;
        this.name = name;
        this.nameFile = nameFile;
        this.artistId = artistId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAlbumId() {
        return albumId;
    }

    public void setAlbumId(String albumId) {
        this.albumId = albumId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNameFile() {
        return nameFile;
    }

    public void setNameFile(String nameFile) {
        this.nameFile = nameFile;
    }

    public String getArtistId() {
        return artistId;
    }

    public void setArtistId(String artistId) {
        this.artistId = artistId;
    }

}

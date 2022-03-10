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
public class Artist {
    private String id;
    private String pic;
    private String name;
    private String des;
    private String yearsActive;

    public Artist() {
    }

    public Artist(String id, String pic, String name, String des, String yearsActive) {
        this.id = id;
        this.pic = pic;
        this.name = name;
        this.des = des;
        this.yearsActive = yearsActive;
    }

    public Artist(String id, String name, String des, String yearsActive) {
        this.id = id;
        this.name = name;
        this.des = des;
        this.yearsActive = yearsActive;
    }
    
    
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getYearsActive() {
        return yearsActive;
    }

    public void setYearsActive(String yearsActive) {
        this.yearsActive = yearsActive;
    }
    
    
}

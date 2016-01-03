/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pi.reefcoralpi;

 
/**
 * @author pi
 *
 */
public class WaterLevel {
    private String date; 
    private float level;

    public float getLevel() {
        return level;
    }

    public void setLevel(float level) {
        this.level = level;
    }
    private int time;
    public WaterLevel() {
    }

    public WaterLevel(String date, float temp1) {
        this.date = date;
        this.level = temp1;
    }
    
 
    public String getDate() {
        return date;
    }
 
    public void setDate(String date) {
        this.date = date;
    }

    public void setTime(String time) {
        this.time = Integer.parseInt(time);
    }
    
    public int getTime(){
        return time;
    }
}

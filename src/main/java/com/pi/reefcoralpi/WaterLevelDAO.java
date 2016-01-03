/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pi.reefcoralpi;

import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Locale;
/**
 *
 * @author pi
 */
public class WaterLevelDAO {
    
    // JDBC driver name and database URL
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost:3306/ReefCoralPi";

   //  Database credentials
   static final String USER = "root";
   static final String PASS = "root";
   static Connection conn = null;
   
   public static Connection getConnection() {
      
    try{
      Class.forName("com.mysql.jdbc.Driver");

      //STEP 3: Open a connection
      conn = DriverManager.getConnection(DB_URL,USER,PASS);
    }
    catch(Exception ex){
        System.err.println(ex.toString());
    }
      return conn;
   }
   
   public static List<WaterLevel> getWaterLevels(){
      WaterLevelDAO.getConnection();
      ArrayList<WaterLevel> temps = new ArrayList<WaterLevel>();
      try{
          Statement stmt = conn.createStatement();
          String sql;
          sql = "SELECT datetime, level FROM waterlevels LIMIT 100";
          ResultSet rs = stmt.executeQuery(sql);

          while(rs.next()){
             WaterLevel temp = new WaterLevel();
             temp.setDate(rs.getString(1));//.split(", 201[5-6]")[1].replace(" PM EET", ""));
             DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, Locale.ENGLISH);
             temp.setTime(rs.getString(1).split(" ")[1].replace(":",""));
             //System.out.println(temp.getDateMilli());
             temp.setLevel(rs.getFloat(2));
             temps.add(temp);
          }
          rs.close();
          stmt.close();
          conn.close();
      }
      catch(Exception e){
          e.printStackTrace();
      }
      
      return temps;
   }
   
   public static void setWaterLevel(WaterLevel temp){
      WaterLevelDAO.getConnection();
      PreparedStatement stmt = null;
      try{
          String query = " INSERT INTO waterlevels (datetime, level)"
            + " values (?, ?, ?)";
          stmt = conn.prepareStatement(query);

          stmt.setString(1, temp.getDate());
          stmt.setFloat(2, temp.getLevel());          
          stmt.execute();
      }
      catch(Exception e){
          e.printStackTrace();
      }
   }
   
   public static void cleanTemperatures(){
       TemperatureDAO.getConnection();
       try{
          Statement stmt = conn.createStatement();
          String sql;
          sql = "DELETE FROM waterlevels ORDER BY datetime ASC LIMIT 60";
          stmt.executeQuery(sql);
          stmt.close();
          conn.close();
      }
      catch(Exception e){
          e.printStackTrace();
      }
   }


}

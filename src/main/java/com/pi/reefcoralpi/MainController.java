/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pi.reefcoralpi;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
    private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, Locale.ENGLISH);
		
		String formattedDate = dateFormat.format(date);
                
                
                String roomTemp = Temperature.readTemp(1);
                String waterTemp= Temperature.readTemp(2);
                
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("roomTemp",roomTemp);
                model.addAttribute("waterTemp",waterTemp);
                model.addAttribute("Pins",GPIOService.getAllPins());

		return "home";
	}
        
        
        @RequestMapping(value = "/lighting", method = RequestMethod.GET)
	public String lighting(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, Locale.ENGLISH);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "lighting";
	}
        
        @RequestMapping(value = "/camera", method = RequestMethod.GET)
	public String camera(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, Locale.ENGLISH);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "camera";
	}
        
        @RequestMapping(value = "/temperature", method = RequestMethod.GET)
	public String temperature(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, Locale.ENGLISH);
		String formattedDate = dateFormat.format(date);
                
                
                String roomTemp = Temperature.readTemp(1);
                String waterTemp= Temperature.readTemp(2);
                
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("roomTemp",roomTemp);
                model.addAttribute("waterTemp",waterTemp);
                model.addAttribute("Pins",GPIOService.getAllPins());
                model.addAttribute("Temps",TemperatureDAO.getTemperatures());
		return "temperature";
	}
        
        @RequestMapping(value = "/sump", method = RequestMethod.GET)
	public String sump(Locale locale, Model model) {
                logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, Locale.ENGLISH);
		String formattedDate = dateFormat.format(date);
                
                DecimalFormat df = new DecimalFormat("#.0");
                
                String level = "12.4";//df.format(GPIOService.measureDistance());
                model.addAttribute("Level",level);
                model.addAttribute("Pins",GPIOService.getAllPins());
                model.addAttribute("Levels",WaterLevelDAO.getWaterLevels());
		return "sump";
        }
        
        @RequestMapping(value = "/updatetemp", method = RequestMethod.GET)
	public String updateTemperature(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy, HH:mm");
		
		String formattedDate = dateFormat.format(date);
                
                
                String roomTemp = Temperature.readTemp(1);
                String waterTemp= Temperature.readTemp(2);
                
                Temperature temp = new Temperature(formattedDate,Float.parseFloat(roomTemp),Float.parseFloat(waterTemp));
                
                TemperatureDAO.setTemperature(temp);
                model.addAttribute("roomTemp",roomTemp);
                model.addAttribute("waterTemp",waterTemp);
                model.addAttribute("Pins",GPIOService.getAllPins());
		return "temp";
	}
        
        @RequestMapping(value = "/updatewaterlevel", method = RequestMethod.GET)
	public String updateWaterLevel(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy, HH:mm");
		
		String formattedDate = dateFormat.format(date);
                
                float dis = GPIOService.measureDistance();
                
                WaterLevel level = new WaterLevel(formattedDate,dis);
                
                WaterLevelDAO.setWaterLevel(level);
                //model.addAttribute("roomTemp",output);
                //model.addAttribute("waterTemp",waterTemp);
                //model.addAttribute("Pins",GPIOService.getAllPins());
		return "ok";
	}
        
        @RequestMapping(value = "/switch/{id:\\d+}", method = RequestMethod.GET)
	public String toggle(@PathVariable String id) {
		GPIOService.switchRelay(Integer.parseInt(id));
                System.out.println("Switch "+id+"!!!");
		return "home";
	}
}

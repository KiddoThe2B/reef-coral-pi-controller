/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pi.reefcoralpi;

import com.pi4j.io.gpio.GpioController;
import com.pi4j.io.gpio.GpioFactory;
import com.pi4j.io.gpio.GpioPinDigitalInput;
import com.pi4j.io.gpio.GpioPinDigitalOutput;
import com.pi4j.io.gpio.PinState;
import com.pi4j.io.gpio.RaspiPin;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pi
 */
public class GPIOService {
    static final GpioController gpio = GpioFactory.getInstance();
    private final static float SOUND_SPEED = 340.29f;  // speed of sound in m/s
    
    private final static int TRIG_DURATION_IN_MICROS = 10; // trigger duration of 10 micro s
    private final static int WAIT_DURATION_IN_MILLIS = 60; // wait 60 milli s

    private final static int TIMEOUT = 2100;
    static final GpioPinDigitalInput echo = gpio.provisionDigitalInputPin(RaspiPin.GPIO_06);
    static final GpioPinDigitalOutput trig = gpio.provisionDigitalOutputPin(RaspiPin.GPIO_04, "Trig", PinState.LOW);
    static final GpioPinDigitalOutput heater = gpio.provisionDigitalOutputPin(RaspiPin.GPIO_00, "Heater", PinState.HIGH);
    static final GpioPinDigitalOutput fans = gpio.provisionDigitalOutputPin(RaspiPin.GPIO_02, "Fans", PinState.LOW);
    static final GpioPinDigitalOutput lights = gpio.provisionDigitalOutputPin(RaspiPin.GPIO_03, "Lighting", PinState.HIGH);
    static final GpioPinDigitalOutput sump = gpio.provisionDigitalOutputPin(RaspiPin.GPIO_05, "Sump", PinState.HIGH);
    
    static void switchRelay(int i){
        
        switch (i) {
            case 1:
                if(heater.getState().isLow()){
                    heater.high();
                }
                else{
                    heater.low();
                }
                break;
            case 2:
                if(fans.getState().isLow()){
                    fans.high();
                }
                else{
                    fans.low();
                }
                break;
            case 3:
                if(lights.getState().isLow()){
                    lights.high();
                }
                else{
                    lights.low();
                }
                break;
            case 4:
                if(sump.getState().isLow()){
                    sump.high();
                }
                else{
                    sump.low();
                }
                break;
            default:
                break;
        }
    }
    
    static List getAllPins(){
        ArrayList<String> pins = new ArrayList();
        
        pins.add(heater.getState().toString());
        pins.add(fans.getState().toString());
        pins.add(lights.getState().toString());
        pins.add(sump.getState().toString());
        
        return pins;
    }
    
    static void resetAllPins(){
        heater.high();
        fans.low();
        lights.high();
        sump.high();
        trig.low();
    }
    
    public static float measureDistance(){
        triggerSensor();
        try {
            waitForSignal();
        } catch (Exception ex) {
            Logger.getLogger(GPIOService.class.getName()).log(Level.SEVERE, null, ex);
        }
        long duration = measureSignal();
        
        return duration * SOUND_SPEED / ( 2 * 10000 );
    }

    private static void triggerSensor() {
        try {
            trig.high();
            Thread.sleep( 0, TRIG_DURATION_IN_MICROS * 1000 );
            trig.low();
        } catch (InterruptedException ex) {
            System.err.println( "Interrupt during trigger" );
        }
    }
    
    private static void waitForSignal() throws Exception {
        int countdown = TIMEOUT;
        
        while( echo.isLow() && countdown > 0 ) {
            countdown--;
        }
        
        if( countdown <= 0 ) {
            throw new Exception( "Timeout waiting for signal start" );
        }
    }
    

    private static long measureSignal(){
        int countdown = TIMEOUT;
        long start = System.nanoTime();
        while( echo.isHigh() && countdown > 0 ) {
            countdown--;
        }
        long end = System.nanoTime();
        
        if( countdown <= 0 ) {
            return 0;
        }
        
        return (long)Math.ceil( ( end - start ) / 1000.0 );  // Return micro seconds
    }
    
}

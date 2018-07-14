/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.norellanac.controlAccesoArduino.utiles.test;

import com.norellanac.controlAccesoArduino.utiles.fechasNorellanac;
import java.util.Date;

/**
 *
 * @author ORELLANA CUY
 */
public class fechasHoraTest {

    /**
     * @param args the command line arguments
     */
    
    
    public static void main(String[] args) {
        //https://docs.oracle.com/javase/7/docs/api/java/text/SimpleDateFormat.html 
        fechasNorellanac fN= new fechasNorellanac();
        Date date = new Date();
        // TODO code application logic here
        
        System.out.println(date.getYear() + 1900 );
        System.out.println(date.getMonth() );
        System.out.println(date.getDay() );
        System.out.println(date.getHours() );
        System.out.println(date.getMinutes() );
        System.out.println(fN.date());
        System.out.println(fN.time());
    }
    
}

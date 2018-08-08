/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.norellanac.controlAccesoArduino.utiles.test;

import com.panamahitek.ArduinoException;
import com.panamahitek.PanamaHitek_Arduino;

/**
 *
 * @author norellanac
 */
public class pruebasMEtodosTest {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ArduinoException {
        // TODO code application logic here
        PanamaHitek_Arduino ino = new PanamaHitek_Arduino();
        //ino.killArduinoConnection();
        arduinoRecibe2EnviaString ard=new arduinoRecibe2EnviaString();
        ard.enviarDato("1,1005");
    }
    
}

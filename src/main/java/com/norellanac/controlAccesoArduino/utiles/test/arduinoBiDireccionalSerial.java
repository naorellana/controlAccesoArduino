/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
int i = 1;
int j = 2;
int k = 3;
int l = 4;
String data="null";
void setup() {
  Serial.begin(9600);
}

void loop() {
  /*
    Remplazar el valor de las variables "i", "j", "k" y "l" por los sensores
    cuyo valor se quiere enviar a Java para que sea graficado
  
  
    if (data=="ok"){
    delay(3000);
    data="Acceso Correcto - Abrir Puerta";
    }
  else{
    delay(1000);
    data="Acceso Denegado - Pulse Lector de Huella";
      };
  Serial.println(i);
  Serial.println(j);
  Serial.println(k);
  Serial.println(l);
  Serial.println(data);
  i++;
  j++;
  k++;
  l++;
  
  data=Serial.readString();
  
}


*/

package com.norellanac.controlAccesoArduino.utiles.test;

import com.norellanac.controlAccesoArduino.utiles.*;
import com.panamahitek.ArduinoException;
import com.panamahitek.PanamaHitek_Arduino;
import com.panamahitek.PanamaHitek_MultiMessage;
import java.util.logging.Level;
import java.util.logging.Logger;
import jssc.SerialPortEvent;
import jssc.SerialPortEventListener;
import jssc.SerialPortException;

/**
 *
 * @author norellanac
 */
public class arduinoBiDireccionalSerial {

    /**
     * @param args the command line arguments
     */
    //se declara el nombre del puerto ||ya que funciona en linux y windows, pero los nombres del puerto cambian
    private static String PuertoSerie="/dev/ttyACM0";
    //Cantidad de variables--Serial.println();-- que se leeran desde arduino
    private static int arduinoVariables=5;
    //Se crea una instancia de la librería PanamaHitek_Arduino
    private static PanamaHitek_Arduino ino = new PanamaHitek_Arduino();
    //var multi, sirve para leer multiples println desde arduino y el numero indica la cantidad de lecturas
    private static PanamaHitek_MultiMessage multi = new PanamaHitek_MultiMessage(arduinoVariables, ino);
        private static final SerialPortEventListener listener = new SerialPortEventListener() {
        @Override
        public void serialEvent(SerialPortEvent spe) {
            try {

                /*
                Aquí es donde se reciben los datos
                multi.dataReceptionCompleted() devuelve TRUE cuando se ha recibido
                los datos de todos los sensores
                 */
                if (multi.dataReceptionCompleted()) {
                    /*
                     * Con multi.getMessage() se leen los datos de los sensores
                     * Los numeros 0, 1 y 2 son los índices de los sensores, los
                     * cuales han sido impresos en ese mismo orden en el Arduino
                     * utilizando Serial.println(). Si no se usa
                     * Serial.println(), la clase MultiMessage no funcionará.
                     *
                     * A pesar de que en la instancia de la clase se colocaron 3
                     * sensores, los índices son 0, 1 y 2 porque se cuenta desde
                     * el cero.
                     */
                    System.out.println("Valor de a --> " + multi.getMessage(0));
                    System.out.println("Valor de b --> " + multi.getMessage(1));
                    System.out.println("Valor de c --> " + multi.getMessage(2));
                    System.out.println("Valor de c --> " + multi.getMessage(3));
                    System.out.println("Valor de String --> " + multi.getMessage(4));
                    System.out.println("-----------------------------------");
                    if (multi.getMessage(0).equals("10")) {
                        System.out.println("Prueba De comparacion Exitosa");
                        ino.sendData("ok");
                    }
                    else{
                        ino.sendData("Acceso Denegado - Presione Lector De Huella");
                    }
                    multi.flushBuffer();
                }
            } catch (SerialPortException | ArduinoException ex) {
                Logger.getLogger(arduinoBiDireccionalSerial.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    };

    public static void main(String[] args) {
        try {
            ino.arduinoRXTX(PuertoSerie, 9600, listener);
            ino.sendData("");
        } catch (ArduinoException | SerialPortException ex) {
            Logger.getLogger(arduinoBiDireccionalSerial.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}


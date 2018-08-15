//**********DECLARACIONES*************
#include <Adafruit_Fingerprint.h>
// For UNO and others without hardware serial, we must use software serial...
// pin #2 is IN from sensor (GREEN wire)
// pin #3 is OUT from arduino  (WHITE wire)
//pin 4 switch
//0,ok  2,9
#include <SoftwareSerial.h>
//variables globales, se usan solo 2 para imprimir por razones de comunicacion con JAVA
String text1="";
String text2="";
//*******VARIABLES DEL SWITCH 110V*********
String text="0,0";//variable con datos desde java o modulos de arduino
String codigo="";
String variable="";
int pinArduino=4; //switch
const int buzzer = 5; //buzzer to arduino pin 5d


//******VARIABLES DEL ENROLL*****************
SoftwareSerial mySerial(2, 3);
Adafruit_Fingerprint finger = Adafruit_Fingerprint(&mySerial);
uint8_t id;
//**************FIN VARIABLES ENROL**********

//*********DISPLAY LCD***********
// Prueba de Modulo I2C para LCD 2x16 By: http://dinastiatecnologica.com

#include  <Wire.h>
#include  <LiquidCrystal_I2C.h>
String a="Sistema Control De Acceso";
String b="Nery ORellana:)";

// Constructor de la librería de LCD 16x2
// Aqui se configuran los pines asignados a la pantalla del PCF8574
LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);
//*******************
  //int ledPin = 9; // Piezo on Pin 8
const int ldrPin = A3; // LDR en el pin analogico 3
int ldrValue = 0;

  byte sensorpir = 6;
  const int infrarojo = A2;
byte led = 13;
byte pulsador = 7;

  int cont=0;
//**************FIN DECLARACIONES***********


void setup() {
  Serial.begin(9600);     // opens serial port, sets data rate to 9600 bps
//*********** REGISTRO DE HUELLA *************
  while (!Serial);  // For Yun/Leo/Micro/Zero/...
  delay(100);
  // set the data rate for the sensor serial port
  finger.begin(57600);
  if (finger.verifyPassword()) {
    text1="Sensor=SI Menu*** 1-Switch, 2-Regsitrar, 3-LeerHuella, 4-BorrarHuella, Desarollador";
    //Serial.println("Found fingerprint sensor!");
  } else {
    text1="sensor=NO:";
    //Serial.println("Did not find fingerprint sensor :(");
    while (1) { delay(1); }
  }
  //************FIN REGISTRO DE HUELLA***********

  //***********INICIA LECTURA DE HUELLA*************
  finger.getTemplateCount();
  text2="Templates: ";
  text2.concat(finger.templateCount);
  //Serial.print("Sensor contains "); Serial.print(finger.templateCount); Serial.println(" templates");
  //***********FIN LECTURA HUELLA*************
  Serial.println(text1);
  Serial.println(text2); 
  dispLCD("Sistema De Control", "Ingressos GYM");
  pinMode(pulsador,INPUT);
  pinMode(infrarojo,INPUT);
  pinMode(sensorpir,INPUT);
 
}

void loop() {
  //sensorLuz(); 
//sensorLuz(700);
//sensorMov();
//dispLCD("Sistema De Control", "Ingressos GYM");
  // send data only when you receive data:
  if (Serial.available() > 0) {
    // read the incoming byte:
    text=Serial.readString();
    codigo=text.substring(0,1);
  variable=text.substring(2,text.length());
  Serial.println(codigo);
  Serial.println(variable);
  dispLCD(codigo, variable);
  switch (codigo.toInt()) {
  case 1:
    // statements
    activarSwitch();   //funcion que activa el relay o switch 110v
    dispLCD("Abrir Puerta", "Bienvenido");
    break;
  case 2:
    // statements
    registraHuella(variable);
    break;
  case 3:
    //********* LECTURA DE HUELLA*************  
    while (getFingerprintIDez()){
        getFingerprintIDez();
        delay(50);            //don't ned to run this at full speed.
        if (getFingerprintIDez()>0){
          dispLCD("Acceso Correcto", "Bienvenido");
          activarSwitch();//funcion que activa el relay o switch 110v
          pinMode(7,INPUT);
          for (int i=0; i<15;i++){
            sensorMov();
            sensorInfra();
            delay(1000);
            if(digitalRead(pulsador) == HIGH){
              i=15;
            }
          }
          //sonido(2);
          break;
        }
        //break;
      }
    break;
  case 4:
    // statements
    //******ELIMINA HUELLA  *********
    Serial.println("Eliminando Registro");
    Serial.println("Please type in the ID # (from 1 to 127) you want to delete...");
    uint8_t id;
    id=variable.toInt();
    if (id == 0) {// ID #0 not allowed, try again!
       return;
    }

  Serial.print("Deleting ID #");
  Serial.println(id);
  
  deleteFingerprint(id);
  dispLCD("Eliminando Datos","Registro con ID: "+id);
    break;
  case 5:
    if (variable.toInt()==1005){
      finger.emptyDatabase();
      Serial.println("Now database is empty :)");
      Serial.println("Now database is empty :)");
      dispLCD("Eliminando", "Todos Los Registros Eliminados");
    }else{
       Serial.println("--Clave Erronea :)");
      Serial.println("--Clave Erronea :)");
    }
    // statements
    //if(codigo=="5" & variable=="1005"){
    //deleteFromHuellas();
   
  //}
    break;
  default:
    // statements
    //Serial.println("");
    //delay(5000);
    break;
}
  }
  //Serial.println(codigo);
  //Serial.println(variable); 
  //delay(500);
  
  /*if (text==""){
    text="1,0";
  }*/
    // say what you got:
    delay(2000);
}




//funcion que ejecuta segun el texto de entrada
String leerDato(String dato){
  
  
}
uint8_t readnumber(void) {
  uint8_t num = 0;
  
  while (num == 0) {
    while (! Serial.available());
    num = Serial.parseInt();
  }
  return num;
}


//************ FUNCION ACTIVAR SWWITCH 110V ***************
void activarSwitch(){
  //activar el switch 110v
    pinMode(pinArduino, OUTPUT); // Configurar relay como salida o OUTPUT
    //ejecuta blink una vez
    //digitalWrite(pinArduino, HIGH); // envia señal alta al relay
    Serial.println("switchON");
    Serial.println("Acceso Correcto");
    delay(1000);           // 1 segundo
    
    digitalWrite(pinArduino, LOW);  // envia señal baja al relay
    //Serial.println("switchOFF");
    delay(1000);// 1 segundo 
    digitalWrite(pinArduino, HIGH);
}
//***************************




//************FUNCION REGISTRO DE HUELLA********
uint8_t getFingerprintEnroll() {

  int p = -1;
  Serial.print("Waiting for valid finger to enroll as #"); Serial.println(id);
  while (p != FINGERPRINT_OK) {
    p = finger.getImage();
    switch (p) {
    case FINGERPRINT_OK:
      Serial.println("Image taken");
      break;
    case FINGERPRINT_NOFINGER:
      Serial.print(".");
      break;
    case FINGERPRINT_PACKETRECIEVEERR:
      Serial.println("Communication error");
      break;
    case FINGERPRINT_IMAGEFAIL:
      Serial.println("Imaging error");
      break;
    default:
      Serial.println("Unknown error");
      break;
    }
  }

  // OK success!

  p = finger.image2Tz(1);
  switch (p) {
    case FINGERPRINT_OK:
      Serial.print("Image converted");
      break;
    case FINGERPRINT_IMAGEMESS:
      Serial.println("Image too messy");
      return p;
    case FINGERPRINT_PACKETRECIEVEERR:
      Serial.println("Communication error");
      return p;
    case FINGERPRINT_FEATUREFAIL:
      Serial.println("Could not find fingerprint features");
      return p;
    case FINGERPRINT_INVALIDIMAGE:
      Serial.println("Could not find fingerprint features");
      return p;
    default:
      Serial.println("Unknown error");
      return p;
  }
  
  Serial.println("  - Remove finger");
  delay(2000);
  p = 0;
  while (p != FINGERPRINT_NOFINGER) {
    p = finger.getImage();
  }
  Serial.print("ID "); Serial.println(id);
  p = -1;
  Serial.println("Place same finger again");
  while (p != FINGERPRINT_OK) {
    p = finger.getImage();
    switch (p) {
    case FINGERPRINT_OK:
      Serial.println("Image taken");
      break;
    case FINGERPRINT_NOFINGER:
      Serial.print(".");
      break;
    case FINGERPRINT_PACKETRECIEVEERR:
      Serial.println("Communication error");
      break;
    case FINGERPRINT_IMAGEFAIL:
      Serial.println("Imaging error");
      break;
    default:
      Serial.println("Unknown error");
      break;
    }
  }

  // OK success!

  p = finger.image2Tz(2);
  switch (p) {
    case FINGERPRINT_OK:
      Serial.println("Image converted");
      break;
    case FINGERPRINT_IMAGEMESS:
      Serial.println("Image too messy");
      return p;
    case FINGERPRINT_PACKETRECIEVEERR:
      Serial.println("Communication error");
      return p;
    case FINGERPRINT_FEATUREFAIL:
      Serial.println("Could not find fingerprint features");
      return p;
    case FINGERPRINT_INVALIDIMAGE:
      Serial.println("Could not find fingerprint features");
      return p;
    default:
      Serial.println("Unknown error");
      return p;
  }
  
  // OK converted!
  Serial.print("Creating model for #");  Serial.println(id);
  
  p = finger.createModel();
  if (p == FINGERPRINT_OK) {
    Serial.println("Prints matched!");
  } else if (p == FINGERPRINT_PACKETRECIEVEERR) {
    Serial.println("Communication error");
    return p;
  } else if (p == FINGERPRINT_ENROLLMISMATCH) {
    Serial.println("Fingerprints did not match");
    return p;
  } else {
    Serial.println("Unknown error");
    return p;
  }   
  
  Serial.print("ID "); Serial.print(id);
  p = finger.storeModel(id);
  if (p == FINGERPRINT_OK) {
    Serial.println(" Stored!");
  } else if (p == FINGERPRINT_PACKETRECIEVEERR) {
    Serial.println("Communication error");
    return p;
  } else if (p == FINGERPRINT_BADLOCATION) {
    Serial.println("Could not store in that location");
    return p;
  } else if (p == FINGERPRINT_FLASHERR) {
    Serial.println("Error writing to flash");
    return p;
  } else {
    Serial.println("Unknown error");
    return p;
  }   
}
//************FIN REGISTRO HUELLA FUNCION***********
//********************************registrar huellas********************************
void registraHuella(String var){
  id = var.toInt();
  Serial.println(id,DEC);
  if (id == 0) {// ID #0 not allowed, try again!
     return;
  }
  Serial.print("Enrolling ID #");
  Serial.println(id);
  while (!  getFingerprintEnroll() );
}
//***************************FIN REGISTRO HUELLA************



//************** FUNCION LECTURA DE HUELLA*********************
uint8_t getFingerprintID() {
  uint8_t p = finger.getImage();
  switch (p) {
    case FINGERPRINT_OK:
      Serial.println("Image taken");
      break;
    case FINGERPRINT_NOFINGER:
      Serial.println("No finger detected");
      return p;
    case FINGERPRINT_PACKETRECIEVEERR:
      Serial.println("Communication error");
      return p;
    case FINGERPRINT_IMAGEFAIL:
      Serial.println("Imaging error");
      return p;
    default:
      Serial.println("Unknown error");
      return p;
  }

  // OK success!

  p = finger.image2Tz();
  switch (p) {
    case FINGERPRINT_OK:
      Serial.println("Image converted");
      break;
    case FINGERPRINT_IMAGEMESS:
      Serial.println("Image too messy");
      return p;
    case FINGERPRINT_PACKETRECIEVEERR:
      Serial.println("Communication error");
      return p;
    case FINGERPRINT_FEATUREFAIL:
      Serial.println("Could not find fingerprint features");
      return p;
    case FINGERPRINT_INVALIDIMAGE:
      Serial.println("Could not find fingerprint features");
      return p;
    default:
      Serial.println("Unknown error");
      return p;
  }
  
  // OK converted!
  p = finger.fingerFastSearch();
  if (p == FINGERPRINT_OK) {
    Serial.println("Found a print match!");
  } else if (p == FINGERPRINT_PACKETRECIEVEERR) {
    Serial.println("Communication error");
    return p;
  } else if (p == FINGERPRINT_NOTFOUND) {
    Serial.println("Did not find a match");
    return p;
  } else {
    Serial.println("Unknown error");
    return p;
  }   
  
  // found a match!
  Serial.print("Found ID #"); Serial.print(finger.fingerID); 
  Serial.print(" with confidence of "); Serial.println(finger.confidence); 

  return finger.fingerID;
}

// returns -1 if failed, otherwise returns ID #
int getFingerprintIDez() {
  uint8_t p = finger.getImage();
  if (p != FINGERPRINT_OK)  return -1;

  p = finger.image2Tz();
  if (p != FINGERPRINT_OK)  return -1;

  p = finger.fingerFastSearch();
  if (p != FINGERPRINT_OK)  return -1;
  
  // found a match!
  Serial.println("FoundID"); 
  Serial.println(finger.fingerID); 
  return finger.fingerID; 
  }
//**************** FIN FUN LECTURA HUELLA*******************



//******************** FUNCION ELEIMINAR HUELLA POR ID *********************
uint8_t deleteFingerprint(uint8_t id) {
  uint8_t p = -1;
  
  p = finger.deleteModel(id);

  if (p == FINGERPRINT_OK) {
    Serial.println("Deleted!");
  } else if (p == FINGERPRINT_PACKETRECIEVEERR) {
    Serial.println("Communication error");
    return p;
  } else if (p == FINGERPRINT_BADLOCATION) {
    Serial.println("Could not delete in that location");
    return p;
  } else if (p == FINGERPRINT_FLASHERR) {
    Serial.println("Error writing to flash");
    return p;
  } else {
    Serial.print("Unknown error: 0x"); Serial.println(p, HEX);
    return p;
  }   
}
//*****************************************


//***************** FUNCION ELIMINAR TODAS LAS HUELLAS ***********************
void deleteFromHuellas(){
  Serial.println("- Delete all fingerprint templates?!");
  Serial.println("Press 'Y' key to continue");

  while (1) {
    if (Serial.available() && (Serial.read() == 'Y')) {
      break;
    }
  }
 
  if (finger.verifyPassword()) {
    Serial.println("Found fingerprint sensor!");
  } else {
    Serial.println("Did not find fingerprint sensor :(");
    while (1);
  }
  
  finger.emptyDatabase();

  Serial.println("Now database is empty :)");
}
//*****************************************


//********** FUNCION DE TONO (BUZZER) ******************
void sonido(int segundos){
   
  pinMode(buzzer, OUTPUT); // Set buzzer - pin 9 as an output
  tone(buzzer, 1000); // Send 1KHz sound signal...
  delay(segundos*1000);        // ...for 1 sec
  noTone(buzzer);     // Stop sound...
  //delay(1000);        // ...for 1sec
}
//******************************


//************** FUNCION MOSTAR EN LCD 2X16*****************
void dispLCD(String a,String b) {
   // Indicar a la libreria que tenemos conectada una pantalla de 16x2
  lcd.begin(16, 2);
  // Mover el cursor a la primera posición de la pantalla (0, 0)
  lcd.home ();
  // Imprimir "Hola Mundo" en la primera linea
  lcd.print(a);
  // Mover el cursor a la segunda linea (1) primera columna
  lcd.setCursor ( 0, 1 );
  // Imprimir otra cadena en esta posicion
  lcd.print(b);
  // Esperar un segundo
  //delay(1000);
//mueve las letras en la pantalla 
  for(int c=0;c<12;c++){
  lcd.scrollDisplayLeft();
  delay(100);
  }
  for(int c=0; c<12;c++){
  lcd.scrollDisplayRight();
  delay(100); 
  }
}
//******************************


//***************fotoResistencia******************
void sensorLuz(int resistencia){


//pinMode(ledPin,OUTPUT);

ldrValue = analogRead(ldrPin); 
//Serial.println(ldrValue);
if (ldrValue >= resistencia){
  sonido(1);
  delay(250);
  sonido(1);
  delay(250);
  sonido(1);
  //dispLCD("Detectado Ingreso","Sensor Luz");
  
}
else {
//digitalWrite(ledPin,LOW);
}
//delay(1000);
}
//*********************************


//********** SENSOR MOVIMIENVO*************
void sensorMov(){
  
  if(digitalRead(sensorpir) == HIGH)
  {
    //dispLCD("Detectado Ingreso","Sensor Movimiento");
    Serial.println("Detectado Ingreso Sensor Movimiento");
    Serial.println("Detectado Ingreso Sensor Movimiento");
    sonido(1);
  delay(250);
  sonido(1);
  delay(250);
  sonido(1);
  }
  
}
//***********************
//********** SENSOR MOVIMIENVO*************
void sensorInfra(){
  
  if(digitalRead(infrarojo) == HIGH)
  {
    //dispLCD("Detectado Ingreso","Sensor Movimiento");
    Serial.println("Detectado Ingreso Sensor Infrarojo");
    Serial.println("Detectado Ingreso Sensor infrarojo");
    sonido(1);
  delay(250);
  sonido(1);
  //delay(250);
  //sonido(1);
  }
  
}
//***********************

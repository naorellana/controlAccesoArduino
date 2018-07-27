#include <Adafruit_Fingerprint.h>
//0,ok  2,9
#include <SoftwareSerial.h>
//variables globales, se usan solo 2 para imprimir por razones de comunicacion con JAVA
String text1="";
String text2="";
//*******VARIABLES DEL SWITCH 110V*********
String text="";//variable con datos desde java o modulos de arduino
String codigo="";
String variable="";
int pinArduino=4;


//******VARIABLES DEL ENROLL*****************
SoftwareSerial mySerial(2, 3);
Adafruit_Fingerprint finger = Adafruit_Fingerprint(&mySerial);
uint8_t id;
//**************FIN VARIABLES ENROL**********

void setup() {
  Serial.begin(9600);     // opens serial port, sets data rate to 9600 bps
//*********** REGISTRO DE HUELLA *************
  while (!Serial);  // For Yun/Leo/Micro/Zero/...
  delay(100);
  // set the data rate for the sensor serial port
  finger.begin(57600);
  if (finger.verifyPassword()) {
    text1="Found fingerprint sensor! Menu*** 1-Switch, 2-Regsitrar, 3-LeerHuella, 4-BorrarHuella, Desarollador";
    //Serial.println("Found fingerprint sensor!");
  } else {
    text1="Did not find fingerprint sensor :";
    //Serial.println("Did not find fingerprint sensor :(");
    while (1) { delay(1); }
  }
  //************FIN REGISTRO DE HUELLA***********

  //***********INICIA LECTURA DE HUELLA*************
  finger.getTemplateCount();
  text2="Sensor contains ";
  text2.concat(" templates");
  text2.concat(finger.templateCount);
  //Serial.print("Sensor contains "); Serial.print(finger.templateCount); Serial.println(" templates");
  //***********FIN LECTURA HUELLA*************
  Serial.println(text1);
  Serial.println(text2); 
}

void loop() {
  // send data only when you receive data:
  if (Serial.available() > 0) {
    // read the incoming byte:
    text=Serial.readString();
    // say what you got:
    leerDato(text); //ejecuta la funcion para imprimir
  }
  Serial.println(codigo);
  Serial.println(variable); 
  delay(2000);
}

void lectura() {

        // send data only when you receive data:
        if (Serial.available() > 0) {
                // read the incoming byte:
                text=Serial.readString();
                // say what you got:
                leerDato(text); //ejecuta la funcion para imprimir
                
        }
}


//funcion que ejecuta segun el texto de entrada
String leerDato(String dato){
  codigo=dato.substring(0,1);
  variable=dato.substring(2,dato.length());
  if(codigo=="1"){
    activarSwitch();   //funcion que activa el relay o switch 110v
  }
  
  if(codigo=="2"){
    //**** REGISTRA HUELLA*****
    registraHuella(variable);  
  }
  
  if(codigo=="3"){
     Serial.println("tres");
     //********* LECTURA DE HUELLA*************  
     while (getFingerprintIDez()){
        getFingerprintIDez();
        delay(50);            //don't ned to run this at full speed.
        if (getFingerprintIDez()>0){
          activarSwitch();//funcion que activa el relay o switch 110v
          break;
        }
        //break;
      }
      
  }
 
  if(codigo=="4"){
    //******ELIMINA HUELLA  *********
    Serial.println("Eliminando Registro");
    Serial.println("Please type in the ID # (from 1 to 127) you want to delete...");
    uint8_t id =variable.toInt();
    if (id == 0) {// ID #0 not allowed, try again!
       return;
    }

  Serial.print("Deleting ID #");
  Serial.println(id);
  
  deleteFingerprint(id);
    
  }
  
  if(codigo=="5" & variable=="1005"){
    //deleteFromHuellas();
    finger.emptyDatabase();
  Serial.println("Now database is empty :)");
  Serial.println("Now database is empty :)");
  }
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
    digitalWrite(pinArduino, HIGH); // envia señal alta al relay
    Serial.println("switchON");
    delay(1000);           // 1 segundo
    
    digitalWrite(pinArduino, LOW);  // envia señal baja al relay
    Serial.println("switchOFF");
    delay(1000);// 1 segundo 
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


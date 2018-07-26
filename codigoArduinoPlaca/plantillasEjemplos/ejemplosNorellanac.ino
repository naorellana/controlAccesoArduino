String text;
void setup() {
        Serial.begin(9600);     // opens serial port, sets data rate to 9600 bps
}

void loop() {

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
  if(dato=="1")
  Serial.println("uno");
  if(dato=="2")
  Serial.println("dos");
  if(dato=="3")
  Serial.println("tres");
  if(dato=="4")
  Serial.println("cuatro");
  if(dato=="5")
  Serial.println("cinco");
  }
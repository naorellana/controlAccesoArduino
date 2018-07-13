/*CODIGO PARAARDUINO*/
int codigo = 0; //codigo de usuario
String data="null"; //string recibido desde java
void setup() {
  Serial.begin(9600);
}
void loop() {
  data="Acceso Denegado - Pulse Lector de Huella";
     if (data=="ok"){ //dato recibido de  JAVA
      delay(3000);
      }
    else{
    delay(1000);
      };
      //Envia 2 datos a JAVA
  Serial.println(codigo); //
  Serial.println(data);// A todos los usuarios les envia acceso denegado y que pulse huella
  codigo++;
  
  data=Serial.readString(); //despues de haber enviado, recibe la informacion desde java
  
}

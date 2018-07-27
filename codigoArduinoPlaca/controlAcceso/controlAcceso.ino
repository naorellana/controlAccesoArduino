/*CODIGO PARAARDUINO*/
int codigo = 0; //codigo de usuario
String data="5"; //string recibido desde java
String var="5";
void setup() {
  Serial.begin(9600);
}
void loop() {
  //data="Acceso Denegado - Pulse Lector de Huella";
     if (data=="ok"){ //dato recibido de  JAVA
      delay(3000);
      }
    else{
    delay(1000);
      };
      //Envia 2 datos a JAVA
  Serial.println(data.substring(data.length()-1,data.length())); //
  //Serial.println("----------------");
  Serial.println(data.substring(0,data.length()-2));// A todos los usuarios les envia acceso denegado y que pulse huella
  codigo++;
  
  data=Serial.readString(); //despues de haber enviado, recibe la informacion desde java
  //Serial.setTimeout(100); //orellana
  
  //var=Serial.readString();
  
}

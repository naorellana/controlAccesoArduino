int ledPin = 9; // Piezo on Pin 8
int ldrPin = 0; // LDR en el pin analogico 0
int ldrValue = 0;
void setup() {
Serial.begin(9600);
pinMode(ledPin,OUTPUT);
}
void loop() {
ldrValue = analogRead(ldrPin); 
Serial.println(ldrValue);
if (ldrValue >= 1020){
digitalWrite(ledPin,HIGH);
}
else {
digitalWrite(ledPin,LOW);
}
delay(500);
} 

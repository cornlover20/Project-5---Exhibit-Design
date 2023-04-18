void setup() {
  Serial.begin(9600);
}

void loop() {
  int knobValue = analogRead(A0);
  Serial.println(knobValue);
  delay(100);
}

//int linear= map(knobValue, 0, 1023, 0, 250); 
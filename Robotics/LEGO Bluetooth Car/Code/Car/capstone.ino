// Import librarys
#include <SoftwareSerial.h>
#include <Servo.h>

// Initialize variables
Servo servo1;
int TX = 10;
int RX = 11;
bool ignition = false;
bool power = false;
bool buzzerOn = false;
char value = '0';

SoftwareSerial HC_06(TX, RX); // Connect Bluetooth TX to 10 and Bluetooth RX to 11.

void setup()
{
  servo1.attach(9);    // Attach servo to pin 9
  HC_06.begin(9600);   // Begin serial monitor
  pinMode(13, OUTPUT); // Connect lights to pin 13
  pinMode(8, OUTPUT);  // Connect motor to pin 8
  pinMode(12, OUTPUT); // Connect horn(buzzer) to pin 12
}

void loop()
{
  if (HC_06.available() > 0) // If bluetooth command sent
  {
    value = HC_06.read();
    if (value == '0') // If command is 0
    {
      straight(); // Turn wheels straight
    }
    else if (value == 'a') // If command is a
    {
      motor(); // Toggle motor power
    }
    else if (value == 'd') // If command is d
    {
      left(); // Turn wheels left
    }
    else if (value == 'l') // If command is l
    {
      right(); // Turn wheels right
    }
    else if (value == 'h') // If command is h
    {
      lights(); // Toggle lights
    }
    else if (value == 'e') // If command is e
    {
      buzzer(); // Toggle horn(buzzer)
    }
  }
}

void straight()
{
  if (servo1.read() > 90) // If left
  {
    for (int pos = servo1.read(); pos > 80; pos -= 1) // Move down to center
    {
      servo1.write(pos); // tell servo to go to position in variable 'pos'
      delay(10);         // waits 10ms for the servo to reach the position
    }
  }
  else if (servo1.read() < 90) // If right
  {
    for (int pos = servo1.read(); pos < 95; pos += 1) // Move up to center
    {
      servo1.write(pos); // tell servo to go to position in variable 'pos'
      delay(10);         // waits 10ms for the servo to reach the position
    }
  }
}

void lights()
{
  if (power == false) // If lights off
  {
    digitalWrite(13, HIGH); // Turn lights on
    power = true;
  }
  else // If lights on
  {
    digitalWrite(13, LOW); // Turn lights off
    power = false;
  }
}

void motor()
{
  if (ignition == false) // If motor off
  {
    digitalWrite(8, HIGH); // Turn motor on
    ignition = true;
  }
  else // if motor on
  {
    digitalWrite(8, LOW); // Turn motor off
    ignition = false;
  }
}

void right()
{
  for (int pos = servo1.read(); pos > 0; pos -= 1) // Move servo down to turn car right
  {
    servo1.write(pos); // tell servo to go to position in variable 'pos'
    delay(10);         // waits 10ms for the servo to reach the position
  }
}

void left()
{
  for (int pos = servo1.read(); pos < 180; pos += 1) // Move servo up to turn car left
  {
    servo1.write(pos); // tell servo to go to position in variable 'pos'
    delay(10);         // waits 10ms for the servo to reach the position
  }
}

void buzzer()
{
  if (buzzerOn == false) // If buzzer is off
  {
    buzzerOn = true; // Turn buzzer on
    tone(12, 1000);
  }
  else // If buzzer is on
  {
    buzzerOn = false; // Turn buzzer off
    noTone(12);
  }
}
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Numerics.Float_Random;

procedure Main is
   use Ada.Numerics.Float_Random;
   Gen : Generator;
   Temp : Float;
   
   
   
   procedure GetTemp is
   begin
      Temp := 20.0 + 80.0 * Random(Gen);
   end GetTemp;
  
   
   MyR : Time := Clock;
   B : constant Time_Span := Milliseconds(1000);
   C : Integer := 10;
begin
   Reset(Gen);
   GetTemp;
   while C > 0 loop
      GetTemp;
      Put_Line("Current Temp:" & Temp'Image & " °C");
      if Temp > 85.0 then
         Put_Line("TEMP WARN");
      end if;
      
      C := (C - 1);
      delay until (MyR + B);
      MyR := MyR + B;
      end loop;
end Main;
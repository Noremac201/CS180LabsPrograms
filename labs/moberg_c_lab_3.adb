with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;

-----------------------------------------------
-- Lab 3
-- Program to read and process mixed data types
-- Input: A 4digit ID, name, 5 floating point values.
-- Output:
-- Name: Cameron Moberg
-- Date: 9/3/2015
-----------------------------------------------

procedure Moberg_C_Lab_3 is

   Max_String : constant Integer := 25;
   Name : String (1 .. Max_String);
   Name_Length : Integer range 0 .. Max_String;

   Id : Integer range 1000 .. 9999;
   Input_Value : Float;

   Neg_Count : Natural := 0;
   Non_Neg_Count : Natural := 0;
   Non_Neg_Sum : Float := 0.0;
   Non_Neg_Average : Float;

begin -- Lab_3
   --Prompting for all inputs.
   Ada.Text_IO.Put (Item => "Enter the ID: ");
   Ada.Integer_Text_IO.Get (Item => Id);

   Ada.Text_IO.Put (Item => "Enter the name: ");
   Ada.Text_IO.Get (Item => Name);

   Ada.Text_IO.Put (Item => "Enter a value: ");
   Ada.Float_Text_IO.Get (Item => Input_Value);
   if Input_Value < 0.0 then
      Neg_Count:=Neg_Count+1;
   else
      Non_Neg_Count:=Non_Neg_Count+1;
      Non_Neg_Sum:=Non_Neg_Sum+Input_Value;
   end if;

   Ada.Text_IO.Put (Item => "Enter a value: ");
   Ada.Float_Text_IO.Get (Item => Input_Value);
   if Input_Value < 0.0 then
      Neg_Count:=Neg_Count+1;
   else
      Non_Neg_Count:=Non_Neg_Count+1;
      Non_Neg_Sum:=Non_Neg_Sum+Input_Value;
   end if;

   Ada.Text_IO.Put (Item => "Enter a value: ");
   Ada.Float_Text_IO.Get (Item => Input_Value);
   if Input_Value < 0.0 then
      Neg_Count := Neg_Count+1;
   else
      Non_Neg_Count:=Non_Neg_Count+1;
      Non_Neg_Sum:=Non_Neg_Sum+Input_Value;
   end if;

   Ada.Text_IO.Put (Item => "Enter a value: ");
   Ada.Float_Text_IO.Get (Item => Input_Value);
   if Input_Value < 0.0 then
      Neg_Count:=Neg_Count+1;
   else
      Non_Neg_Count:=Non_Neg_Count+1;
      Non_Neg_Sum:=Non_Neg_Sum+Input_Value;
   end if;

   Ada.Text_IO.Put (Item => "Enter a value: ");
   Ada.Float_Text_IO.Get (Item => Input_Value);
   if Input_Value < 0.0 then
      Neg_Count:=Neg_Count+1;
   else
      Non_Neg_Count:=Non_Neg_Count+1;
      Non_Neg_Sum:=Non_Neg_Sum+Input_Value;
   end if;

   --computer processes/gets user input

   -- Write code here to prompt for and read in the id and name
   -- Then 5 data values must be read in and processed
   Non_Neg_Average:=Non_Neg_Sum / Float(Non_Neg_Count);

   -- Finally, produce the output
   Put_Line ("  ID     Negatives   Non-Neg Avg     Name");
   Put_Line (" ----    ---------   -----------     ---------");
   Ada.Integer_Text_IO.Put (Item => Id);
   Ada.Integer_Text_IO.Put (Item => Neg_Count);
   New_Line;
   Ada.Float_Text_IO.Put (
      Item => Non_Neg_Average,
      Fore => 0,
      Aft  => 0,
      Exp => 0);
   Ada.Text_IO.Put (Item => Name);

end Moberg_C_Lab_3;

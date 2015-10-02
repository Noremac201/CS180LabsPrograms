with Ada.Text_IO;
with Ada.Float_Text_IO;

   --------------------------------------------------
   --
   -- A program to convert feet to other measurements.
   -- Input: Number of feet
   -- Output: Equivalent number of inches
   --
   -- Original written by: Bob Matthews
   -- Updated by: Kerrin Smith
   -- Modified by: Cameron Moberg
   -- Date: 8/27/2015
   --
   ---------------------------------------------------

procedure Moberg_Lab_2 is

   -- Float formatting constants
   Fore_Length : constant Integer := 1;
   Output_Precision : constant Integer := 2;
   Decimal_Exp : constant Integer := 0;
   Scientific_Exp : constant Integer := 1;

   -- Conversion factors
   Inches_Per_Foot : constant Float := 12.0;
   Feet_Per_Meter : constant Float := 3.281;
   Feet_Per_Parsec : constant Float := 9.878E-18;

   -- Number of feet, input by user.
   Number_Of_Feet : Float;

   -- Number of inches, calculated by program.
   Number_Of_Inches : Float;
   -- Number of Meters, calculated by program.
   Number_Of_Meters : Float;
   --Number of Parsecs, calculated by program.
   Number_Of_Parsecs : Float;
begin

   -- Prompt user for input
   Ada.Text_IO.Put (Item => "Please enter the number of feet: ");
   Ada.Float_Text_IO.Get (Item => Number_Of_Feet);

   -- Convert feet to inches
   Number_Of_Inches := Number_Of_Feet * Inches_Per_Foot;
   -- Convert Feet to Meters
   Number_Of_Meters := Number_Of_Feet / Feet_Per_Meter;
   --Convert Feet to Parsecs
   Number_Of_Parsecs := Number_Of_Feet * Feet_Per_Parsec;

   -- Print feet to inches result.
   Ada.Text_IO.Put (Item => "There are ");

   Ada.Float_Text_IO.Put (
      Item => Number_Of_Inches,
      Fore => Fore_Length,
      Aft  => Output_Precision,
      Exp => Decimal_Exp);

   Ada.Text_IO.Put (Item => " inches in ");

   Ada.Float_Text_IO.Put (
      Item => Number_Of_Feet,
      Fore => Fore_Length,
      Aft  => Output_Precision,
      Exp => Decimal_Exp);

   Ada.Text_IO.Put (Item => " feet.");
   Ada.Text_IO.New_Line;

   -- Print Feet to Meter result
   Ada.Text_IO.Put (Item => "There are ");

   Ada.Float_Text_IO.Put (
      Item => Number_Of_Meters,
      Fore => Fore_Length,
      Aft  => Output_Precision,
      Exp => Decimal_Exp);

   Ada.Text_IO.Put (Item => " meters in ");

   Ada.Float_Text_IO.Put (
      Item => Number_Of_Feet,
      Fore => Fore_Length,
      Aft  => Output_Precision,
      Exp => Decimal_Exp);

   Ada.Text_IO.Put (Item => " feet.");
   Ada.Text_IO.New_Line;

-- Print Feet to Parsec result
   Ada.Text_IO.Put (Item => "There are ");

   Ada.Float_Text_IO.Put (
      Item => Number_Of_Parsecs,
      Fore => Fore_Length,
      Aft  => Output_Precision,
      Exp => Scientific_Exp);

   Ada.Text_IO.Put (Item => " parsecs in ");

   Ada.Float_Text_IO.Put (
      Item => Number_Of_Feet,
      Fore => Fore_Length,
      Aft  => Output_Precision,
      Exp => Decimal_Exp);

   Ada.Text_IO.Put (Item => " feet.");
   Ada.Text_IO.New_Line;

end Moberg_Lab_2;

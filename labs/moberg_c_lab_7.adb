with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

------------------------------------------------------------------------------
--
--  A simple program to generate a number pattern using a for loop
--  Input:A 1 or a 2, depending on which pattern wanted.
--  Output: A differnet pattern depending on input.
--  Written by: Kerrin Smith
--  Modified by: Cameron Moberg
--  Date:10/1/15
--  Assumptions: user enters either a 1 or a 2.
------------------------------------------------------------------------------


procedure Moberg_C_Lab_7 is

   Previous_Number : Integer := 0;
   Result : Integer;
   Choice : Integer;

   procedure Pattern1 is
   begin --Pattern1
      for I in 1..9 loop
         Previous_Number := Previous_Number * 10 + I;
         Result := Previous_Number * 8 + I;
         Put (Item => Previous_Number, Width => 1);
         Put (Item => " * 8 + ");
         Put (Item => I, Width => 1);
         Put (Item => " = ");
         Put (Item => Result, Width => 1);
         New_Line;
      end loop;
   end Pattern1;

   procedure Pattern2 is
   begin --Patter2
      for I in 1..9 loop
         Previous_Number := Previous_Number * 10 + I;
         Result := Previous_Number * 9 + (I + 1);
         Put (Item => Previous_Number, Width => 1);
         Put (Item => " * 9 + ");
         Put (Item => I + 1, Width => 1);
         Put (Item => " = ");
         Put (Item => Result, Width => 1);
         New_Line;
      end loop;
   end Pattern2;

begin -- Moberg_C_Lab_7
   --prompt user for input
   Ada.Text_IO.Put (Item => "Generate Pattern 1 or Pattern 2?: ");
   Ada.Integer_Text_IO.Get (Item => Choice);
   --call the subprograms depending on input.
   if Choice = 1 then
      Pattern1;
   else
      Pattern2;
   end if;

end Moberg_C_Lab_7;

with Ada.Text_IO;
use Ada.Text_IO;

----------------------------
-- Cameron Moberg
-- 11/12/15
-- Purpose - To find the alphabetical first and last names in records.
-- Input - First and Last name with length, in a file/theprogram.
-- Output - Who has the first first name and last name alphabetically.
----------------------------
procedure Moberg_C_Lab_11 is

   subtype String_Type is String (1 .. 15);

   type Person_Type is
     record
       First_Name : String_Type;
       Last_Name : String_Type;
       First_Name_Length : Natural;
       Last_Name_Length : Natural;
     end record;


   function "<" (Left : in Person_Type;
                 Right : in Person_Type) return Boolean is
     begin
     if Left.Last_Name = Right.Last_Name then
       if Left.First_Name(1..Left.First_Name_Length) <
          Right.First_Name(1..Right.First_Name_Length) then
         return True;
       else
         return False;
       end if;
     elsif Left.Last_Name(1..Left.Last_Name_Length) <
           Right.Last_Name(1..Right.Last_Name_Length) then
       return True;
     else
       return False;
     end if;
   end "<";
   
   Person_1 : Person_Type;
   Person_2 : Person_Type;
   Person_3 : Person_Type;


begin  -- Moberg_C_Lab_11

   Person_1.First_Name := "Emma           ";
   Person_1.First_Name_Length := 4;
   Person_1.Last_Name := "Williams       ";
   Person_1.Last_Name_Length := 8;

   Person_2.First_Name := "Adam           ";
   Person_2.First_Name_Length := 4;
   Person_2.Last_Name := "Williams       ";
   Person_2.Last_Name_Length := 8;

   Person_3.First_Name := "Olivia         ";
   Person_3.First_Name_Length := 6;
   Person_3.Last_Name := "Kasperski      ";
   Person_3.Last_Name_Length := 9;

   if Person_1 < Person_2 and Person_1 < Person_3 then
      Put_Line (Item => "Person 1 is first");
   elsif Person_2 < Person_1 and Person_2 < Person_3 then
      Put_Line (Item => "Person 2 is first");
   else
      Put_Line (Item => "Person 3 is first");
   end if;

   if Person_2 < Person_1 and Person_3 < Person_1 then
      Put_Line (Item => "Person 1 is last");
   elsif Person_1 < Person_2 and Person_3 < Person_2 then
      Put_Line (Item => "Person 2 is last");
   else
      Put_Line (Item => "Person 3 is last");
   end if;

end Moberg_C_Lab_11;

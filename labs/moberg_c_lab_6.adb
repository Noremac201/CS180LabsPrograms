with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

------------------------------------------------------------
-- Cameron Moberg
-- 9/24/2015
-- Description: A basic read/write program that uses a text file as input.
-- InpuT: A text file with values in it.
-- OutpuT: Each number in the file on a seperate line.
------------------------------------------------------------

procedure Moberg_C_Lab_6 is

   File_Name : constant String := "data.txt";

   Data_File : File_Type;
   Value : Float;
   Count : Natural;
   Line_Avg : Float;
   Line_Count : Natural;

begin -- Lastname_I_Lab_6

   Open (File => Data_File, Mode => In_File, Name => File_Name);
   --Initialize Line Count for one time.
   Line_Count := 0;

   while not End_Of_File (File => Data_File) loop
      --Initialize values after every line.
      Count := 0;
      Line_Avg:= 0.0;
      Line_Count := Line_Count + 1;

      while not End_Of_Line (File => Data_File) loop
         Get (File => Data_File, Item => Value);
         --Add up total line sum.
         Line_Avg := Line_Avg + Value;
         Count := Count + 1;

      end loop;
         --Avg Line
         Line_Avg := Line_Avg / Float(Count);
         --The outputs.
	 Ada.Text_IO.Put (Item => "There are");
         Put (Item => Natural'Image (Count));
         Ada.Text_IO.Put (Item => " values on Line" );
         Put (Item => Natural'Image (Line_Count));
         Ada.Text_IO.Put (Item => " and the average is ");
         Ada.Float_Text_IO.Put (Item => Line_Avg,
            Fore => 1,
            Aft => 2,
            Exp => 0);
         New_Line;
	 --Skips to next line to read more data.
         Skip_Line (File => Data_File);

   end loop;
   Close (File => Data_File);

end Moberg_C_Lab_6;

with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

procedure moberg_c_lab_10 is

   --------------------------------------------------------------
   -- Cameron Moberg
   -- 10/29/2015
   -- Purpose: To use records and arrays to keep info on students.
   -- Input: Text file name as well as the text file.
   -- Output: The formatted Banner ID, Name, and GPA of the student.
   --------------------------------------------------------------

   subtype Name_Type is String (1 .. 30);
   subtype ID_Type is String (1 .. 9);
   subtype GPA_Type is Float range 0.0 .. 4.0;

   type Student_Record is
      record
         Banner : ID_Type;
         GPA : GPA_Type;
         Name : Name_Type;
         Name_Length : Natural;
      end record;

   Max_Student_Count : constant Integer := 100;

   type Student_Info_Type is array (1 .. Max_Student_Count) of Student_Record;

   procedure Get_Students (Info : out Student_Info_Type;
                           Count : out Natural) is

      Filename : String (1 .. 30);
      FN_Length : Natural;
      Data_File : File_Type;

   begin -- Get_Students

      Put (Item => "Name of data file: ");
      Get_Line (Item => Filename, Last => FN_Length);
      Open (File => Data_File,
            Mode => In_File,
            Name => Filename (1 .. FN_Length));
      Count := 0;
      While not End_Of_File (Data_File) loop
         Count := Count + 1;
         Ada.Text_IO.Get (File => Data_File, Item => Info(Count).Banner);
         Ada.Float_Text_IO.Get (File => Data_File, Item => Info(Count).GPA);
         Ada.Text_IO.Get_Line (File => Data_File,
                               Item => Info(Count).Name,
                               Last => Info(Count).Name_Length);
      end loop;
   end Get_Students;

   procedure Print_Header is

   begin -- Print_Header

      Put_Line (Item => "Name                Banner          GPA");
      Put_Line (Item => "----------          ---------       ---");

   end Print_Header;

   procedure Put_Students (Info : in Student_Info_Type;
                           Count : in Natural) is

      Max_Name_Length : constant Integer := 20;

   begin -- Put_Students
     for i in 1 .. Count loop
      Ada.Text_IO.Put(Item => Info(i).Name);
      for j in 1 .. Max_Name_Length - Info(i).Name_Length loop
        Put(Item => " ");
      end loop;
      put(Item => Info(i).Banner);
      put(Item => Info(i).GPA,
          fore => 8,
          aft => 2,
          exp => 0);
      New_Line;
    end loop;

   end Put_Students;

   Student_Info : Student_Info_Type;
   Student_Count : Integer range 1 .. Max_Student_Count;

begin -- Lastname_I_Lab_10

   Get_Students (Info => Student_Info, Count => Student_Count);
   Print_Header;
   Put_Students (Info => Student_Info, Count => Student_Count);

end moberg_c_lab_10;

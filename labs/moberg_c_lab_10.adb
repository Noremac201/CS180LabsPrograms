with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

procedure Lastname_I_Lab_10 is

   --------------------------------------------------------------
   -- Banner comment here
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
      Count := 1;
      While not End_Of_File (Data_File) loop
         Ada.Text_IO.Get (File => Data_File, Item => Info(Count).Banner);
         Ada.Float_Text_IO.Get (File => Data_File, Item => Info(Count).GPA);
         Ada.Text_IO.Get_Line (File => Data_File, Item => Info(Count).Name, Last => Info(Count).Name_Length);
         Count := Count + 1;       
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
      put(Item => Info(Count).Banner);
   end Put_Students;

   Student_Info : Student_Info_Type;
   Student_Count : Integer range 1 .. Max_Student_Count;

begin -- Lastname_I_Lab_10

   Get_Students (Info => Student_Info, Count => Student_Count);
   Print_Header;
   Put_Students (Info => Student_Info, Count => Student_Count);

end Lastname_I_Lab_10;

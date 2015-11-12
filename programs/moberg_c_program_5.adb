with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure moberg_c_program_5 is

  File_Name : constant String := "contacts.txt";

  type Location_Rec is
    record
      City : String(1..25);
      City_Last : Natural;
      State : String(1..2);
    end record;

  type Person_Rec is
    record
      ID : String(1..6);
      Last_Name : String(1..15);
      Last_Last : Natural;
      First_Name : String(1..15);
      First_Last : Natural;
      Address : Location_Rec;
      Tele_Num : String(1..10);
    end record;

    type Contacts_Array is array (Positive range 1..100) of Person_Rec;

  procedure Assign_Array (Data_File : in out File_Type;
                          Contacts : out Contacts_Array;
                          Index : out Natural) is
      Overwrite : Natural;
      function Check_Duplicate (Contacts : in Contacts_Array;
                                 Index : in Natural) return Natural is
        begin --Check_Duplicate
          for i in 1..Index - 1 loop
            if Contacts(Index).ID = Contacts(i).ID then
              return i; --returns the index to overwrite.
            end if;
          end loop;
          return Index; --if no duplicate found, returns original index, and
        end Check_Duplicate; -- then increments it.

    begin --Assign Array
     Open (File => Data_File, Mode => In_File, Name => File_Name);
     Index := 1;
       while not End_Of_File (Data_File) loop
  	     Get(File => Data_File,Item => Contacts(Index).ID);
         Skip_Line(File => Data_File); --Fixes Get_Line;
         Overwrite := Check_Duplicate(Index => Index, Contacts => Contacts);
         if Overwrite = Index then -- if no duplicates found, increase index.
           Index := Index + 1; --iterate through array
         end if;
         Get_Line(File => Data_File,Item => Contacts(Overwrite).Last_Name,
                  Last => Contacts(Overwrite).Last_Last);
         Get_Line(File => Data_File,Item => Contacts(Overwrite).First_Name,
                  Last => Contacts(Overwrite).First_Last);
         Get_Line(File => Data_File,Item => Contacts(Overwrite).Address.City,
                  Last => Contacts(Overwrite).Address.City_Last);
         Get(File => Data_File,Item => Contacts(Overwrite).Address.State);
         Get(File => Data_File,Item => Contacts(Overwrite).Tele_Num);
         Skip_Line(File => Data_File);
         exit when End_Of_File(Data_File);
         Skip_Line(File => Data_File); --if hasn't exited, this skips blank line.
       end loop;
       Index := Index - 1; --Correct for Index properties.
      end Assign_Array;

  procedure Output_Data (Contacts : in Contacts_Array;
                         Index : in Natural) is
    begin --Output_Data
      Put_Line ("  ID  " & "  State    " & "Tele Num  " & "  Name");
      Put_Line ("------  -----  ------------  -------------------------------");
      for i in 1..Index loop
        Put_Line(Contacts(i).ID & "   " & Contacts(i).Address.State & "    " &
                 Contacts(i).Tele_Num(1..3) & "-" & Contacts(i).Tele_Num(4..6) &
                  "-" & Contacts(i).Tele_Num(7..10) & "  " &
                  Contacts(i).First_Name(1..Contacts(i).First_Last) & " " &
                  Contacts(i).Last_Name(1..Contacts(i).Last_Last));
      end loop;
    end Output_Data;

  Data_File : File_Type;
  Contacts : Contacts_Array;
  Index : Natural;

  begin --moberg_c_program_5
    Assign_Array (Data_File => Data_File,
    		          Contacts => Contacts,
                  Index => Index);
    Output_Data (Contacts => Contacts, Index => Index);

  end moberg_c_program_5;

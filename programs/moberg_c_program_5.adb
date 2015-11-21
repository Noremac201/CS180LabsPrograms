with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure moberg_c_program_5 is

  File_Name : constant String := "contacts.txt";
  subtype Name_Type is String (1..15);

  type Location_Rec is
    record
      City : String(1..25);
      City_Last : Natural;
      State : String(1..2);
    end record;

  type Person_Rec is
    record
      ID : String(1..6);
      Last_Name : Name_Type;
      Last_Last : Natural;
      First_Name : Name_Type;
      First_Last : Natural;
      Address : Location_Rec;
      Tele_Num : String(1..10);
    end record;

    type Contacts_Array is array (Positive range 1..100) of Person_Rec;
    --couldn't figure out how to constrain it, with this many procedures
    --needing the Array.

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
     Index := 1; --Initilize the count.
       while not End_Of_File (Data_File) loop
  	 Get(File => Data_File,Item => Contacts(Index).ID);
         Skip_Line(File => Data_File); --Fixes Get_Line;
         Overwrite := Check_Duplicate(Index => Index, Contacts => Contacts);
         Get_Line(File => Data_File,Item => Contacts(Overwrite).Last_Name,
                  Last => Contacts(Overwrite).Last_Last);
         Get_Line(File => Data_File,Item => Contacts(Overwrite).First_Name,
                  Last => Contacts(Overwrite).First_Last);
         Get_Line(File => Data_File,Item => Contacts(Overwrite).Address.City,
                  Last => Contacts(Overwrite).Address.City_Last);
         Get(File => Data_File,Item => Contacts(Overwrite).Address.State);
         Get(File => Data_File,Item => Contacts(Overwrite).Tele_Num);
         Skip_Line(File => Data_File); --Fixes Get_Line.
         exit when End_Of_File(Data_File);
         Skip_Line(File => Data_File); --This skips blank line.
                                       --If it hasn't exited loop.
         if Overwrite = Index then -- if no duplicates found, increase index.
           Index := Index + 1; --iterate through array
         end if;
       end loop;
      end Assign_Array;

  procedure Sort_Names (Contacts : in out Contacts_Array;
                        Index : in Natural) is

     function "<" (Left : in Person_Rec;
                   Right : in Person_Rec) return Boolean is
     begin --"<"
       if Left.Last_Name(1..Left.Last_Last) =
          Right.Last_Name(1..Right.Last_Last) then
         if Left.First_Name(1..Left.First_Last) <
            Right.First_Name(1..Right.First_Last) then
            return False;
         else
            return True;
         end if;
       elsif Left.Last_Name(1..Left.Last_Last) <
             Right.Last_Name(1..Right.Last_Last) then
          return False;
       else
          return True;
       end if;
     end "<";

           Min_Index  : Positive;
           Temp : Person_Rec;

        begin --Sort_Names
          for Current_Pos in 1..Index - 1 loop
            Min_Index := Current_Pos;
            for Next_Pos in (Current_Pos + 1) .. Index loop
              if Contacts(Next_Pos) < Contacts(Min_Index) then
                Min_Index := Next_Pos;
              end if;
            end loop;
            Temp := Contacts(Min_Index);
            Contacts(Min_Index) := Contacts(Current_Pos);
            Contacts(Current_Pos) := Temp;
          end loop;
    end Sort_Names;

  procedure Output_Data (Contacts : in Contacts_Array;
                         Index : in Natural) is
    begin --Output_Data
      Put_Line ("  ID  " & "  State    " & "Tele Num  " & "  Name");
      Put_Line ("------  -----  ------------  -------------------------------");
      for i in reverse 1..Index loop --Iterates through unique contacts.
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
    Sort_Names(Contacts => Contacts, Index => Index);
    Output_Data (Contacts => Contacts, Index => Index);

  end moberg_c_program_5;

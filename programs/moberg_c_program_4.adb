with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Characters.Latin_1;
use Ada.Characters.Latin_1;

------------------------------------------------------------
-- Cameron Moberg
-- 9/24/2015
-- Description: A basic read/write program that uses a text file as input.
-- InpuT: A text file with values in it.
-- OutpuT: Each number in the file on a seperate line.
------------------------------------------------------------

procedure moberg_c_program_4 is

  type Baseball_Array_Type is array (Positive range <>,
                                     Positive range <>) of Integer;
  --Assign named values to array's memory slots for x axis.
  --They are global because constants and in both procedures.
  Player_Number : Natural := 1;
  Hits : Natural := 2;
  Walks : Natural := 3;
  Outs : Natural := 4;
  At_Bat : Natural := 5;

  procedure File_Check(Data_File : in out File_Type;
                       Player : out Baseball_Array_Type) is
   File_Name : constant String := "batting_stats.txt";
   Player_Count : Natural;
   Actual_Hits : Integer;
   Actual_Walks : Integer;
   Actual_Outs : Integer;

  begin --File_Check

    Open (File => Data_File, Mode => In_File, Name => File_Name);
    --Initialize the player numbers.
    for i in 1..20 loop
      Player(Player_Number,i) := i;
    end loop;

   while not End_Of_File (File => Data_File) loop

      while not End_Of_Line (File => Data_File) loop
        --Initialize the readings
         Actual_Hits := 0;
         Actual_Walks := 0;
         Actual_Outs := 0;
         --first
         Ada.Integer_Text_IO.Get (File => Data_File, Item => Player_Count);

         Ada.Integer_Text_IO.Get (File => Data_File, Item => Actual_Hits);
         Player(Hits, Player_Count) := Player(Hits, Player_Count) + Actual_Hits;

         Ada.Integer_Text_IO.Get (File => Data_File, Item => Actual_Walks);
         Player(Walks, Player_Count) := Player(Walks, Player_Count)+ Actual_Walks;

         Ada.Integer_Text_IO.Get (File => Data_File, Item => Actual_Outs);
         Player(Outs, Player_Count) := Player(Outs, Player_Count) + Actual_Outs;
      end loop;
	 --Skips to next line to read more data.
   Skip_Line (File => Data_File);
   end loop;
  Close (File => Data_File);
  end File_Check;

  procedure Output_Data(Player : in Baseball_Array_Type) is

    Batting_Average : Float;

    begin --Output_Data
       Put("Player #");
       Ada.Text_IO.Set_Col(13);
       Put("Bat Avg");
       Ada.Text_IO.Set_Col(24);
       Put("Walks");
       New_Line;
       Put("--------");
       Ada.Text_IO.Set_Col(13);
       Put("-------");
       Ada.Text_IO.Set_Col(24);
       Put("-----");
       New_Line;
       for Player_Count in 1..20 loop
           Batting_Average := float(Player(Hits,Player_Count)) / float(Player(Hits,Player_Count) + Player(Outs,Player_Count));
           Ada.Integer_Text_IO.Put(Item => Player(Player_Number,Player_Count), width => 4);
           Ada.Text_IO.Set_Col(13);
           Ada.Float_Text_IO.Put(Item => Batting_Average,
                                 fore => 2,
                                 aft => 3,
                                 exp => 0);
            Ada.Text_IO.Set_Col(24);
            Ada.Integer_Text_IO.Put(Item => Player(Walks, Player_Count), width => 3);
            New_Line;
       end loop;
  end Output_Data;

 Data_File : File_Type;
 Player : Baseball_Array_Type(Player_Number..At_Bat,1..100) := (others => (others=>0));

begin -- moberg_c_program_4
  File_Check(Data_File => Data_File, Player => Player);
  Output_Data(Player => Player);
end moberg_c_program_4;

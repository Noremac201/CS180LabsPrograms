with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

------------------------------------------------------------
-- Cameron Moberg
-- 9/24/2015
-- Description: A "basic" read/write program that uses a text file as input.
-- InpuT: A text file with values in it.
-- OutpuT: Each number in the file on a seperate line.
------------------------------------------------------------

procedure moberg_c_program_4 is

  type Baseball_Array_Type is array (Positive range <>,
                                     Positive range <>) of Integer;

  File_Name : constant String := "batting_stats.txt";

   --This procedure counts the number of lines in the file.
   procedure File_Check(Data_File : in out File_Type;
                       Line_Count : out Natural) is

   begin --File_Check
       Open (File => Data_File, Mode => In_File, Name => File_Name);
       Line_Count := 0; --Initialize line count/clear memory.
       while not End_Of_File (File => Data_File) loop
           Line_Count := Line_Count + 1;
           Skip_Line (File => Data_File);
       end loop;
       Close (File => Data_File);
   end File_Check;

   procedure Create_Output(Data_File : in out File_Type;
                           Line_Count : in Natural) is
       --Constrain array.
       Player : Baseball_Array_Type(1..4,1..Line_Count);
       --Assign names to the columns/rows values.
       Player_Number : constant Natural := 1;
       Hits : constant Natural := 2;
       Walks : constant Natural := 3;
       Outs : constant Natural := 4;

       procedure Output_Data is
           Batting_Average : Float;

       begin --Output_Data, Set_Col is for formatting.
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
               Batting_Average := float(Player(Hits,Player_Count)) /
                                        float(Player(Hits,Player_Count) +
                                        Player(Outs,Player_Count));

               Ada.Integer_Text_IO.Put(Item => Player(Player_Number,
                                                      Player_Count),
                                               width => 4);
               Ada.Text_IO.Set_Col(13);
               Ada.Float_Text_IO.Put(Item => Batting_Average,
                                     fore => 2,
                                     aft => 3,
                                     exp => 0);
               Ada.Text_IO.Set_Col(24);
               Ada.Integer_Text_IO.Put(Item => Player(Walks, Player_Count),
                                               width => 3);
               New_Line;
           end loop;
       end Output_Data;

   --Create Output Variables.
   Player_Count : Natural;
   Actual_Hits : Natural;
   Actual_Walks : Natural;
   Actual_Outs : Natural;

   begin --Create_Output

       Open (File => Data_File, Mode => In_File, Name => File_Name);
       --Initialize the Array/Clear Memory.
       Player := (others => (others => 0));
       while not End_Of_File (File => Data_File) loop
           while not End_Of_Line (File => Data_File) loop
               --Initialize the readings
               Actual_Hits := 0;
               Actual_Walks := 0;
               Actual_Outs := 0;

               Ada.Integer_Text_IO.Get (File => Data_File,
                                        Item => Player_Count);
               Ada.Integer_Text_IO.Get (File => Data_File,
                                        Item => Actual_Hits);
               Ada.Integer_Text_IO.Get (File => Data_File,
                                        Item => Actual_Walks);
               Ada.Integer_Text_IO.Get (File => Data_File,
                                        Item => Actual_Outs);

               Player(Player_Number, Player_Count) := Player_Count;
               Player(Hits, Player_Count) := Player(Hits, Player_Count) +
                                                    Actual_Hits;
               Player(Walks, Player_Count) := Player(Walks, Player_Count) +
                                                    Actual_Walks;
               Player(Outs, Player_Count) := Player(Outs, Player_Count) +
                                                    Actual_Outs;
           end loop;
	         --Skips to next line to read more data.
           Skip_Line (File => Data_File);
       end loop;
       Close (File => Data_File);
       Output_Data;
   end Create_Output;

Data_File : File_Type;
Line_Count : Natural;

begin -- moberg_c_program_4
   File_Check(Data_File => Data_File, Line_Count => Line_Count);
   Create_Output(Data_File => Data_File, Line_Count => Line_Count);
end moberg_c_program_4;

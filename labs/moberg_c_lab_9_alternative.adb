-------------------------------------------------------------------------------
-- Name: Cameron Moberg
-- Date: 10/22/2015
-- Input: At least 1 Number, up to 100 numbers between 0 and 100.
-- they are integers and you must enter -1 to exit loop.
-- Output: The number of A's, B's,C's,D's,F's and number of scores read.
-- Purpose: To learn arrays and make an easy to count.
-------------------------------------------------------------------------------


with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Moberg_C_Lab_9 is
	Max_Score : constant := 100;

	subtype Index_Type is Integer range 1..Max_Score;
	type Score_Array_Type is array (Index_Type) of Natural;

	procedure Get_Scores (Scores : out Score_Array_Type;
			      Num_Scores : out Natural) is

	Value : Integer range -1..100;

	begin --Get_Scores
		--instantiate the variables.
		Num_Scores := 0;
		Value := 0;
		Scores(1) := 0;
		Scores(2) := 0;
		Scores(3) := 0;
		Scores(4) := 0;
		Scores(5) := 0;

		while Value >= 0 loop
		    Ada.Text_IO.Put("Enter an integer, to exit enter -1: ");
	      Ada.Integer_Text_IO.Get(Item => Value);
			case Value is
				when 90..100 =>
					Scores(1) := Scores(1) + 1;
				when 80..89 =>
					Scores(2) := Scores(2) + 1;
				when 70..79 =>
					Scores(3) := Scores(3) + 1;
				when 60..69 =>
					Scores(4) := Scores(4) + 1;
				when others =>
					Scores(5) := Scores(5) + 1;
			end case;

		Num_Scores := Num_Scores + 1;
		end loop;

		Put_Line(Item => "There were" &
	   	Integer'Image(Num_Scores) &
	   	" values entered.");

	end Get_Scores;

	--local variables
	Scores : Score_Array_Type;
	Num_Scores : Natural;

begin --Moberg_C_Lab_9
	Get_Scores(Num_Scores => Num_Scores,Scores => Scores);
	Put_Line(Item => "There were" & Integer'Image(Scores(1)) & " A's.");
	Put_Line(Item => "There were" & Integer'Image(Scores(2)) & " B's.");
	Put_Line(Item => "There were" & Integer'Image(Scores(3)) & " C's.");
	Put_Line(Item => "There were" & Integer'Image(Scores(4)) & " D's.");
	Put_Line(Item => "There were" & Integer'Image(Scores(5)) & " F's.");
end Moberg_C_Lab_9;

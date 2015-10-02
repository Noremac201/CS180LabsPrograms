with Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Integer_Text_IO;
use Ada.Text_IO;

procedure Loop_Experiments is

   -------------------------------------------------------
   -- A program to experiment with count-controlled loops.
   -- Input: First and Last iteration number.
   -- Output: That many iterations, ex. 1-100.
   -- Written by Bob Matthews
   -- Modified by Cameron Moberg
   -- Date: 9/17/2015
   -------------------------------------------------------

   -- The loop control variable (LCV).
   Count : Natural;

   -- Counts the number of iterations.  Note that this is *not*
   -- the LCV.
   N_Iterations : Natural;

   --Sets last iteration.
   Count_Max : Natural;

begin -- Moberg_C_Lab_5

   -- Prompt for and Initialize the LCV.
   Put (Item => "Enter starting iteration: ");
   Get (Item => Count);

   --Prompt for and Initalize the last iteration.
   Put (Item => "Enter final iteration: ");
   Get (Item => Count_Max);

   -- Initialize the iteration counter.
   N_Iterations := 0;

   -- Test condition and begin loop if True.
   while Count <= Count_Max loop

      N_Iterations := N_Iterations + 1;

      Put (Item => "On iteration ");
      Put (
         Item  => N_Iterations,
         Width => 0);
      Put (Item => " the loop control variable had a value of ");
      Put (
         Item  => Count,
         Width => 0);
      Put_Line (Item => ".");

      -- Increment the LCV.
      Count := Count + 1;
   end loop;

end Moberg_C_Lab_5;

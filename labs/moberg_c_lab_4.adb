with Ada.Text_IO;

procedure moberg_c_lab_4 is

   -------------------------------------------------------------------
   -- A program to demonstrate the use of enumeration types
   -- and enumeration IO
   -- Written by Alan Garvey (with ideas from Jon Beck)
   -- Modified by:  Cameron Moberg
   -- Date: 9/10/2015
   -- Input: Month
   -- Output: Preceding and Succeding Month, as well as
   -- the month itself with the season.
   -------------------------------------------------------------------

   -- An enumeration type for month
   type Month_Type is
         (January,
          February,
          March,
          April,
          May,
          June,
          July,
          August,
          September,
          October,
          November,
          December);

   type Season_Type is
         (Winter,
         Spring,
         Summer,
         Fall);

   -- Instantiate a package from the existing template package
   -- Ada.Text_IO.Enumeration_IO
   -- so we can do IO for the new type.
   package Month_IO is new Ada.Text_IO.Enumeration_IO
      (Enum => Month_Type);
   package Season_IO is new Ada.Text_IO.Enumeration_IO
      (Enum => Season_Type);

   -- Declare variables for storing month values
   This_Month : Month_Type; -- input by the user
   Last_Month : Month_Type;
   Next_Month : Month_Type;
   Season : Season_Type;

begin -- moberg_c_lab_4

   -- Prompt user to enter a month.
   Ada.Text_IO.Put (Item => "Enter the name of a month: ");
   Month_IO.Get (Item => This_Month);

   -- Echo the month entered by the user.
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put (Item => "The month you entered was ");
   Month_IO.Put (Item => This_Month);
   Ada.Text_IO.Put_Line (Item => ".");

   -- Determine and print next month.
   --If Statement sets next month to Jan for Dec.
   if This_Month = Month_Type'Val(11) then
      Next_Month := Month_Type'Val(0);
   else
      Next_Month := Month_Type'Succ (This_Month);
   end if;
   Ada.Text_IO.Put (Item => "The next month will be ");
   Month_IO.Put (Item => Next_Month);
   Ada.Text_IO.Put_Line (Item => ".");

   -- Determine and print previous month.
   -- If statement sets last month to Dec for Jan.
   if This_Month = Month_Type'Val(0) then
      Last_Month := Month_Type'Val(11);
   else
      Last_Month := Month_Type'Pred (This_Month);
   end if;
   Ada.Text_IO.Put (Item => "The previous month was ");
   Month_IO.Put (Item => Last_Month);
   Ada.Text_IO.Put_Line (Item => ".");

   --Determine Season
   if This_Month < Month_Type'Val(2) or This_Month = Month_Type'Val(11) then
     Season := Winter;
   elsif This_Month < Month_Type'Val(5) then
     Season := Spring;
   elsif This_Month < Month_Type'Val(8) then
     Season := Summer;
   else
     Season := Fall;
   end if;
   --Output Season
   Ada.Text_IO.Put (Item => "The season is ");
   Season_IO.Put (Item => Season);
   Ada.Text_IO.Put_Line (Item => ".");

end moberg_c_lab_4;

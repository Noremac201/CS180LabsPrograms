with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Moberg_C_Lab_8 is

   -------------------------------------------------------------------------
   --
   -- A program to jumble the characters in a sentence.
   -- Input: a sentence
   -- Output: A modified sentence based on chars.
   -- Written by Bob Matthews
   -- Modified by Kerrin Smith
   -- Further Modified by: Cameron Moberg
   -- Date: 10/08/2015
   -- THURSDAY
   -------------------------------------------------------------------------

   -- Maximum length of the sentence the program can handle
   -- Note: This is a global constant, not a global variable, so it is
   -- okay since it cannot be changed.

   Max_Sentence_Length : constant Integer := 80;


   function To_Lower ( C : in Character) return Character is

      --  This function converts the uppercase character C
      --  to its lowercase equivalent. Results are undefined if
      --  the parameter C is not an uppercase letter.

      -- The distance between uppercase and lowercase letters in the
      -- ASCII character set.

      Case_Distance : constant Integer := 32;

      Upper_Position : Natural;
      Lower_Position : Natural;
      Lower          : Character;

   begin -- To_Lower

      Upper_Position := Character'Pos (C);
      Lower_Position := Upper_Position + Case_Distance;
      Lower := Character'Val (Lower_Position);

      return Lower;

   end To_Lower;

   function To_Upper( C : in Character) return Character is

      --  This function converts the lowercase character C
      --  to its uppercase equivalent. Results are undefined if
      --  the parameter C is not a lowercase letter.

      -- The distance between uppercase and lowercase letters in the
      -- ASCII character set.

      Case_Distance : constant Integer := 32;

      Upper_Position : Natural;
      Lower_Position : Natural;
      Upper : Character;

   begin -- To_Upper

      Lower_Position := Character'Pos (C);
      Upper_Position := Lower_Position - Case_Distance;
      Upper := Character'Val (Upper_Position);

      return Upper;

   end To_Upper;

   function Unpunctuate (C : in Character) return Character is
       Punct : Integer;
       Punctuation : Character;
    begin --Unpunctuate

       case Character'Pos(C) is
          --ASCII CODES for Period, Comma, and Question Mark
          when 46 | 44 | 63 =>
             Punct := 33; --ascii for !
          when 48..57 => --ascii for 0..9
             Punct := 36; --ascii for $
          when others =>
             -- returns characters to orignial position
             Punct := Character'Pos(C);
      end case;

      Punctuation := Character'Val (Punct);
      return Punctuation;

    end Unpunctuate;



   -- Main variables
   Sentence : String (1 .. Max_Sentence_Length);
   Sentence_Length : Integer range 0 .. Max_Sentence_Length;
   Current_Char : Character;

begin -- Lab_8

   -- Prompt for input sentence and then read it.
   Put ("Enter a sentence (");
   Put ( Item  => Max_Sentence_Length,
         Width => 1);
   Put (" characters max): ");
   Get_Line (Item => Sentence,
             Last => Sentence_Length);

   -- Process the sentence, one character at time.
   for I in 1 .. Sentence_Length loop

      Current_Char := Sentence(I);
      if Current_Char >= 'A' and Current_Char <= 'Z' then
         Sentence(I) := To_Lower(Current_Char);
      elsif Current_Char >= 'a' and Current_Char <= 'z' then
         Sentence(I) := To_Upper(Current_Char);
      else
         Sentence(I) := Unpunctuate(Current_Char);
      end if;
   end loop;

   -- Print out the converted sentence.
   Put_Line (Sentence(1 .. Sentence_Length));

end Moberg_C_Lab_8;

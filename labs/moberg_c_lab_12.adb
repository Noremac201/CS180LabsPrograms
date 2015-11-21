with Ada.Text_IO;
use Ada.Text_IO;

procedure moberg_c_lab_12 is

  function Suffix (String_1 : in String;
                   String_2 : in String) return String is
    begin --Suffix
      if String_1'Length = 0 or String_2'Length = 0 then
        return "";
      elsif String_1(String_1'Last) /= String_2(String_2'Last) then
        return "";
      else
	      return Suffix(String_1 => String_1(String_1'First..String_1'Last - 1),
	      		    String_2 => String_2(String_2'First..String_2'Last - 1)) &
			    String_1(String_1'Last);
      end if;



    end Suffix;

    String_1 : String(1..15);
    String_1_Last : Positive;
    String_2 : String(1..15);
    String_2_Last : Positive;

  begin --moberg_c_lab_12
    Ada.Text_IO.Put (Item => "Enter the first string: ");
    Ada.Text_IO.Get_Line (Item => String_1, Last => String_1_Last);
    Ada.Text_IO.Put (Item => "Enter the second string: ");
    Ada.Text_IO.Get_Line (Item => String_2, Last => String_2_Last);
    Put_Line (Item => "The Suffix is " &
              Suffix (String_1 => String_1(1..String_1_Last),
                      String_2 => String_2(1..String_2_Last)));
end moberg_c_lab_12;

------------------------------------
--Program: Moberg_C_Program_3
--Input - A date in dd/mm/yyyy format.
--Output - What day of the week it is.
--Assumptions - Entered in dd/mm/yyyy format.
--Created by : Cameron Moberg
--Date /04/10/2015/
-------------------------------------
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
procedure Moberg_C_Program_3 is
  Weekday : Integer;
  Day : Integer;
  Month : Integer;
  Year : Integer;

    procedure Fix_Date is

    begin --Fix_Date
      if Month < 3 then
        Year := Year - 1;
        Month := Month + 10;
      else
        Month := Month - 2;
      end if;

    end Fix_Date;

    procedure Get_Date is
      Day_S : String(1..2);
      Month_S : String(1..2);
      Year_S : String(1..4);
      Max_Days : Integer;
      Date : String(1..10);

    begin --Get_Date
      Ada.Text_IO.Put (Item => "What date is it in dd/mm/yyyy format? ");
      Ada.Text_IO.Get (Item => Date);
      Day_S := (Date(1..2));
      Month_S := (Date(4..5));
      Year_S := (Date(7..10));

      --Put_Line (Date (Date'First..Date'First));
      Day := Integer'Value(Day_S);
      Month := Integer'Value(Month_S);
      Year := Integer'Value(Year_S);

      --check leap year, and set month days
      if Month = 2 then
        if Year rem 4 = 0 and Year rem 400 = 0 then
          Max_Days := 29;
        elsif Year rem 4 = 0 and Year rem 100 /= 0 then
          Max_Days := 29;
        else
          Max_Days := 28;
        end if;
      elsif Month = 4 or Month = 6 or Month = 9 or Month = 11 then
        Max_Days := 30;
      else
        Max_Days := 31;
      end if;

      if Day > Max_Days or Month > 12 or Year > 2100 or Year < 1700
      or Day < 1 or Month < 1 then
        Ada.Text_IO.Put (Item => "Please re-enter a valid date!");
        New_Line;
        Get_Date;
      end if;

    end Get_Date;

    function Day_Of_Week (Day, Month, Year: Integer)
                           return Integer is
      D : Integer := Day;
      M : Integer := Month;
      C : Integer := Year / 100;
      Y : Integer := Year rem 100;

    begin --Day_Of_Week
      Weekday := ((26*M-2)/10 + D + Y + Y/4 + C/4 - 2*C) mod 7;
      return Weekday;

    end Day_Of_Week;

    procedure Output_Day_Of_Week is
      type Day is (Sunday,
                    Monday,
                    Tuesday,
                    Wednesday,
                    Thursday,
                    Friday,
                    Saturday);
      package Day_IO is new Ada.Text_IO.Enumeration_IO(Enum => Day);

    begin -- Output_Day_Of_Week
      Day_IO.Put(Day'Val(Weekday));
    end Output_Day_Of_Week;

begin -- Moberg_C_Program_3
  Get_Date;
  Fix_Date;
  Weekday := Day_Of_Week(Day, Month, Year);
  Output_Day_Of_Week;
end Moberg_C_Program_3;

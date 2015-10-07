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

    procedure Get_Date (Day, Month, Year : out Integer) is
      Max_Days : Integer;
      Slash : Character;
    begin --Get_Date
      Ada.Text_IO.Put (Item => "What date is it in dd/mm/yyyy format? ");
      Ada.Integer_Text_IO.Get (Item => Day);
      Ada.Text_IO.Get (Slash);
      Ada.Integer_Text_IO.Get (Item => Month);
      Ada.Text_IO.Get (Slash);
      Ada.Integer_Text_IO.Get (Item => Year);
      --check leap year, and set month days
      case Month is
        when 2 =>
          if Year rem 4 = 0 and Year rem 400 = 0 then
            Max_Days := 29;
          elsif Year rem 4 = 0 and Year rem 100 /= 0 then
            Max_Days := 29;
          else
            Max_Days := 28;
          end if;
        when 4 | 6 | 9 | 11 =>
          Max_Days := 30;
        when 1 | 3 | 5 | 7 | 8 | 10 | 12 =>
          Max_Days := 31;
        when others =>
          null;
      end case;
      -- this is to check validity of date, recursivley calls it if fails.
      if Day > Max_Days or Month > 12 or Year > 2100 or Year < 1700
      or Day < 1 or Month < 1 then
        Ada.Text_IO.Put (Item => "Please re-enter a valid date!");
        New_Line;
        Get_Date(Day,Month,Year);
      end if;
    end Get_Date;

    procedure Fix_Date (Month, Year: in out Integer) is
    begin --Fix_Date
      if Month < 3 then
        Year := Year - 1;
        Month := Month + 10;
      else
        Month := Month - 2;
      end if;
    end Fix_Date;

    procedure Day_Of_Week (Day, Month, Year: in Integer; Weekday : out Integer) is
      D : Integer := Day;
      M : Integer := Month;
      C : Integer := Year / 100;
      Y : Integer := Year rem 100;

    begin --Day_Of_Week
      Weekday := ((26*M-2)/10 + D + Y + Y/4 + C/4 - 2*C) mod 7;
    end Day_Of_Week;

    procedure Output_Day_Of_Week(Weekday: in Integer) is
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
  Weekday : Integer;
  Day : Integer;
  Month : Integer;
  Year : Integer;
begin -- Moberg_C_Program_3
  Get_Date(Day,Month,Year);
  Fix_Date(Month,Year);
  Day_Of_Week(Day, Month, Year,Weekday);
  Output_Day_Of_Week(Weekday);
end Moberg_C_Program_3;

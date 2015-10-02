with Ada.Text_IO;

procedure Moberg_Lab_1 is

   --Author: Cameron Moberg
   --Date: August 20th, 2015
   --Class: CS180
   Name : String (1..32);
      Name_Length : Integer;

begin -- Moberg Lab 1
   --prompt user for name
   Ada.Text_IO.Put(Item=>"What is your first name? ");
   Ada.Text_IO.Get_Line(
      Item=>Name,
      Last=>Name_Length);

   --Display greeting

   Ada.Text_IO.Put(Item=>"Hello ");
   Ada.Text_IO.Put(Item=> Name(1..Name_Length));
   Ada.Text_IO.Put(Item=>"!");
   Ada.Text_IO.New_Line;
end Moberg_Lab_1;

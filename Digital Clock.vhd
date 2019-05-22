library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity project1 is
port(clk:in bit;rst:in bit;hh2:in integer;mm2:in integer;buzz:out bit;hour:out integer;minute:out integer;second:out integer);
end project1;

architecture Behavioral of project1 is
signal hh,mm,ss:integer:=0;
begin
process (clk,rst) is
begin
if rst='1' then
hh<=0;
mm<=0;
ss<=0;
else
if clk'event and clk='1' then
ss<=ss+1;
if ss=59 then
mm<=mm+1;
ss<=0;
if mm=59 then
hh<=hh+1;
mm<=0;
end if;
end if;
end if;
end if;
end process;
process (hh,mm)
begin
if hh=hh2 and mm=mm2 then
buzz<='1';
else
buzz<='0';
end if;
end process;
second<=ss;
minute<=mm;
hour<=hh;
end Behavioral;

entity project1tb is
end project1tb;

architecture behavioraltb of project1tb is
component project1 is
port(clk:in bit;rst:in bit;hh2:in integer;mm2:in integer;buzz:out bit;hour:out integer;minute:out integer;second:out integer);
end component;
signal sec,min,hr,hh3,mm3:integer;
signal buzz1,clk1,reset:bit;
begin
x1:project1 port map(clk1,reset,hh3,mm3,buzz1,hr,min,sec);
process is
begin
clk1<='0';
wait for 1 ns;
clk1<='1';
wait for 1 ns;
end process;
process is
begin
--reset<='1';
--Wait for 5 ns;
reset<='0';
Wait for 25 ns; --for alarm generation
hh3<=0;mm3<=3;
wait for 2 ns;
--hh3<=0;mm3<=0;
--wait for 10 ns;
end process;
--process is
--begin
--reset<=0;
--wait for 2 ns;
--end process;
end behavioraltb;

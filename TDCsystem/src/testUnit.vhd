----------------------------------------------------------------------------------
-- Basic fast blinker for TDC dead-test.
-- Version: 1.1
--
-- Author: Michel Adamic
-- Created: 13.6.2019
-- Modified: 13.6.2019
-- 13.11.2019 -> top 4 bits, very high frequency
--
-- "If you don't have a function generator, make your own!"
--
-- Simple counter-based blinker. Runs on 350 MHz.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testUnit is
   generic (
      BITS : integer := 4  -- MAX frequency
   );
   Port ( 
      clk : in STD_LOGIC;
      testOut: out std_logic_vector(3 downto 0);   -- 4-bit wide output
      testLED: out std_logic_vector(3 downto 0)
   );
end testUnit;

architecture RTL of testUnit is
   signal count : unsigned(BITS-1 downto 0) := (others => '0');
   
begin
   process(clk)
   begin
      if rising_edge(clk) then
         count <= count + 1;
      end if;
   end process;
   
   testOut <= std_logic_vector(count(count'high downto count'high-3));  -- top 4 bits
   testLED <= std_logic_vector(count(count'high downto count'high-3));
   
end RTL;

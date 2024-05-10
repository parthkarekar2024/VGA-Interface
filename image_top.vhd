----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2024 01:36:33 PM
-- Design Name: 
-- Module Name: image_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity image_top is
Port ( 

clk: in std_logic;
vga_r, vga_b: out std_logic_vector (4 downto 0);
vga_g: out std_logic_vector (5 downto 0);
vga_hs, vga_vs: out std_logic

);
end image_top;

architecture Behavioral of image_top is

component clock_div is 

port (

clk: in std_logic;
en: out std_logic 

);
end component; 

component vga_ctrl is 

port(

clk, en: in std_logic; 
HS, VS, Vid: out std_logic;
hcount: out std_logic_vector (9 downto 0);
vcount: out std_logic_vector (9 downto 0)

);

end component; 

component pixel_pusher is 

port (

clk, en, VS, vid: std_logic;
pixel :in std_logic_vector (7 downto 0);
hcount: std_logic_vector (9 downto 0);
R, B: out std_logic_vector (4 downto 0);
G: out std_logic_vector (5 downto 0); 
addr: out std_logic_vector (17 downto 0)

);

end component; 

component picture is 

port(
clka : IN STD_LOGIC;
addra : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

);

end component;


signal en_i: std_logic;
signal HS_i, VS_i, Vid_i: std_logic;
signal hcount_i, vcount_i: std_logic_vector (9 downto 0);
signal pixel_i: std_logic_vector (7 downto 0);
signal R_i: std_logic_vector (4 downto 0);
signal B_i: std_logic_vector (4 downto 0);
signal G_i: std_logic_vector (5 downto 0);
signal addr_i: std_logic_vector (17 downto 0);

begin

U1: clock_div 
port map (

clk => clk,
en => en_i

);

U2: vga_ctrl 

port map (

en => en_i,
clk => clk,
HS => HS_i,
VS => VS_i,
Vid => Vid_i,
hcount => hcount_i,
vcount => vcount_i

);

U3: pixel_pusher 

port map (
clk => clk,
en => en_i,
VS => VS_i,
vid => vid_i,
pixel => pixel_i,
hcount => hcount_i,
R => R_i,
G => G_i,
B => B_i,
addr => addr_i

);

U4: picture 

port map (

clka => clk,
addra => addr_i,
douta => pixel_i

);




vga_r <= R_i;
vga_g <= G_i;
vga_b <= B_i;
vga_hs <= HS_i;
vga_vs <= VS_i;
end Behavioral;

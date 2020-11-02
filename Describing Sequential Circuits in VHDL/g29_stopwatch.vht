-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/03/2019 12:35:51"
                                                            
-- Vhdl Test Bench template for design  :  g29_stopwatch
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g29_stopwatch_vhd_tst IS
END g29_stopwatch_vhd_tst;
ARCHITECTURE g29_stopwatch_arch OF g29_stopwatch_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL start : STD_LOGIC;
SIGNAL stop : STD_LOGIC;

COMPONENT g29_stopwatch
	PORT (
	clock : IN STD_LOGIC;
	HEX0 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	reset : IN STD_LOGIC;
	start : IN STD_LOGIC;
	stop : IN STD_LOGIC
	);
END COMPONENT;

constant clk_p : time := 10 ns;

BEGIN
	i1 : g29_stopwatch
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	reset => reset,
	start => start,
	stop => stop
	);

clk_prc : PROCESS                                               
BEGIN  
   
	clock <= '0';
	wait for clk_p/2;
	clock <= '1';
	wait for clk_p/2;  
                                                                                                            
END PROCESS clk_prc;  
                                         
stimu : PROCESS                                              
BEGIN  
      --begin with all buttons off
      reset <= '1';
		start <= '1';
		stop <= '1';
		wait for clk_p;
		reset <= '0';
		wait for 2*clk_p;
		
		--begin count for 110centi-seconds
		reset <= '1';
		wait for clk_p;
		start <= '0';
		wait;                                             
                                                      
END PROCESS stimu;
                                          
END g29_stopwatch_arch;

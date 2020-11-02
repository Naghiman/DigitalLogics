-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/02/2019 17:39:31"
                                                            
-- Vhdl Test Bench template for design  :  clockDivider_g29
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY clockDivider_G29_vhd_tst IS
END clockDivider_G29_vhd_tst;
ARCHITECTURE clockDivider_G29_arch OF clockDivider_G29_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL en_out : STD_LOGIC;
SIGNAL enable : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT clockDivider_g29
	PORT (
	clk : IN STD_LOGIC;
	en_out : OUT STD_LOGIC;
	enable : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;

constant CLOCK_PERIOD : time := 20 ns;

BEGIN
	i1 : clockDivider_G29
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	en_out => en_out,
	enable => enable,
	reset => reset
	);
clock : PROCESS                                                                                   
BEGIN                                                        
      clk <= '0';
		wait for CLOCK_PERIOD/2;
		
		clk <= '1';
		wait for CLOCK_PERIOD/2;
		
                                                      
END PROCESS clock;
                                           
simulation : PROCESS                                                                                    
BEGIN                                                         
        reset  <= '0';
		  enable <= '1';
		  wait for 100 ns;
		  reset  <= '1';
		  wait for 100 ms;
WAIT;                                                        
END PROCESS simulation;                                          
END clockDivider_G29_arch;


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
-- Generated on "03/26/2019 13:16:28"
                                                            
-- Vhdl Test Bench template for design  :  g29_counter
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g29_counter_vhd_tst IS
END g29_counter_vhd_tst;
ARCHITECTURE g29_counter_arch OF g29_counter_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock 		: STD_LOGIC;
SIGNAL count 	: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL enable 	: STD_LOGIC;
SIGNAL reset 	: STD_LOGIC;

-- define the period of clock here.
constant CLK_PERIOD : time := 20 ns;

COMPONENT g29_counter
	PORT (
	clock  : IN 	 STD_LOGIC;
	count	 : OUT 	 STD_LOGIC_VECTOR(3 DOWNTO 0);
	enable : IN 	 STD_LOGIC;
	reset  : IN 	 STD_LOGIC
	);
END COMPONENT;

BEGIN
	i1 : g29_counter
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	count => count,
	enable => enable,
	reset => reset
	);
	clk_process : PROCESS
BEGIN                                               
	clock <= '0';
	wait for CLK_PERIOD/2;
	clock <= '1';
	wait for CLK_PERIOD/2;
	end process clk_process;
	stim_proc   : PROCESS 
BEGIN        
		 reset  <= '0';
		 enable <= '1';
		 wait for CLK_PERIOD*2;
		 enable  <= '1';
		 reset   <= '1';
		 wait for CLK_PERIOD*20;
  end process stim_proc;                                         
END g29_counter_arch;

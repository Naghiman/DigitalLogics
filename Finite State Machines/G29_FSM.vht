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
-- Generated on "04/06/2019 20:17:33"
                                                            
-- Vhdl Test Bench template for design  :  G29_FSM
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY G29_FSM_vhd_tst IS
END G29_FSM_vhd_tst;
ARCHITECTURE G29_FSM_arch OF G29_FSM_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL count : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL direction : STD_LOGIC;
SIGNAL enable : STD_LOGIC;
SIGNAL reset : STD_LOGIC;

constant CLK_PERIOD : time := 20 ns;

COMPONENT G29_FSM
	PORT (
	clk : IN STD_LOGIC;
	count : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	direction : IN STD_LOGIC;
	enable : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : G29_FSM
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	count => count,
	direction => direction,
	enable => enable,
	reset => reset
	);
clk_process : PROCESS                                                                                    
BEGIN                                                        
     clk <= '0';
	wait for CLK_PERIOD/2;
	clk <= '1';
	wait for CLK_PERIOD/2;
	end process clk_process;  
	
stim_proc : PROCESS                                                                                  
BEGIN                                                         
        reset <= '0';
	enable <= '1';
	wait for 20 ns;
	reset <= '1';
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
	reset <= '0';
	enable <= '1';
	wait for 20 ns;
	reset <= '1'; 
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '0';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		  direction <= '1';
		  wait for 20 ns;
		                                                        
END PROCESS stim_proc;                                          
END G29_FSM_arch;

--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   
-- Design Name:   
-- Module Name:   tb_FSM.vhd
-- Project Name:  FSM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_FSM IS
END tb_FSM;
 
ARCHITECTURE behavior OF tb_FSM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         a : IN  std_logic;
         b : IN  std_logic;
         fsm_out : OUT  std_logic;
         main : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal a : std_logic := '0';
   signal b : std_logic := '0';

 	--Outputs
   signal fsm_out : std_logic;
   signal main : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          clk => clk,
          reset => reset,
          a => a,
          b => b,
          fsm_out => fsm_out,
          main => main
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	

      --wait for clk_period*1;

      -- insert stimulus here
			reset <= '1';
			a <= '0';
			b <= '0';
			wait for 20 ns;
			
			---- test 1
			reset <= '0';
			a <= '1';
			b <= '0';
			wait for 10 ns;
			
			a <= '0'; wait for 10 ns;
			a <= '1'; wait for 10 ns;
			 
			 --test 2
			 a <= '0'; wait for 10 ns;
			 b <= '1'; wait for 5 ns;
			 a <= '1'; wait for 5 ns;
			 
			 wait for 50 ns;	

      wait;
   end process;

END;

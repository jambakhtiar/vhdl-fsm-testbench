----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    FSM 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
	port(
		clk : in std_logic;
		reset : in std_logic;
		a : in std_logic;
		b : in std_logic;
		fsm_out: out std_logic;
		main : out std_logic_vector(2 downto 0)
	);
end FSM;


architecture Behavioral of FSM is

-- defination of the states
type state_type is (idle, proc_1, halt, final);
signal current_state, next_state : state_type;

begin
	-- process 1: state register
	proc1: process(clk, reset) begin
		if reset = '1' then
			current_state <= idle;
		elsif(rising_edge(clk)) then
			current_state <= next_state;
		end if;
	end process;
	
	--process 2: next state logic and output logic
	proce2: process(a, b, current_state) 
		begin
			next_state <= current_state;
			fsm_out <= '0';
			main <= "000";
			
			case current_state is
				when idle =>
					fsm_out <= '1';
					main <= "000";
					if (a = '1') then
						next_state <= proc_1;
					elsif (a='0' and b='1') then
						next_state <= halt;
					end if;
					
				
				when proc_1 =>
					fsm_out <= '0';
					main <= "100";
					if a='0' then
						next_state <= halt;
					end if;
					
				
				when halt =>
					fsm_out <= '0';
					main <= "010";				
					if a='0' then
						next_state <= halt;
					elsif a = '1' then
						next_state <= final;
					end if;
					
					
				when final =>
					next_state <= idle;
					fsm_out <= '1';
					main <= "001";
					
				when others =>
					next_state <= idle;
					fsm_out <= '0';
					main <= "000";
				
			end case;
							
		end process;

end Behavioral;


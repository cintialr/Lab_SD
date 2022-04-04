--****************************************--
-- Testbench para sumulacao Funcional
-- 		Multiplexador 4 x 1 :
-- 		S(S1,S0) entradas seletoras com 2 bits
--		D0	entrada => 	S = 00;
--		D1	entrada => 	S = 01;
--		D2 	entrada => 	S = 10;
--		D3 	entrada => 	S = 11;
--		Y 	 saida;
--*********************************************--

-- Entity (entidade)
-- testbench uma entidade sem pinos de entradas e saidas

entity tb_mult4x1 is end;

-- Testbench para mult4x1.vhd
-- Validacao sincrona 

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.ALL;

-- architecture (arquitetura)

architecture mult4x1_tb of tb_mult4x1 is
---- Declaracao do componente mult4x1
component mult4x1 port(
	S	:in std_logic_vector (1 DOWNTO 0);	
	D0	:in std_logic;
	D1	:in std_logic;
	D2	:in std_logic;
	D3	:in std_logic;
	Y	:out std_logic);
end component;

-- sinais de entradas:
signal D0 : std_logic;
signal D1 : std_logic;
signal D2 : std_logic;
signal D3 : std_logic;
signal S : std_logic_vector (1 DOWNTO 0);

--sinal de saida:
signal Y : std_logic;

Begin

multiplex1: mult4x1 PORT MAP(S  => S,
							 D0 => D0,
							 D1 => D1,
							 D2 => D2,
							 D3 => D3,
							 Y  => Y);

-- Implementacao para o estimulo 
estimulo: PROCESS
	begin -- inicio do processo estimulo
		D0 <= '1';		-- p/ S="00"
		D1 <= '0';		-- D0='1',como Y=D0 logo Y=1;
		D2 <= '0';
		D3 <= '0';
		S  <= "00";		
		wait for 20 ns;
		D0 <= '0';		-- p/ S="01" 
		S <= "01";		-- D0='0' e D1='1',
		D1 <= '1';		-- Y = D1;
		wait for 20 ns;
		D1 <= '0';		-- p/ S="10"
		S <= "10";		-- D1='0' e D2='1',
		D2 <= '1';		-- Y = D2;
		wait for 20 ns;
		D2 <= '0';		-- p/ S="11"
		S <= "11";		-- D2='0' e D3='1'
		D3 <= '1';		-- Y = D3.
		wait for 20 ns;
		wait;	-- parando o processo
end process;
end mult4x1_tb;


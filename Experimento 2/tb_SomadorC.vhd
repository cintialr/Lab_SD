--*****************************************************
-- Testbench para sumulacao Funcional
-- do Somador Completo com 3 entradas 2 duas saidas:
-- 			A 	 entrada 1
--			B 	 entrada 2
-- 			Cin  entrada 3	(vem um)
--			S	 saida   1  (saida A+B)
--			Cout saida   2  (vai um)
--*****************************************************

-- Entity (entidade)
-- testbench uma entidade sem pinos de entradas e saidas

entity testbench is end;

-----------------------------------
-- Testbench para SomadorC.vhd
-- Validacao assincrona
-----------------------------------
library IEEE;
use IEEE.std_logic_1164.ALL;
use std.textio.ALL;

-- architecture (arquitetura)
architecture tb_soma of testbench is

-- declaracao de componetes e sinais auxiliares para 
-- a interconexao ao processo de estimulo.

component SomadorC port (
	A		:in std_logic;
	B		:in std_logic;
	Cin		:in std_logic;
	S		:out std_logic;
	Cout	:out std_logic);
end component;

signal i_1 : std_logic;
signal i_2 : std_logic;
signal i_3 : std_logic;

-- Instancia do componente SomadorC e interconexao do 
--componente ao processo de estimulo.

begin 

soma: SomadorC port map(A => i_1, B => i_2, Cin => i_3,
	  S => open, Cout => open);

-- Implementacao do processo de estimulo.
estimulo: process 

begin
	wait for 5 ns; i_1 <= '0'; i_2 <= '0'; i_3 <= '0';
	wait for 5 ns; i_1 <= '1';
	wait for 5 ns; i_2 <= '1';
	wait for 5 ns; i_1 <= '0';
	wait for 5 ns; i_3 <= '1';
	wait for 5 ns; i_1 <= '1';
	wait for 5 ns; i_2 <= '0';
	wait for 5 ns; i_1 <= '0';
	wait;
	
end process estimulo;
end tb_soma;
	





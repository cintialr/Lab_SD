-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 21/10/2020
--*********************************************************
--			Testbench p/ Visto 1 experimento 6
--					Flip flop JK
--*********************************************************

-- Entity (entidade)
-- testbench uma entidade sem pinos de entradas e saidas
entity testbenchEx6v1 is end;

-- Testbench para Exp6v1.vhd
-- package
library IEEE ;
use IEEE.STD_LOGIC_1164.all;
use std.textio.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- architecture (arquitetura)
architecture tb_Exp6v1 of testbenchEx6v1 is
-- declaracao do componente Exp6v1	
component Exp6v1 port(
	PR, CLR, CLK, J, K : in std_logic;
	Q : out std_logic);
end component;

-- implementacao dos sinais auxiliares
signal input : std_logic_vector (3 downto 0) := "0000";
signal CLK	 : std_logic;

--input(3) = PR;
--input(2) = CLR;
--input(1) = J;
--input(0) = K.
begin 
	Visto1 : Exp6v1 port map(input(3), input(2), CLK,
							 input(1), input(0), open);
	
	--clock com periodo de 10 ns;
	clock: process
		begin 
			CLK <= '0';
			wait for 10 ns;
			CLK <= '1';
			wait for 10 ns;
		end process;
		
	estimulo: process 	--processo de estimulo dos sinais
		begin
			for i in 0 to 15 loop -- inicio do loop;
				wait for 20 ns; 
				input <= unsigned(input) + 1; -- incrementando os sinais de A e B;
			end loop; -- fim do loop;
		end process;
end tb_Exp6v1;
-- a definicao termina por end

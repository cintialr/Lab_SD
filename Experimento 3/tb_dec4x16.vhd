-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/09/2020

--*********************************************--
-- Testbench para simulacao Funcional
-- 		Decodificador 4 x 16 :
--		En Habilita a saida,
--		A(A0, A1, A2, A3) entrada com 4 bits,
--		Y(Y0, y1,..., Y15) saida com 16 bits;
--*********************************************--

-- Entity (entidade)
-- testbench uma entidade sem pinos de entradas e saidas
entity testbench4x16 is end;

-- Testbench para dec4x16.vhd
-- Validacao sincrona 
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
use std.textio.all; 

-- architecture (arquitetura)
architecture tb_dec4x16 of testbench4x16 is 

-- declaracao do componente dec4x16
component dec4x16 port (	
--		En :in std_logic; -- habilita a saida.
		A : in std_logic_vector(0 to 3);
		y : out std_logic_vector (0 to 15) );
end component;

-- implementacao dos sinais auxiliares
--signal tb_En	: std_logic;
signal tb_A 	: std_logic_vector(0 to 3);
 
begin
decoder1: dec4x16 port map(
						A  => tb_A,
	--					En => tb_En,
						Y => open );

-- Implementacao para o estimulo 
estimulo: process
	begin -- inicio do processo estimulo
		tb_A <= "0000";		-- A = "0000",
		--tb_En <= '0';		
-- En = '0', as entradas ainda estao desabilitadas
		wait for 20 ns;
		--tb_En <= '1';
-- En = 1,as saidas foram ativadas 
		loop
		-- para A eh acrescentado 1 
		-- até A = "1111" "
			tb_A <= tb_A + '1';	
			wait for 20 ns;
		end loop;
	end process;
end tb_dec4x16;


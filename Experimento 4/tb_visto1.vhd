-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 18/09/2020

--****************************************--
-- Testbench para simulacao Funcional
-- 	para 2 Multiplexador 4 x 1 :
-- 			A, B, C ->  entradas
--			X, Y 	-> 	saidas
--*********************************************--

-- Entity (entidade)
-- testbench uma entidade sem pinos de entradas e saidas

entity testbench2mux4x1 is end;

-- Testbench para visto1.vhd
-- Validacao sincrona 

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.ALL;

-- architecture (arquitetura)
architecture tb_visto1 of testbench2mux4x1 is 

--Declaracao do componente visto1.vhd
component visto1 is port(
		  A		:in std_logic;
		  B		:in std_logic;
		  C		:in std_logic;	  
		  X     :out std_logic;
		  Y     :out std_logic);
end component;

--Sinais auxiliares
signal tb_A : std_logic;
signal tb_B : std_logic;
signal tb_C : std_logic;
signal X	: std_logic;
signal Y	:std_logic;

begin

	U: visto1 port map(tb_A, tb_B, tb_C, X, Y);

-- Implementacao para o estimulo 
	estimulo: PROCESS
		begin -- inicio do processo estimulo
		tb_A <= '0'; tb_B <= '0'; tb_C <= '0';
		wait for 5 ns; tb_A <= '0'; tb_B <= '0'; tb_C <= '1';
		wait for 5 ns; tb_A <= '0'; tb_B <= '1'; tb_C <= '0';
		wait for 5 ns; tb_A <= '0'; tb_B <= '1'; tb_C <= '1';
		wait for 5 ns; tb_A <= '1'; tb_B <= '0'; tb_C <= '0';
		wait for 5 ns; tb_A <= '1'; tb_B <= '0'; tb_C <= '1';
		wait for 5 ns; tb_A <= '1'; tb_B <= '1'; tb_C <= '0';
		wait for 5 ns; tb_A <= '1'; tb_B <= '1'; tb_C <= '1';
		wait for 5 ns;
		wait;
end process estimulo;
end tb_visto1;
-- a definicao termina por end.

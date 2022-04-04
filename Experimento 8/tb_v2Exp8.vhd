-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/11/2020

--********************************************************--
-- Testbench para a simulação funcional do circuito:
--			Experimento 8 - visto 2
--********************************************************--

-- Entity (entidade)
-- testbench uma entidade sem pinos de entradas e saidas
entity testbenchEx8v2 is end;
-- Testbench para v2Exp8.vhd
-- Validação assincrona
-- pacotes
-- constantes e bibliotecas
library IEEE ;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
-- architecture (arquitetura)
architecture tb_v2Exp8 of testbenchEx8v2 is
-- declaracao do componente v2Exp8	
component v2Exp8 is port(
	RST : in std_logic;
	CLK : in std_logic;
	T60, T20, T6, T5 : out std_logic );
end component;

-- implementacao dos sinais auxiliares
signal CLK : std_logic;
signal RST, T60, T20, T6, T5: std_logic := '0';
	
begin
	VISTO2: v2Exp8 port map (RST, CLK, T60, T20, T6, T5);
	Clock: process
	begin
		CLK <= '0','1' after 2.5 ns, '0' after 5 ns;
		wait for 5 ns;
	end process;
	
	estimulo: process
	begin
		wait for 750 ns;
		RST <= '1';
		wait for 5 ns;
		RST <= '0';
		wait for 500 ns;
	end process estimulo;
end tb_v2Exp8;
-- a definicao termina por end

-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 21/10/2020
--***********************************************************
--		Testbench p/ o Visto 2 experimento 6
--	registrador de deslocamento bidirecional de 4 bits
--***********************************************************

-- Entity (entidade)
-- testbench uma entidade sem pinos de entradas e saidas
entity testbenchEx6V2 is end;

-- Testbench para Exp6v2.vhd
--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use std.textio.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- architecture (arquitetura)
architecture tb_Exp6v2 of testbenchEx6V2 is
-- declaracao do componente Exp6v2
component Exp6v2 port(
	CLK, RST, LOAD, DIR, L, R : in std_logic;
	D : in std_logic_vector (3 downto 0);
	Q : out std_logic_vector (3 downto 0));		
end component;

-- implementacao dos sinais auxiliares
signal input : std_logic_vector (4 downto 0) := "00000";
signal CLK	 : std_logic;
signal D	 : std_logic_vector (3 downto 0) := "0000";

--input(4) = RST;
--input(3) = LOAD;
--input(2) = DIR;
--input(1) = L;
--input(0) = R;
begin 
	Visto2: Exp6v2 port map(CLK, input(4), input(3), input(2),
							input(1), input(0), D, OPEN);

--clock com periodo de 10 ns;
	Clock: process
		begin
			CLK <= '0';
			wait for 5 ns;
			CLK <= '1';
			wait for 5 ns;
	end process;
	
	estimulo: process		--processo de estimulo dos sinais;
		begin
			for i in 0 to 31 loop	--inicio do loop p/ o sinal input;
				wait for 10 ns;
				input <= unsigned(input) + 1; -- incrementando input;

				for j in 0 to 15 loop	--inicio do loop p/ sinal D;
					wait for 10 ns;
					D <= unsigned(D) + 1; -- incrementando D;
				end loop;		-- fim do loop D;
			end loop;			--fim do loop input;
		wait;
	end process;
end tb_Exp6v2;
-- a definicao termina por end

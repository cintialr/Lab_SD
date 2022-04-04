-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 18/09/2020

--*********************************************--
-- Testbench para simulacao Funcional
-- para decodificador 4x16 e multiplexador 8x1
-- 			A, B, C, D, E, F, G ->  entradas
--			S 	-> 	saida
--*********************************************--

-- Entity (entidade)
-- testbench uma entidade sem pinos de entradas e saidas
entity testbenchV2 is end;

-- Testbench para visto2.vhd
-- Pacotes(package)
-- Constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use std.textio.ALL;

-- architecture (arquitetura)
architecture tb_visto2 of testbenchV2 is

--Declaracao do componente visto2.vhd
component visto2 is port( 
	A, B, C, D, E, F, G :in std_logic;
	S : out std_logic);
end component;

--sinais auxiliares para a interconexão ao
--processo de estimulo

--Sinais auxiliares
signal Input : std_logic_vector (6 downto 0) := (others => '0');

begin 

v2: visto2 port map(Input(6), Input(5), Input(4), Input(3), 
					Input(2), Input(1), Input(0), OPEN);

-- Implementacao para o estimulo 
estimulo : PROCESS
begin-- inicio do processo estimulo
	for i in 0 to 127 loop --iniciando loop 
		wait for 5 ns;
		Input <= unsigned(Input) + 1; --incrementando as saidas
	end loop;	--fim do loop
wait;
end	PROCESS estimulo;
end tb_visto2;

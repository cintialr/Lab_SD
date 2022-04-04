-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 07/09/2020
--*********************************************************
--		Testbench p/ Visto 1 experimento 5
--	Somador de palavras utilizando o somador completo
--         			A   Entrada;
--         			B   Entrada;
--         			S   Saída; 
--*********************************************************

--entity (Entidade)
--entidade sem pinos de entrada e saida

entity testbench1_ex5 is end;

-- Testbench para V1ex5.vhd
-- Validacao assincrona

--Package (Pacote)
--constantes e bibliotecas

library IEEE ;
use IEEE.STD_LOGIC_1164.all;
use std.textio.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

--arquitetura p/ SomadorPalavras
architecture SomadorPalavras of testbench1_ex5 is 

--Declaracao do componente V1ex5.vhd
component V1ex5 is port (
		A : in std_logic_vector (3 downto 0);
	    B : in std_logic_vector (3 downto 0);
	    S : out std_logic_vector (4 downto 0));
end component;

--Sinais auxiliares para a interconexao ao
--processo de estimulo
signal input : std_logic_vector (7 downto 0):=(others => '0');
signal S 	 :std_logic_vector (4 downto 0);

begin
soma: V1ex5 port map (A(0) => input(0), A(1) => input(1), A(2) => input(2), A(3) => input(3),
					  B(0) => input(4), B(1) => input(5), B(2) => input(6), B(3) => input(7),
					  S  => open);

--Implementacao do processo de estimulo
estimulo: process

begin-- inicio do processo estimulo
	report "Iniciando a simulacao..." severity NOTE;

	for i in 0 to 255 loop -- inicio do loop;
		wait for 5 ns; 
		input <= unsigned(input) + 1; -- incrementando os sinais de A e B;
	end loop; -- fim do loop;
	wait;
	
	report "Fim da simulacao!" severity NOTE;

end process estimulo;
end SomadorPalavras;
-- a definicao termina por end

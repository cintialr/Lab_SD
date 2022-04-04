-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 08/09/2020
--*********************************************************
--		Testbench p/ Visto 3 experimento 5
-- 		GERADOR DE ESTIMULOS DO TOP MODULE!
--	Somador de palavras utilizando o somador completo
--         			A   Entrada;
--         			B   Entrada;
--         			S   Saída; 
--*********************************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Entity (Entidade)
--pinos de entrada e saída
-- entidade para o testbench V3ex5
entity V3ex5 is port (    
		S1, S2 : in  STD_LOGIC_VECTOR (4 downto 0);
        A, B   : out  STD_LOGIC_VECTOR (3 downto 0));
end V3ex5;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture tb_Visto3ex5 of V3ex5 is

begin

--Implementacao do processo de estimulo
estimulo: process
-- gera todas combinacoes de entradas possiveis
	variable input: std_logic_vector (7 downto 0);
    begin
	report "Iniciando teste..." severity NOTE;
    input := "00000000";
	for i in 1 to 256 loop
		    A(0) <= input(0);
			A(1) <= input(1);
			A(2) <= input(2);
			A(3) <= input(3);
			
			B(0) <= input(4);
			B(1) <= input(5);
			B(2) <= input(6);
			B(3) <= input(7);
			
			wait for 500 ns;
		-- compara as saídas: S1 = DUT, S2 = Goden Model;
		assert (S1 = S2) report "Falhou: i =" & integer'image(i) severity ERROR;		 
		input := input + 1;
	end loop;	
	report "Teste finalizado!" severity NOTE;	
	wait;
end process;
end tb_Visto3ex5;

-- a definicao termina por end

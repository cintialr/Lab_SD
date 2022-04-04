-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 07/09/2020
--*********************************************************
--			Visto 2 experimento 5
--	Somador de palavras utilizando o somador completo
--    	     	 A   Entrada;
--	        	 B   Entrada;
--         		 S   Saída; 
--*********************************************************

--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
 
--Entity (Entidade)
--pinos de entrada e saída
entity V2ex5 is port ( 
		A : in std_logic_vector (3 downto 0);
	    B : in std_logic_vector (3 downto 0);
	    S : out std_logic_vector (4 downto 0));
end V2ex5;

--Architecture (Arquitetura)
--implementacoes do projeto
architecture visto2ex5 of V2ex5 is
-- a definicao inicia por
begin
	--implementacao com unsigned
	-- '0' serve para não haver overflow
	S <= ('0' & unsigned(A)) + ('0' &  unsigned(B));
end visto2ex5;
-- a definicao termina por end

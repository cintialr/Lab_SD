-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 07/09/2020
--*********************************************************
--			Visto 1 experimento 5
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
--pinos de entradas e saída
entity V1ex5 is port ( 
		A : in std_logic_vector (3 downto 0);
	    B : in std_logic_vector (3 downto 0);
	    S : out std_logic_vector (4 downto 0));
end V1ex5;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture Visto1ex5 of V1ex5 is
-- inicializando a definicao
-- componetente do somador completo:
component SomadorC is port(
	A		:in std_logic;
	B		:in std_logic;
	Cin		:in std_logic;
	S		:out std_logic;
	Cout	:out std_logic);
end component;
-- sinais auxiliares:
signal fio0, fio1, fio2: std_logic;
begin
	-- instancias para o somador completo em cascata:
	U0: SomadorC port map(A(0), B(0), '0', S(0), fio0); 
	U1: SomadorC port map(A(1), B(1), fio0, S(1), fio1);
	U2: SomadorC port map(A(2), B(2), fio1, S(2), fio2);
	U3: SomadorC port map(A(3), B(3), fio2, S(3), S(4));
	
end Visto1ex5;
-- a definicao termina por end

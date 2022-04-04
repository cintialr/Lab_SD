-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 02/09/2020

--**************************************************
--	Somador completo com 3 entradas 2 duas saidas:
-- 			A 	 entrada 1
--			B 	 entrada 2
-- 			Cin  entrada 3	(vem um)
--			S	 saida   1  (saida A+B)
--			Cout saida   2  (vai um)

-- 			  A_____ ________
--			        |		|____S
-- 			  B_____|		|
--			 	    |       |____Cout
--	        Cin_____|_______|

--**************************************************

-- Pacotes(package)
-- Constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.ALL;

-- Entity (entidade)
-- pinos de entradas e saidas

entity SomadorC is port(
	A		:in std_logic;
	B		:in std_logic;
	Cin		:in std_logic;
	S		:out std_logic;
	Cout	:out std_logic);
end SomadorC;

-- Architecture (arquitetura)
-- implementacoes do projeto

architecture soma of SomadorC is
--iniciando a definicao
begin

	S <= A XOR B XOR Cin;
	
--  Cout = AB + ACin + BCin

	Cout <= (A AND B) OR (A AND Cin) OR (B AND Cin);

end soma;
-- a definicao termina por end
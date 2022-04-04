-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 18/09/2020

--*********************************************--
-- 	implementacao de 2 Multiplexador 4 x 1 :
-- 			A, B, C ->  entradas
--			X, Y 	-> 	saidas
--*********************************************--
-- Pacotes(package)
-- Constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
USE std.textio.ALL;

-- Entity (entidade)
-- pinos de entradas e saidas

entity visto1 is port(
		  A		:in std_logic;
		  B		:in std_logic;
		  C		:in std_logic;	  
		  X     :out std_logic;
		  Y     :out std_logic);
end visto1;

-- Architecture (arquitetura)
-- implementacoes do projeto

architecture mult of visto1 is
-- inicializando a definicao
--componetente multiplexador:
component mult4x1 is port(
	S		:in std_logic_vector (1 DOWNTO 0);
	D0		:in std_logic;
	D1		:in std_logic;
	D2		:in std_logic;
	D3		:in std_logic;
	Y		:out std_logic);
end component;

-- definindo os sinais para o mult4x1
signal sel : std_logic_vector (1 downto 0);
signal notC: std_logic;

begin
	sel(0) <= B;
	sel(1) <= A;
	notC <= not(C);
-- port maps dos multiplexadores p/ X e Y:	
	U0: mult4x1 port map( sel, '0', C, notC, '1', X); 
	U1: mult4x1 port map( sel, '1', notC, '0', C, Y);	

end mult;
-- a definicao termina por end.

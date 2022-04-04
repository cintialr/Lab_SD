-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 08/09/2020
-- ************************************************** 
--  Top module para o Visto 3: Somador de palavras 
-- **************************************************

--entity(Entidade)
--entidade sem pinos de entrada e saida
entity TopmoduleV3 is end;

-- Testbench do visto 3
--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use std.textio.all;

--Architecture (Arquitetura)
--implementacoes do projeto
architecture topModule of TopmoduleV3 is 

--Declaracoes dos componentes dos vistos do experimento 5
component V1ex5 is port (	--Visto 1
		A : in std_logic_vector (3 downto 0);
	    B : in std_logic_vector (3 downto 0);
	    S : out std_logic_vector (4 downto 0));
end component;
component V2ex5 is port (	--Visto 2
		A : in std_logic_vector (3 downto 0);
	    B : in std_logic_vector (3 downto 0);
	    S : out std_logic_vector (4 downto 0));
end component;
component V3ex5 is port ( 	--Visto 3
		S1, S2: in std_logic_vector (4 downto 0);
		A, B : out  std_logic_vector (3 downto 0));
end component;

--Sinais auxiliares para a interconexao ao
signal A, B:		std_logic_vector (3 downto 0);
signal Saida_DUT: 	std_logic_vector (4 downto 0);
signal Saida_GM: 	std_logic_vector (4 downto 0);

begin		--gerador de estimulos
	Visto1: V1ex5 port map (A => A, B => B, S  => Saida_DUT);   
	Visto2: V2ex5 port map (A => A, B => B,S  => Saida_GM);   							
	Visto3: V3ex5 port map (S1 => Saida_DUT, S2 => Saida_GM, A => A ,B => B);		
end topModule;

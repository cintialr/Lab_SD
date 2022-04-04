-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/09/2020

--*********************************************--
-- 		Decodificador 4 x 16 :
--		En Habilita a saida,
--		A(A0, A1, A2, A3) entrada com 4 bits,
--		Y(Y0, y1,..., Y15) saida com 16 bits;
--*********************************************--

-- Pacotes(package)
-- Constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;

-- Entity (entidade)
-- pinos de entradas e saidas

entity dec4x16 is
	port( --En:in std_logic;
		  A	:in std_logic_vector (0 to 3);
		  Y :out std_logic_vector (0 to 15));
end dec4x16;

-- Architecture (arquitetura)
-- implementacoes do projeto

architecture dec1 of dec4x16 is
-- inicializando a definicao
begin
-- utilizando atribuicoes seletivas
	with A select
Y <=	"0000000000000001" WHEN "0000",
		"0000000000000010" WHEN "0001",
		"0000000000000100" WHEN "0010",
		"0000000000001000" WHEN "0011",
		
		"0000000000010000" WHEN "0100",
		"0000000000100000" WHEN "0101",
		"0000000001000000" WHEN "0110",
		"0000000010000000" WHEN "0111",
	
		"0000000100000000" WHEN "1000",
		"0000001000000000" WHEN "1001",
		"0000010000000000" WHEN "1010",
		"0000100000000000" WHEN "1011",
	
		"0001000000000000" WHEN "1100",
		"0010000000000000" WHEN "1101",
		"0100000000000000" WHEN "1110",
		"1000000000000000" WHEN OTHERS;
		
end dec1;
-- a definicao termina por end.

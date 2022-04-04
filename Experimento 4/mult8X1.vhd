-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/09/2020

--*********************************************--
-- 		Multiplexador 8 x 1 :
-- 		S(S0,S1,S2) entradas seletoras com 3 bits
--		D(D0, D1, D2, D3, D4, D5, D6, D7): 
--		D0	entrada => 	S = 000;
--		D1	entrada => 	S = 001;
--		D2 	entrada => 	S = 010;
--		D3 	entrada => 	S = 011;
--		D4	entrada => 	S = 100;
--		D5 	entrada => 	S = 101;
--		D6 	entrada => 	S = 110;
--		D7  entrada =>  S = 111;
--		Y 	 saida;
--*********************************************--

-- Pacotes(package)
-- Constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity (entidade)
-- pinos de entradas e saidas

entity mult8x1 is 
	port(	S :in std_logic_vector (2 downto 0);
			D :in std_logic_vector (7 downto 0);
			Y :out std_logic);
end mult8x1;

-- Architecture (arquitetura)
-- implementacoes do projeto

architecture Mux of mult8x1 is
-- inicializando a definicao
	begin
		Y <= D(0) when S = "000" else
			 D(1) when S = "001" else
			 D(2) when s = "010" else
			 D(3) when S = "011" else
			 D(4) when S = "100" else
			 D(5) when S = "101" else
			 D(6) when S = "110" else
			 D(7);
	
end Mux;
-- a definicao termina por end.

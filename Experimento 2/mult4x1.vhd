-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 02/09/2020

--*********************************************--
-- 		Multiplexador 4 x 1 :
-- 		S(S1,S0) entradas seletoras com 2 bits
--		D0	entrada => 	S = 00;
--		D1	entrada => 	S = 01;
--		D2 	entrada => 	S = 10;
--		D3 	entrada => 	S = 11;
--		Y 	 saida;
--*********************************************--

-- Pacotes(package)
-- Constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;

-- Entity (entidade)
-- pinos de entradas e saidas

Entity mult4x1 is port(
	S		:in std_logic_vector (1 DOWNTO 0);
	D0		:in std_logic;
	D1		:in std_logic;
	D2		:in std_logic;
	D3		:in std_logic;
	Y		:out std_logic);
end mult4x1;

-- Architecture (arquitetura)
-- implementacoes do projeto

architecture mult of mult4x1 is
-- inicializando a definicao
begin	
-- A medida que S muda seu valor, S determina 
-- qual das entradas (D0,D1,D2,D3) sai em Y.
	process (S, D0, D1, D2, D3) IS 
	begin
		if(S = "00") then
			Y <= D0;
		elsif(S = "01") then
			Y <= D1;
		elsif(S = "10")  then
			Y <= D2;
		else 
			Y <= D3;
		end if;
	end process;
end mult;
-- a definicao termina por end.

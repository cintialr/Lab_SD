-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/11/2020

--*****************************************************--
--			TimeFlag para o visto 2

--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
--Entity (Entidade)
--pinos de entrada e saída
entity timeflags is
  port( dezena : in STD_LOGIC_VECTOR(3 downto 0);
        unidade : in STD_LOGIC_VECTOR(3 downto 0);
        T60 : out STD_LOGIC;
        T20 : out STD_LOGIC;
        T6 : out STD_LOGIC;
        T5 : out STD_LOGIC );
end timeflags;
--Architecture (Arquitetura)
--implementacoes do projeto
architecture timeflags_arch of timeflags is
begin
	
	T20 <= '1' when (dezena >= "0010") else '0';
	T60 <= '1' when (dezena >= "0110") else '0';
	T6 <= '1' when (dezena&unidade >= "00000110") else '0';
	T5 <= '1' when (dezena&unidade >= "00000101") else '0';
	
end timeflags_arch;
-- a definicao termina por end


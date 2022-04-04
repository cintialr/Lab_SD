-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/11/2020

--*****************************************************--
--			Visto 2 para o experimento 8
--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Entity (Entidade)
--pinos de entrada e saída
entity v2Exp8 is port(
	RST : in std_logic;
	CLK : in std_logic;
	T60, T20, T6, T5 : out std_logic );
end v2Exp8;
--Architecture (Arquitetura)
--implementacoes do projetov
architecture visto2 of v2Exp8 is
-- componente do timeFlags.vhd
component timeFlags is port(
	dezena : in std_logic_vector(3 downto 0);
	unidade : in std_logic_vector(3 downto 0);
	T60, T20, T6, T5 : out std_logic );
end component;
-- componente do v1Exp8.vhd
component v1Exp8 is port(
		CLK : in std_logic;
        RST : in std_logic;        
        Enable : in std_logic;
        LOAD : in std_logic;
        dezLoad : in std_logic_vector(3 downto 0);
        uniLoad : in std_logic_vector(3 downto 0);
        dezena : out std_logic_vector(3 downto 0);
        unidade : out std_logic_vector(3 downto 0) );
end component;
--sinais auxiliares
signal fio1, fio2 : std_logic_vector(3 downto 0) := "0000";
signal dezLoad, uniLoad : std_logic_vector(3 downto 0) := "0000";

begin	
--port map para o visto 1 e o timeflag
	S1: v1Exp8 port map (CLK, RST, '0', '0', "0000", "0000", fio1 , fio2);
	S2: timeFlags port map (fio1, fio2, T60, T20, T6, T5);
	
end visto2;
-- a definicao termina por end

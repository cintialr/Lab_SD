-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/11/2020

--*****************************************************--
--			Contador módulo 100 => visto1
--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Entity (Entidade)
--pinos de entrada e saída
entity V1Exp8 is port( 
		CLK : in std_logic;
        RST : in std_logic;        
        Enable : in std_logic;
        LOAD : in std_logic;
        dezLoad : in std_logic_vector(3 downto 0);
        uniLoad : in std_logic_vector(3 downto 0);
        dezena : out std_logic_vector(3 downto 0);
        unidade : out std_logic_vector(3 downto 0) );
end v1Exp8;
--Architecture (Arquitetura)
--implementacoes do projeto
architecture Visto1 of v1Exp8 is
-- componente do contador10.vhd
component contador10 is port(
		CLK : in std_logic;
        RST : in std_logic;
        enable : in std_logic;
        RCI : in std_logic;
        LOAD : in std_logic;
        D : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0);
        RCO : out std_logic );
end component;
--sinais auxiliares
signal fio1, fio2 : std_logic;
begin
	U0: contador10 port map(CLK, RST, Enable, '0', LOAD, uniLoad, unidade, fio1);
	U1: contador10 port map(CLK, RST, Enable, fio1, LOAD, dezLoad, dezena, fio2);
end Visto1;
-- a definicao termina por end

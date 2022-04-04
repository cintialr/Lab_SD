-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/11/2020
--****************************************************
-- 			Visto 3 - Experimento 8

--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Entity (Entidade)
--pinos de entrada e saída
entity v3Exp8 is
  port( CLK : in STD_LOGIC;
        ligadesliga : in STD_LOGIC;        
        sensorA : in STD_LOGIC;
        sensorB : in STD_LOGIC);
end v3Exp8;
--Architecture (Arquitetura)
--implementacoes do projeto
architecture Visto3 of v3Exp8 is
-- componente da maqestados.vhd	 
component maqestados is port( 
		CLK : in STD_LOGIC;
        ligadesliga : in STD_LOGIC;
        sensorA : in STD_LOGIC;
        sensorB : in STD_LOGIC;
        T60 : in STD_LOGIC;
        T20 : in STD_LOGIC;
        T6 : in STD_LOGIC;
        T5 : in STD_LOGIC;
        resetcounter : out STD_LOGIC;
        RYGsemaforoA : out STD_LOGIC_VECTOR(2 downto 0);
        RYGsemaforoB : out STD_LOGIC_VECTOR(2 downto 0) );
end component;
-- componente do Visto 2
component v2Exp8 is port( 
	RST : in std_logic;
	CLK : in std_logic;
	T60, T20, T6, T5 : out std_logic );
end component;
-- componente do visto 1
component V1Exp8 is port( 
		CLK : in std_logic;
        RST : in std_logic;        
        Enable : in std_logic;
        LOAD : in std_logic;
        dezLoad : in std_logic_vector(3 downto 0);
        uniLoad : in std_logic_vector(3 downto 0);
        dezena : out std_logic_vector(3 downto 0);
        unidade : out std_logic_vector(3 downto 0) );
end component;

-- sinais auxiliares	
signal RST, T60, T20, T6, T5: std_logic;
signal dezena, unidade: std_logic_vector(3 downto 0);
signal semA, semB : STD_LOGIC_VECTOR(2 downto 0);

begin
	U0: v1Exp8 port map(CLK, RST, '0', '0', "0000", "0000", dezena, unidade);
	U1: v2Exp8 port map (RST, CLK, T60, T20, T6, T5);
	U2: maqestados port map (CLK, ligadesliga, sensorA, SensorB, T60, T20, T6, T5, RST, semA, semB);
end Visto3;
-- a definicao termina por end.

-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 21/10/2020
--*********************************************************
--			Visto 1 experimento 6
--				Flip flop JK
--*********************************************************

--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.ALL;

--Entity (Entidade)
--pinos de entrada e saída
entity Exp6v1 is port(
	PR, CLR, CLK, J, K : in std_logic;
	Q			 : out std_logic );
end Exp6v1;

--Architecture (Arquitetura)
--implementacoes do projeto
architecture Visto1 of Exp6v1 is

-- sinal auxiliar 
signal JK : std_logic_vector (1 downto 0);

-- a definicao inicia por
begin 
	JK <= J & K;
	process(PR, CLR, CLK)		-- comportamento do circuito
		variable Qbuf : std_logic;
		begin 
			if PR = '1' then	
			Qbuf := '1';
			elsif CLR = '1' then
			Qbuf := '0';
			elsif rising_edge(CLK) then	--quando clk está na borda de subida
				case JK is 	
					when "00" => Qbuf := Qbuf; 		--Q se mantem
					when "01" => Qbuf := '0'; 		--Q muda de estado p/ '0'
					when "10" => Qbuf := '1';		--Q muda de estado p/ '1'
					when "11" => Qbuf := not Qbuf;	--Q inverte
					when others => Qbuf := Qbuf;	--Q se mantem
				end case;
			end if;
			Q <= Qbuf;		--atribuindo Qbuf a Q
	end process;
end Visto1;
-- a definicao termina por end

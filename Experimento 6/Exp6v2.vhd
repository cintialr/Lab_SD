-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 21/10/2020
--***********************************************************
--				Visto 2 experimento 6
--	registrador de deslocamento bidirecional de 4 bits
--***********************************************************
--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
--Entity (Entidade)
--pinos de entradas e saída
entity Exp6v2 is port(
	CLK, RST, LOAD, DIR, L, R : in std_logic;
	D : in std_logic_vector (3 downto 0);
	Q : out std_logic_vector (3 downto 0));
end Exp6v2;
--Architecture (Arquitetura)
--implementacoes do projeto
architecture Visto2 of Exp6v2 is
-- a definicao inicia por
begin
	process(CLK)
		variable Qbuf : std_logic_vector (3 downto 0) := "0000";
			begin		
			if rising_edge(CLK) then	--quando clk está na borda de subida
				if RST = '1' then
					Qbuf := "0000";								-- Q = "0000"
				elsif LOAD = '1' then
					Qbuf := D;									-- Q = D;
				elsif DIR = '0' then
					Qbuf := Qbuf(2) & Qbuf(1) & Qbuf(0) & L;	-- Q = Q(2)Q(1)Q(0)L
				elsif DIR = '1' then
					Qbuf := R & Qbuf(3) & Qbuf(2) & Qbuf(1);	-- Q = R Q(3)Q(2)Q(1)
				else
					Qbuf := Qbuf;
				end if;
			else
				Qbuf := Qbuf;
			end if;
		Q <= Qbuf;	--atribuindo os valores de Qbuf em Q;
	end process;
end Visto2;
-- a definicao termina por end

-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 01/11/2020

--		   Experimento 7
-- Máquina de estados síncrona Moore

--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Entity (Entidade)
--pinos de entrada e saída
entity Exp7 is port (    
	A :in  std_logic_vector (1 downto 0);
	CLK, RST :in std_logic;
    LiberaRefri, devolve_25, devolve_50 :out std_logic );
end Exp7;
--A = 00 -> nenhuma ação
--A = 01 -> insere 25
--A = 10 -> insere 50
--A = 11 -> cancelar compra

--Architecture (Arquitetura)
--implementacoes do projeto
architecture Maquina_refri of Exp7 is
-- a definicao inicia por
	-- novo tipo chamado de "estado" com os 9 estados possíveis
   type estado is (ST0, ST25, ST50, ST75, ST100, ST125, Back25, Back50, Back75);
   -- dois sinais do tipo "estado": currentState (estado atual) e nextState (próximo estado)
   signal currentState, nextState: estado;
   signal Saida: std_logic_vector(2 downto 0);
begin
-- Processo síncrono (mémoria da máquina de estados).
	sync_proc: process (RST, CLK)
	begin
	   if (RST = '1') then
			currentState <= ST0;
	   elsif rising_edge(CLK) then
			currentState <= nextState;
	   end if;
	end process sync_proc;
	-- processo combinacional (lógica de saída e lógica de estado seguinte)
    comb_proc: process (currentState, A)
	begin
	   case currentState is
			when ST0 =>
				Saida <= "000";
			   if (A = "00") then
					nextState <= ST0;
			   elsif (A = "01") then
					nextState <= ST25;
		       elsif (A = "10") then
					nextState <= ST50;
			   else
					nextState <= ST0;
			   end if;
			when ST25 => 
				Saida <= "000";
			   if (A = "00") then
					nextState <= ST25;
			   elsif (A = "01") then
					nextState <= ST50;
			   elsif (A = "10") then
					nextState <= ST75;
			   else
					nextState <= Back25;
			   end if;	
			when ST50 => 
				Saida <= "000";
			   if (A = "00") then
					nextState <= ST50;
			   elsif (A = "01") then
					nextState <= ST75;
			   elsif (A = "10") then
					nextState <= ST100;
			   else
					nextState <= Back50;
			   end if;
			when ST75 => 
				Saida <= "000";
			   if (A = "00") then
					nextState <= ST75;
			   elsif (A = "01") then
					nextState <= ST100;
			   elsif (A = "10") then
					nextState <= ST125;
			   else
					nextState <= Back75;
			   end if;
			when ST100 => 
				Saida <= "100";
			   if (A = "00") then
					nextState <= ST0;
			   elsif (A = "01") then
					nextState <= ST25;
			   elsif (A = "10") then
					nextState <= ST50;
			   else
					nextState <= ST0;
			   end if;
			when ST125 => 
				Saida <= "110";
			   if (A = "00") then
					nextState <= ST0;
			   elsif (A = "01") then
					nextState <= ST25;
			   elsif (A = "10") then
					nextState <= ST50;
			   else
					nextState <= ST0;
			   end if;
			when Back25 => 
				Saida <= "010";
			   if (A = "00") then
					nextState <= ST0;
			   elsif (A = "01") then
					nextState <= ST25;
			   elsif (A = "10") then
					nextState <= ST50;
			   else
					nextState <= ST0;
			   end if;
			when Back50 => 
				Saida <= "001";
			   if (A = "00") then
					nextState <= ST0;
			   elsif (A = "01") then
					nextState <= ST25;
			   elsif (A = "10") then
					nextState <= ST50;
			   else
					nextState <= ST0;
			   end if;
			when Back75 => 
				Saida <= "011";
			   if (A = "00") then
					nextState <= ST0;
			   elsif (A = "01") then
					nextState <= ST25;
			   elsif (A = "10") then
					nextState <= ST50;
			   else
					nextState <= ST0;
			   end if;	
			when others =>
				Saida <= "000";
				nextState <= ST0;
		end case;
	LiberaRefri <= Saida(2);
	devolve_25 <= saida(1);
	devolve_50 <= saida(0);
end process comb_proc;
end Maquina_refri;
-- a definicao termina por end



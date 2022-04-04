-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/11/2020
--*********************************************************
--		Máquina de estados para o visto 3

--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Entity (Entidade)
--pinos de entrada e saída
entity maqestados is
  port( CLK : in STD_LOGIC;
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
end maqestados;
-- arquitetura 
architecture maqestados_arch of maqestados is
-- a definicao inicia por
	-- novo tipo chamado de "estado" com os 8 estados possíveis	
	type estado is (GR, YR, RRA, RG, RY, RRB, YY, NN);
	signal currentState, nextState : estado;
	-- sinais auxiliares
	signal aux0 ,aux1 ,aux2 ,aux3 : STD_LOGIC;
begin

	aux0 <= T5 and ligadesliga;
	aux1 <= T6 and ligadesliga;
	aux2 <= (ligadesliga and T60) or (ligadesliga and sensorA and (not(sensorB)) and T20);
	aux3 <= (ligadesliga and T60) or (ligadesliga and (not(sensorA)) and sensorB and T20);
	
-- Processo síncrono (mémoria da máquina de estados).
	sync_proc: process(CLK)
	begin
		if rising_edge(CLK) then
			currentState <= nextState;
		end if;
	end process sync_proc;
-- processo combinacional (lógica de saída e lógica de estado seguinte)
	comb_proc: process(currentState, ligadesliga, sensorA, sensorB, T60, T20, T6, T5)
	begin
		case currentState is
			when GR =>					-- verde p/ A e vermelho p/ B
				RYGsemaforoA <= "001";
				RYGsemaforoB <= "100";
				if(aux3 = '1') then 
					resetcounter <= '1';
					nextState <= YR;
				elsif(ligadesliga = '0') then
					resetcounter <= '1';
					nextState <= YY;
				else
					resetcounter <= '0';
					nextState <= GR;
				end if;
			when YR =>					-- amarelo p/ A e vermelho p/ B
				RYGsemaforoA <= "010";
				RYGsemaforoB <= "100";
				if(aux1 = '1') then 
					resetcounter <= '1';
					nextState <= RRA;
				elsif(ligadesliga = '0') then
					resetcounter <= '1';
					nextState <= YY;
				else
					resetcounter <= '0';
					nextState <= YR;
				end if;
			when RRA =>					--vermelho p/ A e vermelho p/ B
				RYGsemaforoA <= "100";
				RYGsemaforoB <= "100";
				if(aux0 = '1') then 
					resetcounter <= '1';
					nextState <= RG;
				elsif(ligadesliga = '0') then
					resetcounter <= '1';
					nextState <= YY;		
				else
					resetcounter <= '0';
					nextState <= RRA;
				end if;
			when RG =>					-- vermelho p/ A e verde p/ B
				RYGsemaforoA <= "100";
				RYGsemaforoB <= "001";
				if(aux2 = '1') then 
					resetcounter <= '1';
					nextState <= RY;
				elsif(ligadesliga = '0') then
					resetcounter <= '1';
					nextState <= YY;
				else
					resetcounter <= '0';
					nextState <= RG;
				end if;
			when RY =>					-- vermelho p/ A e amarelo p/ B
				RYGsemaforoA <= "100";
				RYGsemaforoB <= "010";
				if(aux1 = '1') then 
					resetcounter <= '1';
					nextState <= RRB;
				elsif(ligadesliga = '0') then
					resetcounter <= '1';
					nextState <= YY;
				else
					resetcounter <= '0';
					nextState <= RY;
				end if;
			when RRB =>					-- vermelho p/ A e vermelho p/ B (segundo caso)
				RYGsemaforoA <= "100";
				RYGsemaforoB <= "100";
				if(aux0 = '1') then 
					resetcounter <= '1';
					nextState <= GR;
				elsif(ligadesliga = '0') then
					resetcounter <= '1';
					nextState <= YY;
				else
					resetcounter <= '0';
					nextState <= RRB;
				end if;
			when YY =>					-- amarelo p/ A e amarelo p/ B
				RYGsemaforoA <= "010";
				RYGsemaforoB <= "010";
				if(ligadesliga = '0') then
					resetcounter <= '1';
					nextState <= NN;
				else
					resetcounter <= '0';
					nextState <= YY;
				end if;
			when NN =>	 				-- estado semaforo apagado 
				RYGsemaforoA <= "000";
				RYGsemaforoB <= "000";
				if(ligadesliga = '1') then 
					resetcounter <= '1';
					nextState <= GR;
				elsif(ligadesliga = '0') then
					resetcounter <= '1';
					nextState <= YY;
				else
					resetcounter <= '0';
					nextState <= NN;
				end if;
			end case;
		end process comb_proc;	
end maqestados_arch;
-- a definicao termina por end.

-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/11/2020

--*****************************************************--
--			Contador módulo 10 para o visto1

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Entity (Entidade)
--pinos de entrada e saída

entity contador10 is port( 
		CLK : in std_logic;
        RST : in std_logic;
        enable : in std_logic;
        RCI : in std_logic;
        LOAD : in std_logic;
        D : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0);
        RCO : out std_logic );
end contador10;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture Contador of contador10 is

-- a definicao inicia por
	-- novo tipo chamado de "estado" com os 9 estados possíveis
   type estado is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, ST8, ST9);
-- dois sinais do tipo "estado": currentState (estado atual) e nextState (próximo estado)
   signal currentState, nextState, loadState: estado;
begin
   with D select 
	   loadState <= ST0 when "0000",
					ST1 when "0001",
					ST2 when "0010",
					ST3 when "0011",
					ST4 when "0100",
					ST5 when "0101",
					ST6 when "0110",
					ST7 when "0111",
					ST8 when "1000",
					ST9 when "1001",
					ST0 when others;

-- Processo síncrono (mémoria da máquina de estados).	
	sync_proc: process (CLK)
	begin
	   if rising_edge(CLK) then
		   currentState <= nextState;
	   end if;
	end process sync_proc;
-- processo combinacional (lógica de saída e lógica de estado seguinte)	
	comb_proc: process (currentState, RST, enable, RCI, LOAD, loadState)
	begin
	   case currentState is	   
		    when ST0 => 
				Q <= "0000";	
				RCO <= '1';
				if (RST = '1') then nextState <= ST0;
				elsif (LOAD = '1') then nextState <= loadState;
				elsif ((enable = '0') and (RCI = '0')) then nextState <= ST1;
				else nextState <= ST0;
				end if;								
			when ST1 => 
				Q <= "0001";
				RCO <= '1';
				if (RST = '1') then nextState <= ST0;
				elsif (LOAD = '1') then nextState <= loadState;
				elsif ((enable = '0') and (RCI = '0')) then nextState <= ST2;
				else nextState <= ST1;
				end if;
			when ST2 => 
				Q <= "0010";
				RCO <= '1';
				if (RST = '1') then nextState <= ST0;
				elsif (LOAD = '1') then nextState <= loadState;
				elsif ((enable = '0') and (RCI = '0')) then nextState <= ST3;
				else nextState <= ST2;
				end if;
			when ST3 => 
				Q <= "0011";
				RCO <= '1';
				if (RST = '1') then nextState <= ST0;
				elsif (LOAD = '1') then nextState <= loadState;
				elsif ((enable = '0') and (RCI = '0')) then nextState <= ST4;
				else nextState <= ST3;
				end if;
			when ST4 => 
				Q <= "0100";
				RCO <= '1';
				if (RST = '1') then nextState <= ST0;
				elsif (LOAD = '1') then nextState <= loadState;
				elsif ((enable = '0') and (RCI = '0')) then nextState <= ST5;
				else nextState <= ST4;
				end if;
			when ST5 =>
				Q <= "0101";
				RCO <= '1';
				if (RST = '1') then nextState <= ST0;
				elsif (LOAD = '1') then nextState <= loadState;
				elsif ((enable = '0') and (RCI = '0')) then nextState <= ST6;
				else nextState <= ST5;
				end if;
			when ST6 => 
				Q <= "0110";
				RCO <= '1';
				if (RST = '1') then nextState <= ST0;
				elsif (LOAD = '1') then nextState <= loadState;
				elsif ((enable = '0') and (RCI = '0')) then nextState <= ST7;
				else nextState <= ST6;
				end if;
			when ST7 => 
				Q <= "0111";
				RCO <= '1';
				if (RST = '1') then nextState <= ST0;
				elsif (LOAD = '1') then nextState <= loadState;
				elsif ((enable = '0') and (RCI = '0')) then nextState <= ST8;
				else nextState <= ST7;
				end if;
			when ST8 => 
				Q <= "1000";
				RCO <= '1';
				if (RST = '1') then nextState <= ST0;
				elsif (LOAD = '1') then nextState <= loadState;
				elsif ((enable = '0') and (RCI = '0')) then nextState <= ST9;
				else nextState <= ST8;
				end if;	
			when ST9 => 
				Q <= "1001";
				RCO <= '0';
				if (RST = '1') then nextState <= ST0;
				elsif (LOAD = '1') then nextState <= loadState;
				elsif ((enable = '0') and (RCI = '0')) then nextState <= ST0;
				else nextState <= ST9;
				end if;
			when others => 
				Q <= "0000";
				RCO <= '1';
				if (RST = '1') then nextState <= ST0;
				elsif (LOAD = '1') then nextState <= loadState;
				elsif ((enable = '0') and (RCI = '0')) then nextState <= ST1;
				else nextState <= ST0;
		        end if;
		end case;
	end process comb_proc;
end Contador;
-- a definicao termina por end



-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 01/11/2020

--	Testbench funcional para o Experimento 7
--		Máquina de estados síncrona Moore

--entity (Entidade)
--testbench uma entidade sem pinos de entrada e saida

entity tb_Exp7 is end;

-- Testbench para o experimento 7

--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use std.textio.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- architecture (arquitetura)
architecture testbenchExp7 of tb_Exp7 is
-- Declaração do component Exp7
component Exp7 port (    
	A :in  std_logic_vector (1 downto 0);
	CLK, RST :in std_logic;
    LiberaRefri, devolve_25, devolve_50 :out std_logic );
end component;

-- implementacao dos sinais auxiliares
signal  A 		 : std_logic_vector (1 downto 0);
signal  RST, CLK : std_logic;
signal  INPUT	 : STD_LOGIC_VECTOR (2 downto 0):=(others => '0');
signal  LiberaRefri, devolve_25, devolve_50 :std_logic;

begin
	M_Refri: Exp7 port map (A => A, RST => RST, CLK => CLK, 
								 LiberaRefri => LiberaRefri,
								 devolve_25 => devolve_25,
								 devolve_50 => devolve_50);
	Clock: process
	begin
		CLK <= '0','1' after 2.5 ns, '0' after 5 ns;
		wait for 5 ns;
	end process;
	
	processo: process
	begin
			A <= "00";
				for i in 1 to 10 loop
					wait for 6 ns;
					A <= A + '1';
				end loop;
				
				wait for 1 ns;
				RST <= '1';
				wait for 3 ns;
				RST <= '0';
				
			A <= "01";	
				for i in 1 to 10 loop
					wait for 6 ns;
					A <= A + '1';
				end loop;
				
				wait for 1 ns;
				RST <= '1';
				wait for 3 ns;
				RST <= '0';

			A <= "10";
				for i in 1 to 10 loop
					wait for 6 ns;
					A <= A + '1';
				end loop;
				
				wait for 1 ns;
				RST <= '1';
				wait for 3 ns;
				RST <= '0';			
			
			A <= "11";
			for i in 1 to 10 loop
				wait for 6 ns;
				A <= A + '1';
			end loop;
			
			wait for 1 ns;
			RST <= '1';
			wait for 3 ns;
			RST <= '0';
			
			A <= "11";
			for i in 1 to 3 loop
				wait for 6 ns;
				A <= A + "10";
			end loop;
			
			A <= "00";
			for i in 1 to 3 loop
				wait for 6 ns;
				A <= A + "10";
			end loop;			
			
			wait for 1 ns;
			A <= "11";
			wait for 6 ns;
			A <= "00";
			wait for 1 ns;
			RST <= '1';
			wait for 3 ns;
			RST <= '0';
			wait;
wait;
end process;
end testbenchExp7;		

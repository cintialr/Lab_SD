-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/11/2020

--********************************************************--
-- Testbench para a simulação funcional do circuito:
--			Experimento 8 - visto 1
--********************************************************--

-- Entity (entidade)
-- testbench uma entidade sem pinos de entradas e saidas
entity testbenchEx8v1 is end;

-- Testbench para v1Exp8.vhd
-- Validação assincrona
-- pacotes
-- constantes e bibliotecas
library IEEE ;
use IEEE.STD_LOGIC_1164.all;
use std.textio.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- architecture (arquitetura)
architecture tb_v1Exp8 of testbenchEx8v1 is
-- declaracao do componente v1Exp8	
component v1Exp8 port(
		CLK : in std_logic;
        RST : in std_logic;        
        Enable : in std_logic;
        LOAD : in std_logic;
        dezLoad : in std_logic_vector(3 downto 0);
        uniLoad : in std_logic_vector(3 downto 0);
        dezena : out std_logic_vector(3 downto 0);
        unidade : out std_logic_vector(3 downto 0) );
end component;

-- implementacao dos sinais auxiliares
signal input	 : std_logic_vector(2 downto 0) := "000";
signal CLK : std_logic;
signal DEZENA, UNIDADE : std_logic_vector (3 downto 0) := "0000";

	begin 
	COUNT100: v1Exp8 port map (CLK => CLK, 
								  RST => input(2),
								  Enable => input(1), 
								  LOAD => input(0),
								  dezLoad => DEZENA,
								  uniLoad => UNIDADE,
								  dezena => open,
								  unidade => open);
-- processo para o clock								  
	Clock: process
	begin
		CLK <= '0','1' after 2.5 ns, '0' after 5 ns;
		wait for 5 ns;
	end process;

--Implementacao do processo de estimulo
	estimulo: process

	begin-- inicio do processo estimulo
-- zerando as entradas RST, Enable, LOAD
			input(0) <= '0';
			input(1) <= '0';
			input(2) <= '0';
			wait for 500 ns;
			input(1) <= '1';	-- enable = 1
			wait for 500 ns;
			input(1) <= '0';	-- enable = 0
			wait for 250 ns;
			input(2) <= '1';	-- RST = 1
			wait for 5 ns;
			input(2) <= '0';	-- RST = 0
			wait for 250 ns;
			input(0) <= '1';	-- LOAD = 1
			wait for 5 ns;
			input(0) <= '0';
			wait for 500 ns;
			--incrementando os sinais
			DEZENA <= UNSIGNED(DEZENA) + '1';
			UNIDADE <= UNSIGNED(UNIDADE) + '1';
		wait;
	end process estimulo;
end tb_v1Exp8;
-- a definicao termina por end

-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/09/2020

--*********************************************--
-- Testbench para simulacao Funcional
-- 		Multiplexador 8 x 1 :
-- 		S(S0,S1,S2) entradas seletoras com 3 bits
--		D(D0, D1, D2, D3, D4, D5, D6, D7): 
--		D0	entrada => 	S = 000;
--		D1	entrada => 	S = 001;
--		D2 	entrada => 	S = 010;
--		D3 	entrada => 	S = 011;
--		D4	entrada => 	S = 100;
--		D5 	entrada => 	S = 101;
--		D6 	entrada => 	S = 110;
--		D7  entrada =>  S = 111;
--		Y 	 saida;
--*********************************************--
-- Entity (entidade)
-- testbench uma entidade sem pinos de entradas e saidas

Entity tb_mult8x1 is end;

-- Testbench para mult8x1.vhd
-- Validacao sincrona 

library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.ALL;

-- architecture (arquitetura)

architecture testbench8x1 of tb_mult8x1 is
---- Declaracao do componente mult8x1
component mult8x1 port(
			S :in std_logic_vector (0 to 2);
			D :in std_logic_vector (0 to 7);
			Y :out std_logic);
end component;

-- sinais de entradas:
signal D : std_logic_vector (0 to 7);
signal S : std_logic_vector (0 to 2);

Begin

multiplex1: mult8x1 PORT MAP(S => S,
							 D => D,
							 Y => OPEN);
				
-- Implementacao para o estimulo 
estimulo: PROCESS
	begin -- inicio do processo estimulo
	-- Atribui valores para cada posicao do vetor D
	-- para a saida Y.
		D(0) <= '1';		
		D(1) <= '0';
		D(2) <= '0';
		D(3) <= '0';
		D(4) <= '0';
		D(5) <= '0';
		D(6) <= '0';
		D(7) <= '0';
		S  <= "000";	-- p/ Y = D0,	
		wait for 20 ns;
	-- a cada 20 ns, a posicao o vetor D = Y é zerada,
	-- é atribuido 1 a proxima posicao.
		D(0) <= '0';		
		S <= "001";		-- P/ Y = D1,
		D(1) <= '1';		
		wait for 20 ns;
		D(1) <= '0';
		S <= "010";		-- P/ Y = D2,
		D(2) <= '1';		
		wait for 20 ns;
		D(2) <= '0';		
		S <= "011";		-- P/ Y = D3,
		D(3) <= '1';		
		wait for 20 ns;
		D(3) <= '0';		
		S <= "100";		-- P/ Y = D4
		D(4) <= '1';		
		wait for 20 ns;
		D(4) <= '0';		
		S <= "101";		-- P/ Y = D5,
		D(5) <= '1';		
		wait for 20 ns;
		D(5) <= '0';		
		S <= "110";		-- P/ Y = D6,
		D(6) <= '1';		
		wait for 20 ns;
		D(6) <= '0';
		S <= "111";		-- P/ Y = D7.
		D(7) <= '1';
		wait for 20 ns;
		wait;	-- parando o processo
end PROCESS;
end testbench8x1;
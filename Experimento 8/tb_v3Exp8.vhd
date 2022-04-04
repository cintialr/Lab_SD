-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 12/11/2020
--*******************************************************************
-- Testbench para a simulação funcional do circuito:
--			Experimento 8 - visto 3

-- Entity (entidade)
-- testbench uma entidade sem pinos de entradas e saidas
entity testbenchEx8v3 is end;

-- Validação assincrona
-- pacotes
-- constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use std.textio.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- architecture (arquitetura)
architecture tb_v3Exp8 of testbenchEx8v3 is
-- declaracao do componente v3Exp8	
component v3Exp8 is port( 
		CLK : in STD_LOGIC;
        ligadesliga : in STD_LOGIC;        
        sensorA : in STD_LOGIC;
        sensorB : in STD_LOGIC );
end component;
-- sinais auxiliares
signal CLK : std_logic;
signal ligadesliga, sensorA, sensorB : std_logic;

begin
	Visto3: v3Exp8 port map(CLK => CLK, ligadesliga => ligadesliga,
							sensorA => sensorA, sensorB => sensorB );
-- gerador de clock
	Clock: process
	begin
		CLK <= '0','1' after 2.5 ns, '0' after 5 ns;
		wait for 5 ns;
	end process;
--Implementação do processo de estimulo
	estimulo: process
	begin
		report "Iniciando teste..." severity NOTE;
		
		ligadesliga <= '1';
		sensorA <= '0';
		sensorB <= '0';
		wait for 775 ns;
	
		sensorB <= '1';
		wait for 200 ns;

		sensorA <= '1';
		sensorB <= '0';
		wait for 200 ns;

		sensorA <= '0';
		ligadesliga <= '0';
		wait for 200 ns;

		ligadesliga <= '1';			
		sensorB <= '1';
		wait for 200 ns;

		sensorA <= '1';
		sensorB <= '0';
		wait for 200 ns;
		sensorA <= '0';
		
		report "Teste finalizado!" severity NOTE;
		wait;
	end process estimulo;
end tb_v3Exp8;
-- a definicao termina por end.
							
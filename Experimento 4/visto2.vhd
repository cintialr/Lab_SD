-- Universidade de Brasilia 
-- Laboratorio de Sistemas Digitais - turma C
-- Autor: Cintia Leal Rodrigues
-- Matricula: 17/0125696
-- Data: 18/09/2020
--***************************************************--
--Implementacao p/ decodificador 4x16 e multiplex 8x1
-- 			A, B, C, D, E, F, G ->  entradas
--			S 	-> 	saida
--***************************************************--

-- Pacotes(package)
-- Constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
USE std.textio.ALL;

-- Entity (entidade)
-- pinos de entradas e saidas
entity visto2 is 
	port( 	A, B, C, D, E, F, G :in std_logic;
			S : out std_logic);
end visto2; 

-- Architecture (arquitetura)
-- implementacoes do projeto
architecture funcao of visto2 is
-- inicializando a definicao

--componetente multiplexador:
component mult8x1 is port(	
		S :in std_logic_vector (2 downto 0);
		D :in std_logic_vector (7 downto 0);
		Y :out std_logic);
end component;

--componetente decodificador:
component dec4x16 is port( 
	  A	:in std_logic_vector (3 downto 0);
	  Y :out std_logic_vector (15 downto 0));
end component;

-- definindo os sinais do visto 2
signal D_signal : std_logic_vector (7 downto 0);
signal sel 		: std_logic_vector (2 downto 0);
signal S_signal	: std_logic_vector (3 downto 0);
signal Y_signal	: std_logic_vector (15 downto 0);

begin 
-- sinais para o dec4x16
S_signal(3) <= A;
S_signal(2) <= B;
S_signal(1) <= C;
S_signal(0) <= D;
-- sinais seletores para mult8x1
sel(2) <= E;
sel(1) <= F;
sel(0) <= G;
-- port map do decodificador:	
dec: dec4x16 port map (S_signal, Y_signal);

D_signal(7) <= '1';
D_signal(6) <= Y_signal(10) OR Y_signal(11);
D_signal(5) <= '0';
D_signal(4) <= Y_signal(9) OR Y_signal(15);
D_signal(3) <= '1';
D_signal(2) <= Y_signal(7);
D_signal(1) <= Y_signal(0) OR Y_signal(15);
D_signal(0) <= '0';
--port map do multiplexador:
mux: mult8x1 port map(sel, D_signal, S);

end funcao;
-- a definicao termina por end.
 
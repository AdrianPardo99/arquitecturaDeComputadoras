type banco is array (0 to (2**m)-1) of std_logic_vector(n-1 downto 0);
constant aux:banco:=(
  -- Primer programa proyecto
  LI & R0 & x"0001" ,                 -- 0 LI R0, #1
  LI & R1 & x"0007" ,                 -- 1 LI R1, #7
  TYPER & R1 & R1 & R0 & SU & ADD ,   -- 2 ADD R1,R1,R0
  SWI & R1 & x"0005" ,                -- 3 SWI R1,#5
  B& SU & x"0002" ,                   -- 4 B 2
  others=>(others=>'0')
  );

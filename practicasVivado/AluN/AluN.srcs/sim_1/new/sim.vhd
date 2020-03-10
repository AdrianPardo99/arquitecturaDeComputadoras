library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity AluN_tb is
generic(
    tam: integer:= 5);
    Port ( a, b : in STD_LOGIC_VECTOR ((tam-1) downto 0);
           aluop : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR ((tam-1) downto 0);
           n,z,ov,co : out STD_LOGIC
           );
end;

architecture bench of AluN_tb is

  component AluN
  generic(
      tam: integer:= 4);
      Port ( a, b : in STD_LOGIC_VECTOR ((tam-1) downto 0);
             aluop : in STD_LOGIC_VECTOR (3 downto 0);
             res : out STD_LOGIC_VECTOR ((tam-1) downto 0);
             n,z,ov,co : out STD_LOGIC
             );
  end component;



begin

  -- Insert values for generic parameters !!
  uut: AluN generic map ( tam   => 4 )
               port map ( a     => a,
                          b     => b,
                          aluop => aluop,
                          res   => res,
                          n     => n,
                          z     => z,
                          ov    => ov,
                          co    => co );

  stimulus: process
  begin
  
    -- Put initialisation code here
    a<="0101";
    b<="1110";
    aluop<="0001";
    wait;
    

    -- Put test bench stimulus code here

    wait;
  end process;


end;
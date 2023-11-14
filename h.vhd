library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HazardDetectionUnit_TB is
end HazardDetectionUnit_TB;

architecture TB_Behavioral of HazardDetectionUnit_TB is
    -- Constants for simulation parameters
    constant PERIOD : time := 10 ns;
    
    -- Signals for testbench
    signal ID_EX_Signal : std_logic_vector(4 downto 0) := "00000";
    signal BranchTaken_Signal, IFID_RS_Signal, IFID_RT_Signal, MemRead_Signal, MemWrite_Signal, RegDst_Signal : std_logic;
    signal o_Stall_Signal, o_Flush_Signal, PC_Signal, IF_ID_Signal : std_logic;
begin
    -- Instantiate the Hazard Detection Unit
    uut : entity work.HazardDetectionUnit
        port map (
            ID_EX => ID_EX_Signal,
            BranchTaken => BranchTaken_Signal,
            IFID_RS => IFID_RS_Signal,
            IFID_RT => IFID_RT_Signal,
            MemRead => MemRead_Signal,
            MemWrite => MemWrite_Signal,
            RegDst => RegDst_Signal,
            o_Stall => o_Stall_Signal,
            o_Flush => o_Flush_Signal,
            PC => PC_Signal,
            IF_ID => IF_ID_Signal
        );

    -- Stimulus process
    stimulus: process
    begin
        -- Test scenario 1: No hazard
        ID_EX_Signal <= "00000";
        BranchTaken_Signal <= '0';
        IFID_RS_Signal <= '0';
        IFID_RT_Signal <= '0';
        MemRead_Signal <= '0';
        MemWrite_Signal <= '0';
        RegDst_Signal <= '0';
        wait for PERIOD;
        
        -- Test scenario 2: Branch taken with memory read
        ID_EX_Signal <= "00010";
        BranchTaken_Signal <= '1';
        MemRead_Signal <= '1';
        wait for PERIOD;
        
        -- Add more test scenarios here to cover different hazard conditions
        
        wait;
    end process;
    
    -- Add assertions or checks if needed to verify the output signals
    
end TB_Behavioral;

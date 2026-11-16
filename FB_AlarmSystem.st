#xFaultActive := NOT #xEmergencyStop OR #xThermalOverload;
#rtAck(CLK := #xAckButton);


CASE #iSystemState OF
    // --- STOP ---
    0:
        #xSystemRunning := FALSE;
        #xFlashingLight := FALSE;
        
        IF #xFaultActive THEN
            #iSystemState := 50;
            
        ELSIF #xStartButton THEN
            #iSystemState := 10;
        END_IF;
        
    // --- RUN ---
    10:
        #xSystemRunning := TRUE;
        #xFlashingLight := FALSE;
        
        IF #xFaultActive THEN
            #iSystemState := 50;
            
        ELSIF #xStopButton THEN
            #iSystemState := 0;
        END_IF;
        
    // --- ALARM --- 
    50:
        #xSystemRunning := FALSE;
        #xFlashingLight := #xClockPulse_0_5Hz;
        
        IF NOT #xFaultActive AND #rtAck.Q THEN
            #iSystemState := 0;
        END_IF;
            
END_CASE;


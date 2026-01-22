// This file demonstrates the code folding display issue
// When you collapse the code between comments, the display is malformed

// parent instuction
	// step 1
	// step 2
	// step 3
	
	// step 4
	// step 5
// end of parent instruction

// Another example with actual PLC code
// Initialize system variables
	VAR
		xSystemReady: BOOL := FALSE;
		iCounter: INT := 0;
		rTemperature: REAL := 0.0;
	END_VAR
// End initialization

// Main control loop
	IF xSystemReady THEN
		iCounter := iCounter + 1;
		// Process temperature reading
		IF rTemperature > 100.0 THEN
			// Emergency shutdown
			xSystemReady := FALSE;
		END_IF;
	END_IF;
// End main control loop

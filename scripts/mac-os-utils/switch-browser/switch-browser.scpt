on run argv
	do shell script "/opt/homebrew/bin/defaultbrowser " & item 1 of argv
	delay 2
	try
		tell application "System Events"
			tell application process "CoreServicesUIAgent"
				tell window 1
					tell (first button whose name starts with "Use")
						perform action "AXPress"
					end tell
				end tell
			end tell
		end tell
	end try
end run


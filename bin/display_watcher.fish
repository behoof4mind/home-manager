#!/usr/bin/env fish

# Get display info as JSON
set display_info (system_profiler SPDisplaysDataType -json)

# Check if there's an external display
if echo $display_info | jq -e '.SPDisplaysDataType[].spdisplays_ndrvs[] | select(.spdisplays_connection_type == "spdisplays_internal")' >/dev/null
    echo "Switching to Light Profile"
    /Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli --select-profile "Light setup"
else
    echo "Switching to Hard Profile"
    /Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli --select-profile "Hard setup"
end

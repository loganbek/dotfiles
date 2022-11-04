-- on alfred_script(q)
-- 	tell application "Terminal"
-- 		activate
-- 		do script q
-- 	end tell
-- end alfred_script

on alfred_script(q)
    tell application "Warp"
        activate
        do script q
    end tell
end alfred_script
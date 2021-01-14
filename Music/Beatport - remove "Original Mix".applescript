-- Remove " - Original Mix" in title from Beatport's mp3s
-- Usage: Select songs on Music and Run.

-- 曲名から Beatport の " - Original Mix", " (Original Mix)" を抜く
-- 使い方: Music で曲を選択してスクリプトを実行

tell application "Music"
	set defaultDelimiter to AppleScript's text item delimiters
	
	set theTracks to selection of front browser window
	set theTracksRef to a reference to theTracks
	repeat with i from 1 to count of theTracksRef
		set theTrack to item i of my theTracksRef
		tell theTrack
			
			set AppleScript's text item delimiters to " - Original Mix"
			set theList to every text item of (name as string)
			set AppleScript's text item delimiters to ""
			set name to theList as string
			
			set AppleScript's text item delimiters to " (Original Mix)"
			set theList to every text item of (name as string)
			set AppleScript's text item delimiters to ""
			set name to theList as string
			
		end tell
	end repeat
	
	set AppleScript's text item delimiters to defaultDelimiter
end tell

-- Remove " - Original Mix" in title from Beatport's mp3s
-- Usage: Select songs on iTunes and Run.

-- 曲名から Beatport の " - Original Mix" を抜く
-- 使い方: iTunesで曲を選択してスクリプトを実行

-- Original Mix っていちいち付ける必要ねーだろ

tell application "iTunes"
	set defaultDelimiter to AppleScript's text item delimiters
	set AppleScript's text item delimiters to " - "
	
	set theTracks to selection of front browser window
	set theTracksRef to a reference to theTracks
	repeat with i from 1 to count of theTracksRef
		set theTrack to item i of my theTracksRef
		tell theTrack
			set theList to every text item of (name as string)
			if last item of theList is equal to "Original Mix" then
				set name to theList's contents's items 1 thru -2 as string
			end if
		end tell
	end repeat
	
	set AppleScript's text item delimiters to defaultDelimiter
end tell

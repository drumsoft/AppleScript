-- Move title text from name to comment and set temporary short title.
-- Usage: Select songs on Music and Run.

-- 長い曲名をコメント欄に退避して、代わりに短い名前をつける.
-- 使い方: Music で曲を選択して、スクリプトを実行

tell application "Music"
	set theTracks to selection of front browser window
	set theTracksRef to a reference to theTracks
	repeat with i from 1 to count of theTracksRef
		set theTrack to item i of my theTracksRef
		tell theTrack
			set shortName to "track " & track number
			if length of (name as string) > length of shortName then
				if comment is not equal to "" then
					set comment to comment & " / "
				end if
				set comment to comment & "original title: " & name
				set name to shortName
			end if
		end tell
	end repeat
end tell

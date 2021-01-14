-- Swap artist name and song name.
-- Usage: Select songs on Music and Run.

-- 曲名とアーティスト名を入れ替える
-- 使い方: Music で曲を選択して、スクリプトを実行

tell application "Music"
	set theTracks to selection of front browser window
	set theTracksRef to a reference to theTracks
	repeat with i from 1 to count of theTracksRef
		set theTrack to item i of my theTracksRef
		tell theTrack
			set tempArtist to name
			set tempName to artist
			set name to tempName
			set artist to tempArtist
		end tell
	end repeat
end tell

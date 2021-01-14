-- Set track numbers sequential to selected Songs. (Beatport never set it)
-- Usage: Order songs in playlist and select songs on Music, and Run.

-- 選択した曲に連番でトラック番号を振る(Beatportで買うと振られてない)
-- 使い方: Music でプレイリスト中の曲をソートし、曲を選択して、スクリプトを実行

tell application "Music"
	set theTracks to selection of front browser window
	set theTracksRef to a reference to theTracks
	set c to count of theTracksRef
	repeat with i from 1 to c
		set theTrack to item i of my theTracksRef
		tell theTrack
			set track number to i
			set track count to c
		end tell
	end repeat
end tell

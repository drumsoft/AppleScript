-- Copy artist and name from odd numbered tracks to next even numbered tracks.
-- Usage: Order copy source and destination alternately and select songs on iTunes, and Run.

-- 奇数番目の曲名,アーティスト名を偶数番目にコピーする
-- 使い方: iTunesでコピー元,先を交互に並べて、それらの曲を選択して、スクリプトを実行

-- iTunesに取り込んで曲名も設定した aiff を lame で mp3 圧縮した後、タグをコピーするためのスクリプト

tell application "iTunes"
	set theTracks to selection of front browser window
	set theTracksRef to a reference to theTracks
	repeat with i from 1 to count of theTracksRef by 2
		set theTrack to item i of my theTracksRef
		tell theTrack
			set tempArtist to name
			set tempName to artist
		end tell
		set theTrack to item (i + 1) of my theTracksRef
		tell theTrack
			set name to tempArtist
			set artist to tempName
		end tell
	end repeat
end tell

-- Copy artist and name from odd numbered tracks to next even numbered tracks.
-- Usage: Order copy source and destination alternately and select songs on iTunes, and Run.

-- 奇数番目の曲名,アーティスト名を偶数番目にコピーする
-- 使い方: iTunesでコピー元,先を交互に並べて、それらの曲を選択して、スクリプトを実行

-- iTunesに取り込んで曲名も設定した aiff を lame で mp3 圧縮した後、タグをコピーするためのスクリプト

tell application "iTunes"
	set theTracks to selection of front browser window
	if 1 = ((count of theTracks) mod 2) then
		error "トラックの選択数が奇数です"
	end if
	repeat with i from 1 to count of theTracks by 2
		if (track number of item i of my theTracks) ≠ (track number of item (i + 1) of my theTracks) then
			error "コピー先とコピー元のトラック番号が違う [" & (name of item i of my theTracks) & "]→[" & (name of item (i + 1) of my theTracks) & "]"
		end if
	end repeat
	repeat with i from 1 to count of theTracks by 2
		set oddTrack to item i of my theTracks
		set evenTrack to item (i + 1) of my theTracks
		set (name of evenTrack) to (name of oddTrack as string)
		set (artist of evenTrack) to (artist of oddTrack as string)
	end repeat
end tell

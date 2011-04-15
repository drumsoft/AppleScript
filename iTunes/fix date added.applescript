-- 追加日をアルバム単位で一致させる
-- このスクリプトは動作しない。追加日 date added が read only だから。

-- 最近インポートした曲を探して聴く為にプレイリストを 追加日 でソートしている。
-- CDから取り込んだ曲は曲順に表示されるのだが、購入した曲はデタラメな順番で追加され、
-- リストにもデタラメな順番で表示される。
-- これを回避する為に 追加日 をアルバム単位で一致させられれば、同じアルバム内で
-- トラック番号でソートされてくれると思うのだが・・・？
-- Apple は date added を編集可能にするか、または同時に購入、インポートされた
-- 楽曲には同じ追加日 または アルバム-トラック番号順にソートした追加処理を行うべきだ

tell application "iTunes"
	set theTracks to selection of front browser window
	set theTracksRef to a reference to theTracks
	
	set keepAlbum to ""
	repeat with i from 1 to count of theTracksRef
		set theTrack to item i of my theTracksRef
		tell theTrack
			if keepAlbum is equal to album then
				set date added to keepDateAdd
			else
				set keepDateAdd to date added
				set keepAlbum to album
			end if
		end tell
	end repeat
end tell

-- Swap artist name and song name.
-- Usage: Select songs on Music and Run.

-- �Ȗ��ƃA�[�e�B�X�g�������ւ���
-- �g����: Music �ŋȂ�I�����āA�X�N���v�g�����s

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

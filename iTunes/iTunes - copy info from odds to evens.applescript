-- Copy artist and name from odd numbered tracks to next even numbered tracks.
-- Usage: Order copy source and destination alternately and select songs on iTunes, and Run.

-- ��Ԗڂ̋Ȗ�,�A�[�e�B�X�g���������ԖڂɃR�s�[����
-- �g����: iTunes�ŃR�s�[��,������݂ɕ��ׂāA�����̋Ȃ�I�����āA�X�N���v�g�����s

-- iTunes�Ɏ�荞��ŋȖ����ݒ肵�� aiff �� lame �� mp3 ���k������A�^�O���R�s�[���邽�߂̃X�N���v�g

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

-- Set track numbers sequential to selected Songs. (Beatport never set it)
-- Usage: Order songs in playlist and select songs on iTunes, and Run.

-- �I�������ȂɘA�ԂŃg���b�N�ԍ���U��(Beatport�Ŕ����ƐU���ĂȂ�)
-- �g����: iTunes�Ńv���C���X�g���̋Ȃ��\�[�g���A�Ȃ�I�����āA�X�N���v�g�����s

tell application "iTunes"
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

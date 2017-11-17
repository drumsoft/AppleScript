-- Copy artist and name from odd numbered tracks to next even numbered tracks.
-- Usage: Order copy source and destination alternately and select songs on iTunes, and Run.

-- ��Ԗڂ̋Ȗ�,�A�[�e�B�X�g���������ԖڂɃR�s�[����
-- �g����: iTunes�ŃR�s�[��,������݂ɕ��ׂāA�����̋Ȃ�I�����āA�X�N���v�g�����s

-- iTunes�Ɏ�荞��ŋȖ����ݒ肵�� aiff �� lame �� mp3 ���k������A�^�O���R�s�[���邽�߂̃X�N���v�g

tell application "iTunes"
	set theTracks to selection of front browser window
	if 1 = ((count of theTracks) mod 2) then
		error "�g���b�N�̑I�𐔂���ł�"
	end if
	repeat with i from 1 to count of theTracks by 2
		if (track number of item i of my theTracks) �� (track number of item (i + 1) of my theTracks) then
			error "�R�s�[��ƃR�s�[���̃g���b�N�ԍ����Ⴄ [" & (name of item i of my theTracks) & "]��[" & (name of item (i + 1) of my theTracks) & "]"
		end if
	end repeat
	repeat with i from 1 to count of theTracks by 2
		set oddTrack to item i of my theTracks
		set evenTrack to item (i + 1) of my theTracks
		set (name of evenTrack) to (name of oddTrack as string)
		set (artist of evenTrack) to (artist of oddTrack as string)
	end repeat
end tell

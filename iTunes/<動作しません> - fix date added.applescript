-- �ǉ������A���o���P�ʂň�v������
-- ���̃X�N���v�g�͓��삵�Ȃ��B�ǉ��� date added �� read only ������B

-- �ŋ߃C���|�[�g�����Ȃ�T���Ē����ׂɃv���C���X�g�� �ǉ��� �Ń\�[�g���Ă���B
-- CD�����荞�񂾋Ȃ͋ȏ��ɕ\�������̂����A�w�������Ȃ̓f�^�����ȏ��ԂŒǉ�����A
-- ���X�g�ɂ��f�^�����ȏ��Ԃŕ\�������B
-- ������������ׂ� �ǉ��� ���A���o���P�ʂň�v��������΁A�����A���o������
-- �g���b�N�ԍ��Ń\�[�g����Ă����Ǝv���̂����E�E�E�H
-- Apple �� date added ��ҏW�\�ɂ��邩�A�܂��͓����ɍw���A�C���|�[�g���ꂽ
-- �y�Ȃɂ͓����ǉ��� �܂��� �A���o��-�g���b�N�ԍ����Ƀ\�[�g�����ǉ��������s���ׂ���

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

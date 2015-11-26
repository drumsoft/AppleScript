// Paste song names from clipboard.
// Usage: Copy list of song names from spreadsheets or text editors and run this script.
//   Text Editors: Song names are delimited by newlines. Optionally, artist names after tab characters.
//   Spreadsheets: Write song names in each rows. second columns for artist names optionally.

// �����̋Ȗ����N���b�v�{�[�h����y�[�X�g����
// �g����: �X�v���b�h�V�[�g��e�L�X�g�G�f�B�^����Ȗ����X�g���R�s�[���āA���̃X�N���v�g�����s����B
//   �e�L�X�g�G�f�B�^���g���ꍇ: �Ȗ��̋�؂�͉��s�A�^�u�L���̌�ɃA�[�e�B�X�g�����w��ł���B
//   �X�v���b�h�V�[�g�̏ꍇ: �s���ƂɋȖ�����́B2�J�����ڂɃA�[�e�B�X�g�����w��ł���B

function getClipboard() {
	app = Application('System Events');  
	app.includeStandardAdditions = true;  
	return app.theClipboard();
}

function getSelectedSongs() {
	app = Application("iTunes");
	return app.browserWindows[0].selection();
}

function main() {
	var nameList = getClipboard().split(/�r�n?|�n/g);
	var songs = getSelectedSongs();
	
	for (var i = 0; i < Math.min(nameList.length, songs.length); i++) {
		var song = songs[i];
		var names = nameList[i].split(/�t/);
		if (names.length > 0) {
			song.name = names[0];
		}
		if (names.length > 1) {
			song.artist = names[1];
		}
	}
}

main();

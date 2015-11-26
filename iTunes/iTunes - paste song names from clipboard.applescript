// Paste song names from clipboard.
// Usage: Copy list of song names from spreadsheets or text editors and run this script.
//   Text Editors: Song names are delimited by newlines. Optionally, artist names after tab characters.
//   Spreadsheets: Write song names in each rows. second columns for artist names optionally.

// 複数の曲名をクリップボードからペーストする
// 使い方: スプレッドシートやテキストエディタから曲名リストをコピーして、このスクリプトを実行する。
//   テキストエディタを使う場合: 曲名の区切りは改行、タブ記号の後にアーティスト名を指定できる。
//   スプレッドシートの場合: 行ごとに曲名を入力。2カラム目にアーティスト名を指定できる。

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
	var nameList = getClipboard().split(/rn?|n/g);
	var songs = getSelectedSongs();
	
	for (var i = 0; i < Math.min(nameList.length, songs.length); i++) {
		var song = songs[i];
		var names = nameList[i].split(/t/);
		if (names.length > 0) {
			song.name = names[0];
		}
		if (names.length > 1) {
			song.artist = names[1];
		}
	}
}

main();

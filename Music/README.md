# AppleScripts for Music song's metadata.

------------------------------------------------------------
## Music - move long title from track name to comment.applescript

* Move title text from name to comment and set temporary short title like "track 3".
* Usage: Select songs on Music and Run.

* 長い曲名をコメント欄に退避して、代わりに "track 3" みたいな短い名前をつける.
* 使い方: Music で曲を選択して、スクリプトを実行

* 長い曲名のトラック（アーティスト名、アルバム名も含めた「合計の長さ」で判定されるが）は「ライブラリを書き出し」で Location が正しく出力されない。Appleに報告してもなおしてくれないので、トラック名の方を短くするしかない。


------------------------------------------------------------
## Music - paste song names from clipboard.scpt (executable)
## Music - paste song names from clipboard.scpt (source)

* Paste song names from clipboard.
* Usage: Copy list of song names from spreadsheets or text editors and run this script.
  * Text Editors: Song names are delimited by newlines. Optionally, artist names after tab characters.
  * Spreadsheets: Write song names in each rows. second columns for artist names optionally.

* 複数の曲名をクリップボードからペーストする
* 使い方: スプレッドシートやテキストエディタから曲名リストをコピーして、このスクリプトを実行する。
  * テキストエディタを使う場合: 曲名の区切りは改行、タブ記号の後にアーティスト名を指定できる。
  * スプレッドシートの場合: 行ごとに曲名を入力。2カラム目にアーティスト名を指定できる。

おまけ: Discogs の曲リストをこのスクリプトでペーストできるテキストにするブックマークレット(Discog側仕様が変わったので調整中)

```
javascript:var table=document.querySelector("#release-tracklist table"),result=document.createElement("div");result.innerHTML='<textarea onclick="this.select();" readonly>'+Array.from(table.querySelectorAll("tr")).map(function(e){return [e.querySelector("td:nth-of-type(3) span").textContent,e.querySelector("td:nth-of-type(2) span").textContent.replace(/ \(\d+\)$/,"").replace(/\*$/,"")].join("\t").replace(/^[\s\t\r\n]+/,"").replace(/[\s\t\r\n]+$/,"")}).join("\n")+'</textarea>';table.parentNode.insertBefore(result,table);
```

------------------------------------------------------------
## Music - fix insane added dates.command

* remove selected tracks and re-add with track number order to fix randomized "date added" order.
* usage: select all tracks of target albums and run the script.

* 選択中のトラックを一度削除し、正しい順序で再登録する事で「追加日」を正しい順序にする
* 使い方: Musicでアルバムまるごと(複数アルバム可)選択して、スクリプトを実行

* ファイルを一度にMusicに追加したり、iTunes Storeで購入するとデタラメな順番で追加される。再追加する事でトラック番号順に修正する。


------------------------------------------------------------
## Beatport - remove "Original Mix".applescript

* Remove " - Original Mix" in title from Beatport's mp3s
* Usage: Select songs on Music and Run.

* 曲名から Beatport の " - Original Mix", " (Original Mix)" を抜く
* 使い方: Musicで曲を選択してスクリプトを実行

* 曲名に含まれる "Original Mix" という表記は冗長


------------------------------------------------------------
## Beatport - set track numbers.applescript

* Set track numbers sequential to selected Songs. (Beatport never set it)
* Usage: Order songs in playlist and select songs on Music, and Run.

* 選択した曲に連番でトラック番号を振る(Beatportで買うと振られてない)
* 使い方: Musicでプレイリスト中の曲をソートし、曲を選択して、スクリプトを実行

* 最近はトラック番号が振られたアルバムが増えた


------------------------------------------------------------
## Music - copy info from odds to evens.applescript

* Copy artist and name from odd numbered tracks to next even numbered tracks.
* Usage: Order copy source and destination alternately and select songs on Music, and Run.

* 奇数番目の曲名,アーティスト名を偶数番目にコピーする
* 使い方: Musicでコピー元,先を交互に並べて、それらの曲を選択して、スクリプトを実行

* Musicに取り込んで曲名も設定した aiff を lame で mp3 圧縮した後、タグをコピーするためのスクリプト


------------------------------------------------------------
## Music - swap artist and name.applescript

* Swap artist name and song name.
* Usage: Select songs on Music and Run.

* 曲名とアーティスト名を入れ替える
* 使い方: Musicで曲を選択して、スクリプトを実行

* CDDBに入れ替わって登録されている場合がある


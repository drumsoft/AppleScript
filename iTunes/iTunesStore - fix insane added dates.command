#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use Encode;

binmode STDOUT, ":utf8";
binmode STDERR, ":utf8";

my $applescript_get_trackinfo = q{
tell application "iTunes"
	set myString to ""
	set theTracks to selection of front browser window
	set theTracksRef to a reference to theTracks
	repeat with i from 1 to count of theTracksRef
		set theTrack to item i of my theTracksRef
		tell theTrack
			set thisID to database ID
			set thisTrackNumber to track number
			set thisDiscNumber to disc number
			set thisAlbum to album
			set thisYear to year
			set myString to myString & thisID & " " & thisDiscNumber & " " & thisTrackNumber & " " & thisYear & " " & my str_replace(thisAlbum, return, " ") & return
		end tell
	end repeat
	return myString
end tell

on str_replace(str, search, replace)
	set prevDelimiter to AppleScript's text item delimiters
	set AppleScript's text item delimiters to search
	set str to every text item of (str as string)
	set AppleScript's text item delimiters to replace
	set str to str as string
	set AppleScript's text item delimiters to prevDelimiter
	return str
end str_replace
};

my $applescript_readd_track = q{
tell application "iTunes"
	set theTrack to some track of library playlist 1 whose database ID is <ID>
	set theLocation to location of theTrack
	delete theTrack
	add (theLocation as alias)
end tell
};

main();

sub abort {
	my $message = shift;
	print "\n";
	print STDERR $message, "\n";
	exit(-1);
}

sub main {
	my $selected = tell_osascript($applescript_get_trackinfo);
	
	# parse
	my %albums;
	my %album_years;
	map {
		my ($id, $dnumber, $tnumber, $year, $album) = split / /, $_, 5;
		$dnumber = 1 if ! $dnumber;
		if ($id && $dnumber && $tnumber && $album) {
			if ( ! exists $albums{$album} ) {
				$album_years{$album} = $year;
				$albums{$album} = {};
			}
			$albums{$album}->{$dnumber} = {} if ! exists $albums{$album}->{$dnumber};
			exists $albums{$album}->{$dnumber}->{$tnumber} and abort("ERROR: $tnumber is duplicated in $album ($dnumber)");
			$albums{$album}->{$dnumber}->{$tnumber} = $id;
		}
	} grep {$_} split /[\r\n]+/, $selected;

	# check sanity
	map {
		my $album = $_;
		my $discs = $albums{$album};
		my $d = 1;
		foreach my $dnumber (sort {$a <=> $b} keys %$discs) {
			print "($album_years{$album}) $album disc $dnumber : ";
			$d == $dnumber or abort("ERROR: disc number $d expected but found $dnumber in $album");
			$d++;
			my $tracks = $discs->{$dnumber};
			my $t = 1;
			foreach my $tnumber (sort {$a <=> $b} keys %$tracks) {
				print ' ', $tnumber;
				$t == $tnumber or abort("ERROR: track number $t expected but found $tnumber in $album");
				$t++;
			}
			print "\n";
		}
	} keys %albums;
	print "check ok.\n";

	# exec re-add
	map {
		my $album = $_;
		my $discs = $albums{$album};
		foreach my $dnumber (sort {$a <=> $b} keys %$discs) {
			printf "re-add: (%d) %s disc %d\n", $album_years{$album}, $album, $dnumber;
			my $tracks = $discs->{$dnumber};
			foreach my $tnumber (sort {$a <=> $b} keys %$tracks) {
				my $script = $applescript_readd_track;
				$script =~ s/<ID>/$tracks->{$tnumber}/g;
				tell_osascript($script);
				sleep(1);
			}
		}
	} sort {
		if ( $album_years{$a} != $album_years{$b} ) {
			return $album_years{$a} <=> $album_years{$b};
		} else {
			return $a cmp $b;
		}
	} keys %albums;
	print "finished.\n";
}

sub tell_osascript($) {
	my $script = shift;
	local $/ = undef;

	$script =~ s/\"/"\\\""/eg;
	open (my $osa, qq{osascript -e "$script" |}) or die "cannot open osascript";
	my $result = Encode::decode('utf8', <$osa>);
	close $osa;

	return $result;
}

__END__

-- remove selected tracks and re-add with track number order to fix randomized "date added" order.
-- usage: select all tracks of target albums and run the script.

-- 選択中のトラックを一度削除し、正しい順序で再登録する事で「追加日」を正しい順序にする
-- 使い方: iTunes でアルバムまるごと(複数アルバム可)選択して、スクリプトを実行

-- ファイルを一度に iTunes に追加したり、 iTunes Store で購入するとトラック番号の逆順で追加される。
-- CD から読み込んだ場合はトラック番号の正順で追加されるため、追加日でソートした際にアルバムごとにトラックの並び順が揃わないと言う問題が起きる。
-- このスクリプトは、選択されたトラックをトラック番号順に追加しなおす事で追加日による並び順を修正する。
-- iTunes 12 くらいから、 iTunes を再起動するまで並び順の修正がテーブルに反映されなくなった。

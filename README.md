# This script reduces the volume of your Mac's trash box. 
Macのゴミ箱から古いファイルと空のディレクトリを削除するシェルスクリプトです。  
「ゴミ箱の中身、どのくらいあるのかな？」と覗いてみたら。。。

```
Takeru-MBP:~ takeru$ lla ~/.Trash | awk '{amount+=$5;}END{print(amount/(1024^3))}'
5.48589
```

なんと5GB以上もありました。
これはいけない！ということで、半年以上前のファイルを削除するシェルスクリプトを書きました。
ついでに空のディレクトリも削除します。（こちらは即時）

※実際にはいきなりファイル削除ではなく/tmpに移動しているので、しばらくは救えるはず。

```
Takeru-MBP:~ takeru$ cat log/retrash.log
-------------2014-12-01-------------
5503808 bytes reduced.
/Users/takeru/.Trash/bootup.png
/Users/takeru/.Trash/brankic1979-icon-set.zip
/Users/takeru/.Trash/calendar.png
/Users/takeru/.Trash/eldorado_mini.zip
/Users/takeru/.Trash/epel-release-6-8.noarch.rpm
/Users/takeru/.Trash/free-outline-icons.zip
/Users/takeru/.Trash/phone.png
/Users/takeru/.Trash/shutdown.png
/Users/takeru/.Trash/git-test/.git/branches
/Users/takeru/.Trash/git-test/.git/media/objects
/Users/takeru/.Trash/git-test/.git/media/tmp
/Users/takeru/.Trash/git-test/.git/objects/info
/Users/takeru/.Trash/git-test/.git/objects/pack
/Users/takeru/.Trash/git-test/.git/refs/tags
/Users/takeru/.Trash/ie7_Vista/.vagrant/machines/default/virtualbox
/Users/takeru/.Trash/JapaneseInputMethod
```

一応削除したファイルのログを残すようにしました。
## Usage | 使い方
ターミナルでretra.shと入力します。  
-logオプションを与えるとログファイルの中身を表示します。
## License
This script has released under the MIT license.  
[http://opensource.org/licenses/MIT](http://opensource.org/licenses/MIT)

@test "ファイルが正しい場所にインストールされている" {
  ls -la /usr/bin/analog
}

@test "ファイルに実行権限がある" {
  test -x /usr/bin/analog
}

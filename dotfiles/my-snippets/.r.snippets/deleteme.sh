# Podlodka AI (Telegram supergroup) — tdl
chatExport() {
  [[ -n "$1" ]] || { echo "usage: chatExport <chat_id>" >&2; return 1; }
  local out_dir="$HOME/tg-download"
  local export_file="$out_dir/chat-$1.json"

  mkdir -p "$out_dir" || return 1
  tdl chat export -c "$1" --all --with-content -o "$export_file" &&
    tdl dl -f "$export_file" -d "$out_dir"
}

# Скачивание podlodka chat video (и прочего): аргумент — хвост URL после /c/3752332422/
tgVideoDownload() {
  [[ -n "$1" ]] || { echo "usage: tgVideoDownload <link>" >&2; return 1; }
  tdl dl -u "$1"
}

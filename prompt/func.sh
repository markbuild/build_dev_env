# 过滤掉package-lock.json 和 yarn.lock文件的改动，并对diff的上下文进行简化(@@ ... @@)
function cleanGitDiff() {
  awk '
  BEGIN { skip=0 }
  /(package-lock\.json|yarn\.lock)$/ { skip=1; next }
  /^diff --git/ { skip=0 }
  /^index / { next }
  /^@@\s-.*\s@@/ { gsub(/^@@ .* @@/, "@@ ... @@") }
  skip == 0 { print }
  '
}

# 读取剪切板
function getClipboard(){
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    content=$(pbpaste)
  else
    # Windows Msys2
    content=$(powershell -Command "Get-Clipboard" | iconv -f GBK -t UTF-8)
  fi

  echo $content
}

import os

folders_to_find = ["~/timeline",
                  "~/doc",
                  "~/Library/Mobile Documents/com~apple~CloudDocs"]
def findres(folder):
    for dirpath, dirnames, filenames in os.walk(folder):
        # f.write(':' + dirpath + '\n') # 目录
        for filename in filenames:
            if filename[0] == '.':
                continue
            ext = os.path.splitext(filename)[1].lower()
            if ext in [".ass", ".srt", ".ssa"]:
                continue
            f.write(':' + os.path.join(dirpath, filename) + '\n') # 这里\n 与mac下sl命令 好兼容,\r\n 不兼容
f = open(os.path.expanduser("~/mkres"),"w")
for folder in folders_to_find:
    findres(os.path.expanduser(folder))
f.close()

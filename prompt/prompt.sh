#!/bin/bash

# 配置
promptDir=$HOME/code/git/build_dev_env/prompt/

# 导入公共函数
source $promptDir/func.sh

case "$1" in
  "comma2excel")
    content=$(getClipboard)
    python $promptDir/comma2excel.py "$content" | clip
    echo "已转化为excel格式并复制到剪切板"
  ;;
  "i18n")
    source $promptDir/genI18n.sh | iconv -f UTF-8 -t GBK | clip
    echo "已生成prompt并复制到剪切板"
  ;;
  # 代码评审： gf master | prt review
  "review")
    source $promptDir/codeReview.sh | iconv -f UTF-8 -t GBK | clip
    echo "已生成prompt并复制到剪切板"
  ;;
  "rename")
    echo "
我现在需要重命名文件，请根据我提供的ls信息，生成一系列mv指令。
生成的原则是
1. jpeg 转为jpg
2. 扩展名为小写
3. 时间为250611- 或2506-或 25- 几种形式
4. 用-而非_或.分隔
比如ls为：
\`\`\`
./
../
250520-小蜜蜂英语-A.mp4
250520小蜜蜂英语B.MP4
250524小蜜蜂英语A.MP4
250605读英语.MOV
\`\`\`
你需要生成：
\`\`\`
mv 250520小蜜蜂英语B.MP4 250520-小蜜蜂英语-B.mp4;
mv 250524小蜜蜂英语A.MP4 250524-小蜜蜂英语-A.mp4;
mv 250605读英语.MOV 250605-读英语.mov;
\`\`\`
以下是ls
\`\`\`
" > ~/.stmp

    # 将ls结果追加到文件
    ls >> ~/.stmp
    echo '```' >> ~/.stmp
    cat ~/.stmp | pbcopy
    echo "重命名提示词已复制到剪贴板"
  ;;

  "push")
        # 执行git push
        if command -v git > /dev/null; then
            echo "执行 git push..."
            git push
        else
            echo "错误: 未找到git命令"
            exit 1
        fi
        ;;
    *)
        echo "错误: 无效的参数"
        echo "用法: $0 [rename|push]"
        exit 1
        ;;
esac

exit 0

#!/bin/bash

echo "检查远程和本地各分支是否已合并main"
echo "====================================================="

# 更新远程分支信息
git fetch --all --prune -q

# 获取所有分支(本地和远程)
branches=$(git branch -a | grep -v -E 'main' | sed -e 's/^\s*//' -e 's/^\*\s//' -e 's/^remotes\///')

for branch in $branches
  do 
    # 无需检查的分支
    if [[ "$branch" =~ ^(test|origin/test)$ ]]; then
      continue
    fi
   
    # 检查分支是否已合并到main
    if git merge-base --is-ancestor $branch origin/main; then
      echo " ✓ $branch: 已合并"
    else
      echo -e "\033[41m ✗ $branch: 未合并 \033[0m"
    fi
  done

echo "====================================================="
echo "检查完成 请核对是否有分支\033[30;43m 漏合入 \033[0m"

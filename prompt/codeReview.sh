# 默认review
if [ -z "$2" ]; then
  echo -e "你是前端代码评审专家，请从以下几方面评审git diff代码更改：
1. Vue 最佳实践
2. 性能问题： 内存泄露，不必要DOM操作。
3. 逻辑问题：死循环，新增代码是否存在边界条件处理不足，错误处理，异常捕获。
4. 样式问题：全局样式污染，CSS非法属性值。
5. 维护问题：圈复杂度过高，冗余代码，域名写死。
6. 代码规范：数据隐式转换（包括严格相等），switch case 缺失break, 变量命名不规范。
7. 潜在Bug

git diff如下
  "
# 安全review
elif [ "$2" = "sec" ]; then
  echo -e "你是一个高级前端代码安全审计专家，请按照以下规范评估提交的git diff 代码更改：
  安全性问题：是否存在XSS, SSRF, 硬编码，不安全跳转（构造动态跳转链接）。
git diff如下
  "
fi

if [ -t 0 ]; then # 如果没有管道输入
  git diff | cleanGitDiff
else
  cat | cleanGitDiff
fi

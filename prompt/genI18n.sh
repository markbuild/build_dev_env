echo -e "需要生成国际化配置，生成的格式如下
mk.apply.for.permission.now, 立即申请权限, zh_CN
mk.apply.for.permission.now, Apply for Permission, en_US
key, 英文值, en_US

现在根据以下内容来生成上面的格式的国际化配置

要生成国际化的key从上下文提取:
如果key是中文要求翻译成mk.开头的英文, 单词用.连起来
"
git diff | grep ^+ | grep "\$t('"

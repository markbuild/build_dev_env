# 按行分割
lines = content.split('\n')

# 过滤包含逗号的行，并将逗号替换为制表符
excel_rows = [
    line.replace(',', '\t')
    for line in lines
    if ',' in line
]

# 输出结果，每行用换行符分隔
print('\n'.join(excel_rows))

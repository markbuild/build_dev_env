const fs = require('fs');
const path = require('path');
const os = require('os');

// 配置
const foldersToScan = [
    '~/timeline',
    '~/webHistory',
    '~/Library/Mobile Documents/com~apple~CloudDocs'
];

const excludedExtensions = new Set(['.ass', '.srt', '.ssa']);

// 展开用户目录路径
function expandPath(filePath) {
    return filePath.replace(/^~/, os.homedir());
}

// 递归扫描目录
function scanDirectory(dirPath, writeStream) {
    try {
        const entries = fs.readdirSync(dirPath, { withFileTypes: true });
        
        for (const entry of entries) {
            const fullPath = path.join(dirPath, entry.name);
            
            if (entry.isDirectory()) {
                // 递归扫描子目录
                scanDirectory(fullPath, writeStream);
            } else if (entry.isFile()) {
                // 跳过隐藏文件
                if (entry.name.startsWith('.')) {
                    continue;
                }
                
                // 检查文件扩展名
                const ext = path.extname(entry.name).toLowerCase();
                if (excludedExtensions.has(ext)) {
                    continue;
                }
                
                writeStream.write(`${fullPath}\n`);
            }
        }
    } catch (error) {
        if (error.code === 'EACCES') {
            console.warn(`警告: 无权限访问 ${dirPath}，跳过`);
        } else if (error.code !== 'ENOENT') {
            console.warn(`扫描 ${dirPath} 时出错: ${error.message}`);
        }
    }
}

// 主函数
function main() {
    const outputFile = expandPath('~/mkres');  // 直接输出到当前目录的 mkres 文件
    
    try {
        const writeStream = fs.createWriteStream(outputFile, { encoding: 'utf8' });
        
        for (const folder of foldersToScan) {
            const folderPath = expandPath(folder);
            
            // 检查文件夹是否存在
            try {
                fs.accessSync(folderPath);
                console.log(`扫描: ${folderPath}`);
                scanDirectory(folderPath, writeStream);
            } catch (error) {
                console.warn(`警告: 文件夹 ${folderPath} 不存在，跳过`);
            }
        }
        
        writeStream.end();
        console.log(`扫描完成，结果已保存到 ${path.resolve(outputFile)}`);
        
    } catch (error) {
        console.error(`创建输出文件失败: ${error.message}`);
        process.exit(1);
    }
}

// 执行主函数
main();

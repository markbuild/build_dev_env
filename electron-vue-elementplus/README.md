# electron-vue-hello

Electron + Vue3 + TypeScript + Element Plus + Bun 的桌面 Hello World 应用。
顶部三个 Tab（tab1 / tab2 / tab3），分别显示 content1 / content2 / content3，样式用 Less 编写。

## 项目结构

```
electron-vue-hello/
├─ src/
│  ├─ main/                 # Electron 主进程
│  │  └─ index.ts
│  ├─ preload/               # 预加载脚本
│  │  └─ index.ts
│  └─ renderer/               # 渲染进程 (Vue3 页面)
│     ├─ index.html
│     └─ src/
│        ├─ main.ts
│        ├─ App.vue          # 三个 Tab 的主界面
│        └─ styles/
│           └─ global.less
├─ electron.vite.config.ts   # electron-vite 构建配置
├─ tsconfig.json / tsconfig.node.json / tsconfig.web.json
└─ package.json               # 含 electron-builder 打包配置(mac + windows)
```

## 环境要求

- 安装 [Bun](https://bun.sh)（`curl -fsSL https://bun.sh/install | bash`）
- Node.js 18+（Electron 依赖，Bun 会自动使用系统 Node 运行部分工具链）
- 打包 mac 版建议在 macOS 上执行（跨平台打包 mac 包在 Windows/Linux 上有诸多限制，尤其涉及签名和 dmg）
- 打包 windows 版可以在 Windows 上执行，也可以在 macOS/Linux 上执行（electron-builder 支持用 Wine 交叉打包 nsis）

## 安装依赖

```bash
bun install
```

## 本地开发（热更新调试）

```bash
bun run dev
```

会弹出 Electron 窗口，加载 Vue 页面，保存代码后自动刷新。

## 打包成可执行文件

```bash
# 打包 macOS 版本 (.dmg / .zip)，建议在 macOS 机器上运行
bun run build:mac

# 打包 Windows 版本 (安装包 .exe / .zip)
bun run build:win

# 同时打包 mac 和 win（需要满足对应平台的打包环境/工具，比如 macOS 打包最好在 mac 上）
bun run build:all
```

打包产物默认输出在 `dist/` 目录下：
- macOS: `dist/ElectronVueHello-x.x.x.dmg`、`dist/ElectronVueHello-x.x.x-mac.zip`
- Windows: `dist/ElectronVueHello Setup x.x.x.exe`、对应 zip 包

## 说明

- 打包配置写在根目录 `package.json` 的 `"build"` 字段里（`electron-builder` 会读取），你可以按需修改 `appId`、`productName`、图标（在 `build/` 目录放 `icon.icns` / `icon.ico`）等。
- 应用图标：目前没有放自定义图标，electron-builder 会使用默认图标。如果需要自定义，把 `icon.icns`（mac）和 `icon.ico`（windows）放进 `build/` 目录，electron-builder 会自动识别。
- 三个 Tab 的内容在 `src/renderer/src/App.vue` 里的 `tabs` 数组定义，改这里即可增删 Tab 或替换文案。
- 全局样式在 `src/renderer/src/styles/global.less`，组件内样式在 `App.vue` 的 `<style lang="less" scoped>` 里，均已验证 Less 编译正常。

## 已在本地验证

本项目已经过一次 `npm install` + `electron-vite build` 的完整构建验证（渲染进程 Vue+Less+TS 编译、主进程/预加载 TS 编译均通过），配置本身是可用的。由于打包 mac/win 二进制依赖具体操作系统环境（尤其 mac 签名、Windows NSIS），请在本地对应系统上执行 `bun run build:mac` / `bun run build:win` 生成最终可执行文件。

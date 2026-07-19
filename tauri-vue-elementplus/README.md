# Tauri + Vue3 + TS + Element Plus + Bun 桌面 Hello World

顶部三个 Tab（tab1/tab2/tab3），分别显示 content1/content2/content3，样式用 Less 写。

## 环境要求（在 Mac 和 Windows 上各自安装一次）

- [Bun](https://bun.sh)：`curl -fsSL https://bun.sh/install | bash`（Windows 用 PowerShell 安装命令，见官网）
- [Rust](https://www.rust-lang.org/tools/install)
- Tauri 系统依赖：
  - **macOS**：Xcode Command Line Tools（`xcode-select --install`）
  - **Windows**：Visual Studio 2022 生成工具（勾选 "使用 C++ 的桌面开发"）以及 WebView2（Win10/11 通常已自带）

## 安装依赖

```bash
bun install
```

## 生成正式图标（首次构建前执行一次）

仓库里 `src-tauri/icons/` 只放了占位 PNG，构建前用 Tauri 官方工具从一张源图生成全平台图标（会自动生成 `.icns`、`.ico` 等）：

```bash
bun x tauri icon src-tauri/icons/icon.png
```

如果你有自己的 logo，替换 `icon.png`（建议 1024x1024）后再执行上面这条命令即可。

## 开发调试

```bash
bun run tauri dev
```

## 打包成可执行文件

**在 macOS 上执行**（生成 `.app` / `.dmg`）：

```bash
bun run tauri build
```

产物在：`src-tauri/target/release/bundle/macos/` 和 `src-tauri/target/release/bundle/dmg/`

**在 Windows 上执行**（生成 `.exe` / `.msi`）：

```bash
bun run tauri build
```

产物在：`src-tauri\target\release\bundle\msi\` 和 `src-tauri\target\release\bundle\nsis\`

> 说明：Tauri 应用需要各自平台的系统 WebView（macOS 用 WKWebView，Windows 用 WebView2），因此**必须在对应系统上分别构建**，无法在 Linux 上一次性交叉编译出 Mac 和 Windows 的产物。这是 Tauri/桌面 GUI 应用的普遍限制，不是本项目代码的问题。

## 目录结构

```
tauri-hello-world/
├── src/                  # Vue3 前端
│   ├── App.vue           # 三个 Tab + Less 样式
│   ├── main.ts
│   └── vite-env.d.ts
├── src-tauri/            # Rust + Tauri 后端
│   ├── src/
│   │   ├── main.rs
│   │   └── lib.rs
│   ├── icons/
│   ├── capabilities/default.json
│   ├── Cargo.toml
│   └── tauri.conf.json
├── index.html
├── vite.config.ts
├── package.json
└── tsconfig.json
```

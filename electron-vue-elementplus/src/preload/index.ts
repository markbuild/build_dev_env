import { contextBridge } from 'electron'

// 预留：以后如果渲染进程需要调用主进程能力，可以在这里通过 contextBridge 暴露 API
const api = {
  platform: process.platform
}

try {
  contextBridge.exposeInMainWorld('api', api)
} catch (error) {
  console.error(error)
}

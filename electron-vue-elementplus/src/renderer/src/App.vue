<script setup lang="ts">
import { ref } from 'vue'

const activeTab = ref('tab1')

const tabs = [
  { name: 'tab1', label: 'Tab1', content: 'content1' },
  { name: 'tab2', label: 'Tab2', content: 'content2' },
  { name: 'tab3', label: 'Tab3', content: 'content3' }
]
</script>

<template>
  <div class="app-container">
    <header class="app-header">
      <h1>Hello World 👋</h1>
      <p class="subtitle">Electron + Vue3 + TypeScript + Element Plus</p>
    </header>

    <el-tabs v-model="activeTab" class="app-tabs" type="border-card">
      <el-tab-pane v-for="tab in tabs" :key="tab.name" :label="tab.label" :name="tab.name">
        <div class="tab-content">
          {{ tab.content }}
        </div>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<style lang="less" scoped>
@primary-color: #409eff;
@text-color: #303133;
@card-radius: 8px;

.app-container {
  display: flex;
  flex-direction: column;
  height: 100%;
  padding: 24px;
}

.app-header {
  text-align: center;
  margin-bottom: 20px;

  h1 {
    margin: 0;
    color: @text-color;
    font-size: 26px;
  }

  .subtitle {
    margin-top: 6px;
    color: darken(@primary-color, 5%);
    font-size: 13px;
  }
}

.app-tabs {
  flex: 1;
  border-radius: @card-radius;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);

  .tab-content {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 300px;
    font-size: 22px;
    font-weight: 600;
    color: @primary-color;
    letter-spacing: 1px;
  }
}
</style>

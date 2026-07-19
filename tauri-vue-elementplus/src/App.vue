<script setup lang="ts">
import { ref } from "vue";

const activeTab = ref("tab1");

const tabs = [
  { name: "tab1", label: "Tab1", content: "Content1" },
  { name: "tab2", label: "Tab2", content: "Content2" },
  { name: "tab3", label: "Tab3", content: "Content3" },
];
</script>

<template>
  <div class="app-container">
    <header class="app-header">
      <h1>Hello World</h1>
    </header>

    <el-tabs v-model="activeTab" class="app-tabs">
      <el-tab-pane
        v-for="tab in tabs"
        :key="tab.name"
        :label="tab.label"
        :name="tab.name"
      >
        <div class="tab-content">
          {{ tab.content }}
        </div>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<style lang="less">
@primary-color: #409eff;
@bg-color: #f5f7fa;
@text-color: #303133;

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
    sans-serif;
}

.app-container {
  height: 100vh;
  display: flex;
  flex-direction: column;
  background-color: @bg-color;
  box-sizing: border-box;
  padding: 20px;

  .app-header {
    text-align: center;
    margin-bottom: 16px;

    h1 {
      color: @primary-color;
      font-size: 24px;
      margin: 0;
    }
  }

  .app-tabs {
    flex: 1;
    background: #fff;
    border-radius: 8px;
    padding: 12px 20px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);

    .tab-content {
      padding: 40px;
      text-align: center;
      font-size: 20px;
      color: @text-color;
      border: 1px dashed darken(@bg-color, 15%);
      border-radius: 6px;
    }
  }
}
</style>

<template>
  <view class="box">
    <text class="circle"></text>
    <text>刷卡的环境卡上打卡上贷记卡上课的萨卡活动空间啊啥的卡上</text>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
const title = ref('Hello')
function forTest() {
  console.log('forTest')
}
forTest()
getCurrentPages().forEach((page: Page.PageInstance): void => {
  console.log(page.route)
})
</script>

<style>
.box {
  display: flex;
  flex-direction: row;
  align-items: center;
}

.circle {
  margin-right: 10px;
  width: 20px;
  height: 20px;
  border-radius: 10px;
  background-color: red;
}

.content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.logo {
  height: 200rpx;
  width: 200rpx;
  margin-top: 200rpx;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 50rpx;
}

.text-area {
  display: flex;
  justify-content: center;
}

.title {
  font-size: 36rpx;
  color: #8f8f94;
}
</style>

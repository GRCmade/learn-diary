<template>
  		<view v-for="(item,index) in list" :key="index">
			<view @click="click(item)">
				{{ item }}
			</view>
		</view>
		<button @click="GetInfo">GetInfo</button>
</template>

<script setup lang="ts">
import { ref,Ref } from 'vue'
type Item = {
		name : string
		select : boolean
	}
	let item : Item = {
		name: "yuhe",
		select: false
	}
	const list = ref<Item[]>([])
	list.value.push(item)
	list.value.push(item)
	list.value.push(item)
	const click = (item : Item) => {
		item.select = !item.select
	}
	const GetInfo = () => {
		console.log(list.value)
	}
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

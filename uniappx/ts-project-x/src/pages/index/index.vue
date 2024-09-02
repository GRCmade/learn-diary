<template>
	<view v-for="(item, index) in list" :key="index">
		<view @click="click({ name: item, index: index } as clickItem)">
			{{ item + index }}
		</view>
	</view>
	<button @click="GetInfo">GetInfo</button>
	<com-nav></com-nav>
</template>

<script setup lang="ts">
import comNav from "@/components/com-nav/com-nav"
import { ref, Ref } from 'vue'

type clickItem  = {
	name: string
	index: number
}

type Item = {
	name: string
	select: boolean
}
let item: Item = {
	name: "yuhe",
	select: false
}
// const list = ref<Item[]>([])
const list = ref(["yuhe", "yuhe1"])
// list.value.push(item)
// list.value.push(item)
// list.value.push(item)
const click = (which: any) => {
	// item.select = !item.select
	console.log(which)
}
const GetInfo = () => {
	console.log(list.value)
}

// console.log(list?.yuhe)

let resolveType: ResolveType = "yuhe888"
console.log(resolveType)
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

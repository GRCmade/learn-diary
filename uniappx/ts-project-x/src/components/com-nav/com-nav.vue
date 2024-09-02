<template>
	<view>
		<view v-for="(item, index) in list" :key="index">
			<button class="but" size="mini" type="primary" @click="nav(item)">{{ item }}</button>
		</view>
	</view>
</template>

<script lang="ts">
export default {
	name: "com-nav",
	data() {
		return {
			list: ["navigateTo", "redirectTo"]
		};
	},
	methods: {
		nav(item: string) {
			console.log(item)
			let callback = {
				url: "/pages/test/test",
				success(e: any) {
					console.log("success", e)
				},
				fail(e: any) {
					console.log("fail", e)
				},
				complete(e: any) {
					console.log("complete", e)
				}
			}

			switch (item) {
				case "navigateTo": uni.navigateTo(callback)
					break;
				case "redirectTo": uni.redirectTo(callback)
					break;
				default: uni.navigateTo(callback)
			}
		}
	}
}
</script>

<style>
.but {
	width: 100px;
	margin: 10px;
}
</style>
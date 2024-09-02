<template>
	<view>

	</view>
</template>

<script>
export default {
	name: "com-nav",
	data() {
		return {
			list: ["navigateTo", "redirectTo"]
		};
	},
	methods: {
		nav() {
			uni.navigateTo({
				url: `/pages/test/test`
			});
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
<template>
	<div>
	  <div v-for="(value, key) in udata" :key="key">
		<strong>{{ key }}:</strong> {{ value }}
	  </div>
	</div>
  </template>
  
  <script setup lang="ts">
  const udata = {  
	"code": 1,  
	"msg": "系统配置查询",  
	"time": "1728048497",  
	"data": {  
	  "name1": "同城之旅",  
	  "name2": "同城之旅",  
	  "name3": "同城之旅",  
	  "name4": "同城之旅"  
	}  
  }
  </script>
  
  <style>
  </style>
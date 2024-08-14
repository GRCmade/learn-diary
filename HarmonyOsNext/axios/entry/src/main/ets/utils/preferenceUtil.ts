import preferences from '@ohos.data.preferences'
import { JSON } from '@kit.ArkTS'

class preferenceUtil {
  // 一个临时存储用的Map
  prefMap:Map<string,preferences.Preferences> = new Map()

  loadPreference(context,name:string){
    preferences.getPreferences(context,name).then(res=>{
      console.log(`preferences[${name}]创建成功`)
      this.prefMap.set(name,res)
    }).catch(reason =>{
      console.log(`preferences[${name}]创建失败 ${JSON.stringify(reason)}`)
    })
  }

  async putPreference(name:string,key:string,value:preferences.ValueType){
    if (this.prefMap.has(name)) {
      let preference:preferences.Preferences = this.prefMap.get(name)
      await preference.put(key,value)
      await preference.flush()
      console.log(`${name}的${key}存储${value.toString()}成功`)
    }else{
      console.log(`${name}尚未进行初始化`)
    }
  }
  async getPreference(name:string,key:string,defaultValue:preferences.ValueType){
    if (this.prefMap.has(name)) {
      let preference:preferences.Preferences = this.prefMap.get(name)
      let value = await preference.get(key,defaultValue)
      // TODO 非常傻逼,如果失败,value会变成defaultValue
      console.log(`${name}的${key}获取${value.toString()}成功`)
      return value
    }else{
      console.log(`${name}尚未进行初始化`)
    }
  }
}

let myPreference = new preferenceUtil()

export default myPreference
import { common, Want, wantConstant } from '@kit.AbilityKit'

@Entry
@Component
struct documentPage{
  private context = getContext(this) as common.UIAbilityContext
  onPageShow(): void {
    // TODO 不知道怎么在页面中接受want的参数,只能用globalThis来接收
    console.log(globalThis.inkey)
  }
  build() {
    Row(){
      Column(){
        Row() {
          Text('<返回')
            .onClick(()=>{
              let want:Want = {
                // 给空为当前设备
                deviceId:'',
                // 应用名称
                bundleName:'com.example.specified',
                // 模块名称
                moduleName:'entry',
                // 跳转位置(去往)
                abilityName:'EntryAbility'
              }
              this.context.startAbility(want)
            })
          Text(`文档:${globalThis.inkey}`)
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        Row(){
          Text('主要的文章内容')
        }
        .margin({top:50})
      }
    }
  }
}
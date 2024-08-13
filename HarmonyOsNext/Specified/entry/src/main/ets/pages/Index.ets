import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'

class Document{
  id:number
  name:string

  constructor(id: number, name: string) {
    this.id = id
    this.name = name
  }
}

@Entry
@Component
struct Index {
  @State message: string = 'specified(多实例)';

  @State docList:Document[] = [] ;

  build() {
    Column() {
      Button('新建文档')
        .onClick(()=>{
          console.log("click")
          this.docList.push(new Document(this.docList.length,`文档:${this.docList.length}`))
        })

      ForEach(this.docList,(item:Document)=>{
        documentListItem({ Id: item.id, name: item.name })
      })
    }
    .width('100%')
    .margin({top:30})
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct documentListItem{
  @Prop Id:number
  @Prop name:string
  // 用于specified
  private context = getContext(this) as common.UIAbilityContext

  build() {
    Row() {
      Text(`doc_${this.Id}`)
        .fontSize(20)
        .fontColor("#fff")
      Text(this.name)
        .fontSize(20)
        .fontColor("#fff")
    }
    .onClick(()=>{
      // 跳转的目的地
      let want:Want = {
        // 给空为当前设备
        deviceId:'',
        // 应用名称
        bundleName:'com.example.specified',
        // 模块名称(来自)
        moduleName:'entry',
        // 跳转位置(去往)
        abilityName:'DocumentAbility',
        parameters:{
          key:this.Id
        }
      }
      this.context.startAbility(want)
    })
    .width('80%')
    .margin(10)
    .borderRadius(20)
    .height(40)
    .backgroundColor("#36D")
    .justifyContent(FlexAlign.SpaceAround)
  }
}
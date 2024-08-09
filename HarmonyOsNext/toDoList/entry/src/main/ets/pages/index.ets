import { MyRowModifier } from '../style/globalStyle'
import { router } from '@kit.ArkUI'

class routerItem {
  name:string
  url:string

  constructor(name:string,url:string) {
    this.name = name
    this.url = url
  }
}

const Router:Array<routerItem> = [
  new routerItem("TODO页面",'pages/propPage'),
]

@Entry
@Component
struct Index{
  // TODO 使用全局样式
  @State myRowModifier: MyRowModifier = new MyRowModifier()

  build() {
    Column(){
      ForEach(Router,(item:routerItem,index)=>{
        Row(){
          Text(item.name)
        }
        .onClick(()=>{
          router.pushUrl({url:item.url})
        })
      })
    }
    .padding({top:10,bottom:10})
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F2F3')
  }
}
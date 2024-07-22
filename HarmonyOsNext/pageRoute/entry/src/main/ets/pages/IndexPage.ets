import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello IndexPage';

  build() {
    Row(){
      Column(){
        Text(this.message)
          .id('HelloWorld')
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
        Blank()
        Button("next",{type:ButtonType.Capsule})
          .onClick(()=>{
            console.log("console from button");
            router.pushUrl({
              url:"pages/secondPage"
            })
          })
          .width('70%')
          .margin({top:30})
      }
      .width("100%")
    }
    .height('100%')
    .width('100%')
  }
}
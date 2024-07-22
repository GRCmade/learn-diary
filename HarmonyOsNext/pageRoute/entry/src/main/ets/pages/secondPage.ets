import { router } from '@kit.ArkUI';

@Entry
@Component
struct SecondPage {
  @State message: string = 'secondPage';

  build() {
    Row(){
      Column(){
        Text(this.message)
          .id('SecondPageHelloWorld')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
        Button("back",{ type: ButtonType.Normal, stateEffect: true })
          .onClick(()=>{
            router.back()
          })

      }
      .width('100%')
    }
    .height('100%')
    .width('100%')
  }
}
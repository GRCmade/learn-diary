import { httpRequestGet } from "./httpUtils"
import { http } from '@kit.NetworkKit';
import ResponseResult from './requestResult';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State url:string = 'https://fc-mp-701e6f43-b3d1-467b-be68-d24d7eaaa29a.next.bspapp.com/testrequest/harmony'
  onPageShow(): void {
    httpRequestGet(this.url).then((e:ResponseResult)=>{
      console.log("yuhe",JSON.stringify(e))
    })
  }
  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}


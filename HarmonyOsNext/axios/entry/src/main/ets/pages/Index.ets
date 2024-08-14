import axios, { AxiosResponse } from '@ohos/axios';

interface  axiosInfo {
  code:number,
  msg:string
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  onPageShow(): void {
    // 使用axios
   axios.get('https://fc-mp-701e6f43-b3d1-467b-be68-d24d7eaaa29a.next.bspapp.com/ask/harmonyAxios').then((res:AxiosResponse<axiosInfo>)=>{
     console.log(res.data.msg)
     console.log(res.data.code.toFixed())
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
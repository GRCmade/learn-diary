import axios, { AxiosResponse } from '@ohos/axios';
import myPreference from '../utils/preferenceUtil';

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
   // axios.get('https://fc-mp-701e6f43-b3d1-467b-be68-d24d7eaaa29a.next.bspapp.com/ask/harmonyAxios').then((res:AxiosResponse<axiosInfo>)=>{
   //   console.log(res.data.msg)
   //   console.log(res.data.code.toFixed())
   // })
  }
  build() {
    Column({space:50}) {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('获取数据并存储')
        .onClick(()=>{
          axios.get('https://fc-mp-701e6f43-b3d1-467b-be68-d24d7eaaa29a.next.bspapp.com/ask/harmonyAxios').then((res:AxiosResponse<axiosInfo>)=>{
              console.log(res.data.msg)
              console.log(res.data.code.toFixed())
              myPreference.putPreference("entryAbility",res.data.code.toFixed(),res.data.msg)
            })
        })
      Button('获取存储的数据')
        .onClick(()=>{
          myPreference.getPreference("entryAbility","1723648906824",1)
        })
    }
    .height('100%')
    .width('100%')
  }
}
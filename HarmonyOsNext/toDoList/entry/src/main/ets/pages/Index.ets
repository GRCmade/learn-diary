import { SelectOptions } from '@kit.ArkUI'

@Styles function card(){
  .width('90%')
  .backgroundColor(Color.White)
  .padding(20)
  .borderRadius(15)
  .shadow({radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4})
}

class taskItem{
  static id: number = 1
  // 任务名称
  name: string = `任务${taskItem.id++}`
  finish:boolean=false
}
class taskState{
  finish:number = 0
  all:number = 0
}

@Entry
@Component
struct Index {
  @State tasks:Array<taskItem> = []
  @State taskState:taskState = new taskState()

  build() {
    Column({space:10}) {
      staticTaskList({finish:this.taskState.finish,all:this.taskState.all})
      Button('增加任务').onClick((event: ClickEvent) => {
        this.tasks.push(new taskItem())
        this.taskState.all = this.tasks.length
      })
      List({space:10}){
        ForEach(this.tasks,(item:taskItem,index)=>{
          ListItem(){
            Row(){
              Text(item.name)
              Checkbox()
                // TODO 未完成双向绑定
                .select(item.finish)
                .shape(CheckBoxShape.ROUNDED_SQUARE)
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .card()
            .onClick(()=>{
              this.tasks[index].finish = !this.tasks[index].finish
              this.taskState.finish = this.tasks.filter((item)=>item.finish).length
              console.log(this.taskState.finish.toFixed())
            })
          }
          .align(Alignment.Center)
          .width("100%")
        })
      }
    }
    .padding({top:10,bottom:10})
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F2F3')
  }
}

@Component
struct staticTaskList{
  name:string = "任务进度："
  @Prop finish:number
  @Prop all:number

  build() {
    Row(){
      Text(this.name)
        .fontSize(30)
      Stack(){
        Progress({
          value:this.finish,
          total:this.all,
          type:ProgressType.Ring
        })
          .width(100)
        Row(){
          Text(`${this.finish?.toFixed()}/${this.all?.toFixed()}`)
            .fontSize(24)
        }
      }

    }
    .card()
    .justifyContent(FlexAlign.SpaceBetween)
  }
}










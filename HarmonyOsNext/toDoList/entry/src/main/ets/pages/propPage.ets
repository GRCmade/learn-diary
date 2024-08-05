import { SelectOptions } from '@kit.ArkUI'

@Styles function card(){
  .width('90%')
  .backgroundColor(Color.White)
  .padding(20)
  .borderRadius(15)
  .shadow({radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4})
}
// TODO Observed 表示要监听这个对象，可以使用observedLink
@Observed
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
struct propPage {
  // @State tasks:Array<taskItem> = []
  // @State taskState:taskState = new taskState()

  // TODO Provide 相当于vue中的跨组建传惨
  @Provide tasks:Array<taskItem> = []
  @Provide taskState:taskState = new taskState()

  build() {
    Column({space:10}) {
      // staticTaskList({finish:this.taskState.finish,all:this.taskState.all})
      // taskListBody({tasks:this.tasks,taskState:this.taskState})
      staticTaskList()
      taskListBody()
    }
    .padding({top:10,bottom:10})
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F2F3')
  }
}

@Component
struct taskListBody{
  // TODO Link是双向绑定
  // @Link tasks:Array<taskItem>
  // @Link taskState:taskState
  // TODO consume 相当于跨组件接受参数
  @Consume tasks:Array<taskItem>
  @Consume taskState:taskState

  HandleChange():void{
    this.taskState.finish = this.tasks.filter((item)=>item.finish).length
  }

  build() {
    Column(){
      Button('增加任务').onClick((event: ClickEvent) => {
        this.tasks.push(new taskItem())
        this.taskState.all = this.tasks.length
      })
      List({space:10}){
        ForEach(this.tasks,(item:taskItem,index)=>{
          ListItem(){
            // TODO 传递函数时有this，需要使用bindThis
            taskListBodyItem({item:item,taskChange:this.HandleChange.bind(this)})
          }
          .align(Alignment.Center)
          .width("100%")
        })
      }
    }
  }
}

@Component
struct taskListBodyItem{
  // TODO ObjectLInk 可以使数组/对象内部的属性产生双向绑定
  @ObjectLink item:taskItem;
  // TODO 组件传递函数，需要初始化
  taskChange:()=>void = ()=>{};
  build() {
    Row(){
    Text(this.item.name)
    Checkbox()
      .select(this.item.finish)
      .shape(CheckBoxShape.ROUNDED_SQUARE)
  }
  .onClick(()=>{
    this.item.finish = !this.item.finish
    this.taskChange()
  })
  .justifyContent(FlexAlign.SpaceBetween)
  .card()
  }
}


@Component
struct staticTaskList{
  name:string = "任务进度："
  // @Prop finish:number
  // @Prop all:number
  @Consume taskState:taskState

  build() {
    Row(){
      Text(this.name)
        .fontSize(30)
      Stack(){
        Progress({
          value:this.taskState.finish,
          total:this.taskState.all,
          type:ProgressType.Ring
        })
          .width(100)
        Row(){
          Text(`${this.taskState.finish?.toFixed()}/${this.taskState.all?.toFixed()}`)
            .fontSize(24)
        }
      }

    }
    .card()
    .justifyContent(FlexAlign.SpaceBetween)
  }
}










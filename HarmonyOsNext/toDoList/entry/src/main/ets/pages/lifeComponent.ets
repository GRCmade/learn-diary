@Entry
@Component
struct lifeComponent{
  @State arr:string[] = [];
  build() {
    // TODO column默认就是居中，但是宽度不会撑开，因此一开始是不显示的
    Column({space:20}){
      Button('新增列表项')
        .onClick(()=>{
          this.arr.push(`listItem:${this.arr.length}`)
        })
      ForEach(this.arr,(item:string,index)=>{
        myText({name:item,index:index,delete:this.delete.bind(this)})
      })
    }
    .width('100%')
  }
  delete(index:number){
    this.arr.splice(index, 1)
  }
}

@Component
struct myText{
  @Prop name:string
  @Prop index:number
  delete:(index:number)=>void = ()=>{}
  tag: string = 'lifeComponent Page'

  aboutToAppear(){
    console.log(this.tag,this.name, 'about to appear')
  }

  onPageShow(){
    console.log(this.tag,this.name, 'on page show')
  }

  onBackPress(){
    console.log(this.tag,this.name, 'on back press')
  }

  onPageHide(){
    console.log(this.tag,this.name, 'on page hide')
  }

  // TODO about to disappear 时会产生一个现象，会销毁其它组件
  aboutToDisappear(){
    console.log(this.tag,this.name, 'about to disappear')
  }

  build() {
    Row(){
      Text(this.name)
      Button('删除')
        .width(100)
        .onClick(()=>{
          this.delete(this.index)
        })
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceAround)
  }
}
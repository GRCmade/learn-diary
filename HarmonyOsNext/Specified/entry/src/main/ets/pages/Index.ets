
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
  build() {
    Row() {
      Text(`doc_${this.Id}`)
        .fontSize(20)
        .fontColor("#fff")
      Text(this.name)
        .fontSize(20)
        .fontColor("#fff")
    }
    .width('80%')
    .margin(10)
    .borderRadius(20)
    .height(40)
    .backgroundColor("#36D")
    .justifyContent(FlexAlign.SpaceAround)
  }
}
@Extend(TextInput) function inputStyle(){
  .width(250)
  .backgroundColor('#36D')
  .type(InputType.Number)
}

class Person {
  name:string
  age:number
  girlFriend?:Person

  constructor(name:string,age:number,gf?:Person) {
    this.name = name
    this.age = age
    this.girlFriend = gf
  }
}

@Entry
@Component
struct Index {
  @State imageWidth: number = 200;
  @State yuHe:Person = new Person('yuHe',20,new Person('zfy',18))
  @Styles style(){
    .backgroundColor("#000")
  }
  build() {
    Row() {
      Column({space:30}){
        Text(`${this.yuHe.name} - ${this.yuHe.age}`)
          .fontSize(30)
        Text(`${this.yuHe.girlFriend?.name} - ${this.yuHe.girlFriend?.age}`)
          .fontSize(30)
        Image($r('app.media.pic'))
          .width(this.imageWidth)
          .interpolation(ImageInterpolation.High)

        Text($r('app.string.width_label'))
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        TextInput({text: this.imageWidth.toFixed(0)})
          .inputStyle()
          .onChange(value=>{
            console.log(value)
            this.imageWidth = parseInt(value)
          })
        Slider({
          min:100,
          max:300,
          value:this.imageWidth,
          step:10,
          style:SliderStyle.OutSet
        })
          .onChange(value=>{
            this.imageWidth = value
          })
          .width('90%')
          .blockColor('#36D')
          .trackThickness(7)
          .showTips(true)
      }
      .width('100%')
    }
    .height('100%')
  }
}
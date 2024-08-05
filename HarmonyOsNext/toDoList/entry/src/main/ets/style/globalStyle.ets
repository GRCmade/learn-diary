
// TODO 全局样式
export class MyRowModifier implements AttributeModifier<RowAttribute> {
  applyNormalAttribute(instance: RowAttribute): void {
    instance.width('90%')
    instance.borderRadius(15)
    instance.backgroundColor(Color.White)
    instance.padding(20)
    instance.shadow({radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4})
  }
}

// @Styles function card(){
//   .width('90%')
//   .backgroundColor(Color.White)
//   .padding(20)
//   .borderRadius(15)
//   .shadow({radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4})
// }
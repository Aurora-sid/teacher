import router from '@ohos.router'

@Entry
@Component
struct MySuggestion {
  @State message: string = '我的建议'

  build() {
    Row() {
      Column() {
        Row() {
          Image($r('app.media.left'))
            .width(25)
            .onClick(()=>{router.back()})

          Text("我的建议")
            .fontSize(20)
            .margin({ left: 100 })
        }
        .width('100%')
        .height('10%')
        .backgroundColor(Color.Red)
        .justifyContent(FlexAlign.Start)
        .padding(10)


        Row() {
          Column() {
            Row(){
              Column() {
                Text("选择科目:")
                  .fontSize(20)
              }
              .width('50%')
              .height('100%')
              .alignItems(HorizontalAlign.Center)
              .justifyContent(FlexAlign.Center)

              Column() {
                Select([{ value: 'aaa', icon: $r('app.media.QQ') },
                  { value: 'bbb', icon: $r('app.media.QQ') },
                  { value: 'ccc', icon: $r('app.media.QQ') },
                  { value: 'ddd', icon: $r('app.media.QQ') }])
                  .selected(8)
                  .value('请选择')
                  .font({ size: 16, weight: 500 })
                  .fontColor('#182431')
                  .selectedOptionFont({ size: 16, weight: 400 })
                  .optionFont({ size: 16, weight: 400 })
                  .onSelect((index: number) => {
                    console.info('Select:' + index)
                  })
                  .height(40)
                  .width(150)
                  .borderStyle(BorderStyle.Solid)
                  .borderColor(Color.Black)
                  .borderWidth(2)
                  .borderRadius(0)
              }
              .width('50%')

              .alignItems(HorizontalAlign.Center)
              .justifyContent(FlexAlign.Center)

            }
            .height('10%')
            .justifyContent(FlexAlign.SpaceBetween)
            Row() {

            }
            .width('100%')
            .height('90%')
            .backgroundColor(Color.Blue)
          }
          .width('100%')
          .height('100%')
      }
      .height('90%')
      .width('100%')
        // .alignItems(VerticalAlign.Top)

    }
    .width('100%')
    .height('100%')

  }

  .height('100%')
}
}
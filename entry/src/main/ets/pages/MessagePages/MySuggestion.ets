import router from '@ohos.router'
@Entry
@Component
struct MySuggestion {
  @State message: string = '我要提议'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            router.back()
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}
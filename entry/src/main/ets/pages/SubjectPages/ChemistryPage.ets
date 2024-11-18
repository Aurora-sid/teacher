import router from '@ohos.router';
@Entry
@Component
struct MyListsPage {
  @State message: string = '化学'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('back',{type:ButtonType.Normal,stateEffect:true})
          .width('50%')
          .height(30)
          .borderRadius(25)
          .onClick(()=>{
            router.back()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
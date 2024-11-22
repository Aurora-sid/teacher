import router from '@ohos.router';
import LibraryList from './components/LibraryList';
@Component
export default struct Library {
  @State message: string = '图书';

  build() {
    Column() {
      Row() {
        // Image($r('app.media.left'))
        //   .width(25)
        //   .onClick(()=>{router.back()})

        Text("图书商城")
          .fontSize(20)
          .margin({ left: 130 })
      }
      .width('100%')
      .height('10%')
      .backgroundColor(Color.Yellow)
      .justifyContent(FlexAlign.Start)
     .padding(10)

      Scroll() {
        Column() {
          Column() {
            // Text(this.message)
            //   .fontSize('16fp')
            //   .alignSelf(ItemAlign.Start)
            LibraryList()
          }
          .width('100%')
          .padding('2vp')
          .height('100%')
        }
        .backgroundColor('#f1f3f5')

      }.scrollBar(BarState.Auto)
    }
  }
}
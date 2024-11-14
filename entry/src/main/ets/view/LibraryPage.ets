import router from '@ohos.router';
@Component
export default struct Library {
  @State message: string = '图书';

  build() {
    Row() {
      Column(){
        Text(this.message)
          .fontSize('16fp')
          .alignSelf(ItemAlign.Start)

      }
      .width('100%')
      .padding('20vp')
      .height('100%')
    }
    .backgroundColor('#f1f3f5')
  }
}
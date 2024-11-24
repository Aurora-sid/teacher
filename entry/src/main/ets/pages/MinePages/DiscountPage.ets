import router from '@ohos.router';
import DiscountList from '../../view/components/DiscountList';
import Discounts from '../../view/components/DiscountList';
@Entry
@Component
struct MyListsPage {
  @State message: string = '优惠券'

  build() {
    Column() {
      Row() {
        Image($r('app.media.left'))
          .width(25)
          .onClick(()=>{router.back()})

        Text("我的优惠券")
          .fontSize(20)
          .margin({ left: 100 })
      }
      .width('100%')
      .height('10%')
      .backgroundColor('#FFD700')
      .borderRadius(10)
      .justifyContent(FlexAlign.Start)
      .padding(10)

      Scroll() {
        Column() {
          Column() {
            // Text(this.message)
            //   .fontSize('16fp')
            //   .alignSelf(ItemAlign.Start)
            DiscountList()
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
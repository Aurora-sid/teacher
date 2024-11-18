import router from '@ohos.router';
import {ItemType} from '../../model/types'
@Component
export default struct trap {
  @State message: string = '导航组件';
  private nayData:Array<ItemType> = [
    {
      title:'我的订单',
      img:$r('app.media.order'),
      url:'pages/MinePages/MyOrderPage'
    },
    {
      title:'我的钱包',
      img:$r('app.media.wallet'),
      url:'pages/MinePages/MyWalletPage'
    },
    {
      title:'优惠券',
      img:$r('app.media.discount'),
      url:'pages/MinePages/DiscountPage'
    }
  ];
  build() {
    Column(){
      Grid(){
        ForEach(this.nayData,(item:ItemType)=>{
          GridItem(){
            Column(){
              Image(item.img)
                .width(25)
                .height(25)
              Text(item.title)
                .fontSize(14)
                .margin({ top:'10vp' })
            }
            .onClick(()=>{
              router.pushUrl({
                url:item.url
              }).catch((error:Error)=>{

              })
            })
          }
        })
      }
       .columnsTemplate('1fr 1fr 1fr ') // 4行2列
       .rowsTemplate('1fr') // 4行2列
      // // .rowsGap(12) // 行间距
      // // .columnsGap(8) // 列间距
      // .width('100%')

    }
    .width('100%')
    .borderRadius('25vp')
    .backgroundColor(Color.White)
    .height(90)
    .margin({bottom:'12vp'})
  }
}
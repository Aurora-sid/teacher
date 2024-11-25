import router from '@ohos.router';
import DiscountList from '../../view/components/DiscountList';
import Discounts from '../../view/components/DiscountList';
import {setDiscount } from '../../../api/axios';
import {getCoupon } from '../../../api/axios';
import {getUserName} from '../../../utils/data'
@Entry
@Component
struct MyListsPage {
  @State message: string = '我的优惠券'
  @State username: string = getUserName()
  @State coupon: Array<any> = []
  @State money: number = 0
  @State discount: number = 0

  async aboutToAppear() {
    let DATA = await getCoupon(this.username);
    if(DATA.data){
      this.coupon = DATA.data;
     // this.discount = DATA.data.value;
      console.log(JSON.stringify(this.coupon))
      this.money = DATA.data.min;
    }
    else{
      this.coupon = [];
      this.money = 0;
    }
  }
  build() {
    Column() {
      Row() {
        Image($r('app.media.left'))
          .width(25)
          .onClick(()=>{router.back()})

        Text(this.message)
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
          List({ space: 4 }) {
            ForEach(this.coupon, (item: { value: number ,min: number }) => {
              ListItem() {
                Row() {
                  Row(){
                    Row(){
                      Image($r('app.media.Money'))
                        .width('50%') // 宽度为原始大小的一半
                         .height('10%') // 高度为原始大小的一半
                        .aspectRatio(1) // 保持原始宽高比
                        .autoResize(true); // 启用自动调整
                      Text(item.value.toFixed(0))
                        .fontSize(35)
                        .fontWeight(FontWeight.Bold)
                        .fontColor(Color.White)

                    }
                    .width('50%')
                    .height('100%')
                    .backgroundColor(Color.Red)
                    Text('满'+item.min.toFixed(0)+'减'+item.value.toFixed(0))
                      .fontSize(20)
                      .margin({ left:10 })
                  }
                  .width('78%')
                  .height('13%')
                  .borderRadius(10)
                  .backgroundColor('#FFD700')
                  Button(){
                    Text('立即使用')
                      .fontSize(16)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bold)
                  }
                  .width('22%')
                  .height('8%')
                  //.borderRadius(0)
                   .backgroundColor(Color.Red)//('#FFF8DC')
                  .onClick(()=>{
                    router.pushUrl({
                      // url: 'view/TeacherPage',
                      url: 'pages/MainPage',
                    })
                  })

                }
                .backgroundColor('#FAFAD2')
                .margin({ top: 5 })

              }
              .margin({ left: '8vp', right: '5vp' })
              .borderRadius(5)
            })
          }
          .width('100%')
          .height('100%')
          .lanes(1) // 一行中的个数
        }

      }.scrollBar(BarState.Auto)
      .width('100%')
      .margin({ top: 5 })
       .height('90%')
      // .backgroundColor('#FAFAD2')

    }
    .backgroundColor('#D3D3D3')
  }
}
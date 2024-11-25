import router from '@ohos.router';
import {ItemType} from '../../model/types'
import {getUserName} from '../../../utils/data'
import { getCoupon } from '../../../api/axios';
@Component
export default struct DiscountList {
  @State message: string = '列表组件';
  @State username: string = getUserName()
  @State coupon: Array<any> = []
  @State money: number = 0

  async aboutToAppear() {
    let DATA = await getCoupon(this.username);
    if(DATA.data){
      this.coupon = DATA.data;
      console.log(JSON.stringify(this.coupon))
      this.money = DATA.data.min;
    }
    else{
    }
  }
  // private ListData:Array<ItemType> = [
  //   {
  //     img:$r("app.media.Dis3"),
  //   },
  //
  //   {
  //     img:$r("app.media.Dis4"),
  //   },
  //   {
  //     img:$r("app.media.Dis5"),
  //   },
  //   {
  //     img:$r("app.media.Dis1"),
  //   },
  //   {
  //     img:$r("app.media.Dis2"),
  //   },
  // ];
  build() {
    Column() {
      Column() {
        List({ space: 4 }) {
          ForEach(this.coupon, (item: any) => {
            ListItem() {
              Column() {
                // Image(item.img)
                //   .width('75%') // 图片宽度为父容器宽度的50%
                //   .height('10%') // 图片高度为父容器高度的50% // .objectFit(ImageFit.Contain).margin(10)
                //   .objectFit(ImageFit.Cover)
                Row(){
                  Row(){
                    Image($r('app.media.Money'))
                      .width('50%')
                      .height('100%') // 设置高度为自动以保持比例
                      .aspectRatio(1.2) // 根据需要填写合适的宽高比
                      .autoResize(true);
                    Text(item.value)

                  }
                  .width('40%')
                  .height('100%')
                  .backgroundColor(Color.Red)
                  Text('优惠券')
                    .fontSize(20)
                    .margin({ left: 100 })
                }
                .width('100%')
                .height('13%')
                .backgroundColor('#FFD700')
                DiscountList()

                Button(){
                  Text('立即使用')
                    .fontSize(16)
                    .fontWeight(FontWeight.Bold)
                }
                .width('25%')
                .height('5%')
                .backgroundColor('#FFF8DC')
                .onClick(()=>{
                  router.pushUrl({
                   // url: 'view/LibraryPage',
                    url: 'pages/MainPage',
                  })
                })

              }
              .backgroundColor('#FAFAD2')
            }
            .margin({ left: '8vp', right: '5vp' })
          })
        }
        .width('100%')
        .height('100%')
        .lanes(1) // 一行中的个数
      }
    }
  }
}
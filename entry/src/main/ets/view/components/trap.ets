import {ItemType} from '../../model/types'
@Component
export default struct trap {
  @State message: string = '导航组件';
  private nayData:Array<ItemType> = [
    {
      title:'我的订单',
      img:$r('app.media.order')
    },
    {
      title:'我的钱包',
      img:$r('app.media.wallet')
    },
    {
      title:'优惠券',
      img:$r('app.media.discount')
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
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr ') // 4行2列
      .rowsTemplate('1fr') // 4行2列
      .height(90)
      // .rowsGap(12) // 行间距
      // .columnsGap(8) // 列间距
      .backgroundColor(Color.White)
      .width('100%')
      .margin('5vp')

    }
    .width('95%')
    .borderRadius('50vp')
    .padding({
      top:'2vp',
      bottom:'8vp',
      // right:'12vp',
      left:'1vp'
    })
  }
}
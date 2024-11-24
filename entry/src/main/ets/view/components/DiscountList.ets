import router from '@ohos.router';
import {ItemType} from '../../model/types'
@Component
export default struct DiscountList {
  @State message: string = '列表组件';
  private ListData:Array<ItemType> = [
    {
      img:$r("app.media.Dis3"),
    },

    {
      img:$r("app.media.Dis4"),
    },
    {
      img:$r("app.media.Dis5"),
    },
    {
      img:$r("app.media.Dis1"),
    },
    {
      img:$r("app.media.Dis2"),
    },
  ];
  build() {
    Column() {
      Column() {
        List({ space: 14 }) {
          ForEach(this.ListData, (item: ItemType) => {
            ListItem() {
              Row() {
                Image(item.img)
                  .width('75%') // 图片宽度为父容器宽度的50%
                  .height('10%') // 图片高度为父容器高度的50% // .objectFit(ImageFit.Contain).margin(10)
                  .objectFit(ImageFit.Cover)
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
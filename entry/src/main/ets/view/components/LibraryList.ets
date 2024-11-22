import {ItemType} from '../../model/types'
@Component
export default struct list {
  @State message: string = '列表组件';
  private ListData:Array<ItemType> = [
    {
      title:'C语言程序设计',
      img:$r("app.media.CLanguage"),
      price:59.00
    },
    {
      title:'Java程序设计',
      img:$r('app.media.Java'),
      price:60.00
    },
    {
      title:'人工智能导论',
      img:$r("app.media.Artificial_Intelligence"),
      price:42.00
    },
    {
      title:'操作系统设计原理',
      img:$r("app.media.Operating_System"),
      price:71.00
    },
    {
      title:'算法设计与分析',
      img:$r("app.media.Algorithm_Design"),
      price:58.00
    },
    {
      title:'计算机组成原理',
      img:$r("app.media.Computer_Organization"),
      price:61.00
    },
    {
      title:'计算机网络',
      img:$r("app.media.Computer_Networks"),
      price:80.00
    },
    {
      title:'西游记',
      img:$r("app.media.Journey_to_the_West"),
      price:98.00
    },
    {
      title:'狂人日记',
      img:$r("app.media.Diary_of_a_Madman"),
      price:88.00
    },
    {
      title:'朝花夕拾',
      img:$r("app.media.Plucked_at_Dusk"),
      price:55.00
    },
    {
      title:'城南旧事',
      img:$r("app.media.Old_Stories_of_the_South_City"),
      price:20.00
    },
    {
      title:'余生只想宠爱你',
      img:$r("app.media.Spoil_You"),
      price:520.00
    },
    {
      title:'红楼梦',
      img:$r("app.media.Dream_of_the_Red_Chamber"),
      price:198.00
    },
    {
      title:'三体',
      img:$r("app.media.The_threeBody_Problem"),
      price:198.00
    },

  ];
  build() {
    Column() {
      Column() {
        List({ space: 14 }) {
          ForEach(this.ListData, (item: ItemType) => {
            ListItem() {
              Column() {
                Image(item.img)
                  .width('100%') // 图片宽度为父容器宽度的50%
                  .height('25%') // 图片高度为父容器高度的50% // .objectFit(ImageFit.Contain).margin(10)
                  .objectFit(ImageFit.Cover)
                //  .aspectRatio(0.5)
                Text(item.title)
                  .fontSize(20)
                  .fontWeight(FontWeight.Bold)
                  .margin({ top: 10 })
                Text(`¥${item.price}`)
                  .fontSize(18)
                  .fontColor(Color.Red)
                  .fontWeight(FontWeight.Bold)
                  .margin({ top: 10 })
              }
            }
            .margin({ left: '8vp', right: '5vp' })
          })
        }
        .width('100%')
        .height('100%')
        .lanes(2) // 一行中的个数
      }
    }
  }
}
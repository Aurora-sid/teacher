import {ItemType} from '../../model/types'
@Component
export default struct Daohang {
  @State message: string = '导航组件';
  private nayData:Array<ItemType> = [
    {
      title:'语文',
      img:$r('app.media.chinese')
    },
    {
      title:'数学',
      img:$r('app.media.math')
    },
    {
      title:'英语',
      img:$r('app.media.english')
    },
    {
      title:'物理',
      img:$r('app.media.physics')
    },
    {
      title:'化学',
      img:$r('app.media.chemistry')
    },
    {
      title:'政治',
      img:$r('app.media.politics')
    },
    {
      title:'地理·',
      img:$r('app.media.geography')
    },
    {
      title:'生物·',
      img:$r('app.media.biology')
    },
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
                .margin({ top:'5vp' })
            }
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr') // 4行2列
      .rowsTemplate('1fr 1fr') // 4行2列
      .height(120)
      .rowsGap(12) // 行间距
      .columnsGap(8) // 列间距
      .backgroundColor(Color.White)
      .width('90%')
      .margin('10vp')
      .padding({
        top:'10vp',
        bottom:'10vp'
      })
    }
  }
}
import router from '@ohos.router';
import {ItemType} from '../../model/types'
@Component
export default struct Daohang {
  @State message: string = '导航组件';
  private nayData:Array<ItemType> = [
    {
      title:'语文',
      img:$r('app.media.chinese'),
      url:'pages/SubjectPages/ChinesePage'
    },
    {
      title:'数学',
      img:$r('app.media.math'),
      url:'pages/SubjectPages/MathPage'
    },
    {
      title:'英语',
      img:$r('app.media.english'),
      url:'pages/SubjectPages/EnglishPage'
    },
    {
      title:'物理',
      img:$r('app.media.physics'),
      url:'pages/SubjectPages/PhysicsPage'
    },
    {
      title:'化学',
      img:$r('app.media.chemistry'),
      url:'pages/SubjectPages/ChemistryPage'
    },
    {
      title:'政治',
      img:$r('app.media.politics'),
      url:'pages/SubjectPages/PoliticsPage'
    },
    {
      title:'地理·',
      img:$r('app.media.geography'),
      url:'pages/SubjectPages/GeographyPage'
    },
    {
      title:'生物·',
      img:$r('app.media.biology'),
      url:'pages/SubjectPages/BiologyPage'
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
            // .opacity(()=>{
            //   router.pushUrl({
            //     url:item.url
            //   }).catch((error:Error)=>{
            //
            //   })
            // })
            .onClick(()=>{
              router.pushUrl({
                url:item.url
              }).catch((error:Error)=>{

              })
            })
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
import router from '@ohos.router';
import {getUserName} from '../../../utils/data'
import {getSuggestion} from '../../../api/axios'
@Entry
@Component
struct MyListsPage {
  @State message: string = '我的评价'
  @State userSuggestion:Array<{suggestion:string,theme:string,subject:string,username:string}> =
[
]

  async aboutToAppear(){
    let result =  await getSuggestion(getUserName());
    if(result.data){
      this.userSuggestion = result.data
      console.log(JSON.stringify(this.userSuggestion))
    }else{

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
  .backgroundColor(Color.Yellow)
  .justifyContent(FlexAlign.Start)
  .padding(10)
  if (this.userSuggestion.length === 0) {
    Column() {
      Text("暂无评价或建议")
        .fontSize(20)
        .margin(10)
    }.justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center).height("90%").width("100%")
  } else {
    Row() {
      List({ space: 12 }) {
        ForEach(this.userSuggestion, (item: {
          suggestion: string,
          theme: string,
          subject: string,
          username: string
        }, index: number) => {
          ListItem() {
            Column() {
              Text("科目：" + item.subject)
              Text("主题：" + item.theme)
              Text("建议：" + item.suggestion)
            }.width("100%")
          }
          .height(200)
          .width("100%")
          .borderRadius(10)
          .backgroundColor(Color.Blue)
        })
      }
      //.margin()
      .lanes(1) // 一行中的个数
      .height('100%')
      .width('100%')
      .padding(10)
      .alignListItem(ListItemAlign.Center)
    }
    .height('100%')
  }
}.width("100%")
  }
}
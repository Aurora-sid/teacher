import {ItemType} from '../../model/types'
import {getUserName} from '../../../utils/data'
@Component
export default struct MineUser {
  @State message: string = '用户描述';

  build() {
    Row() {
      Image($r('app.media.TX'))
        .width('50vp')
        .borderRadius('10vp')
        .height('50vp')
      Column(){
        Text(getUserName())
          .fontSize('20fp')
        Text('32206110 (85/87)')
          .fontSize('16vp')
          .margin({top:'5vp'})
      }.alignItems(HorizontalAlign.Start)
      .margin({left :'10vp'})

    }
    .alignItems(VerticalAlign.Center)
    .backgroundColor(Color.White)
    .width('100%')
    .height('100vp')
    .margin({
      top:'15vp',
      bottom:'12vp'
    })
    .borderRadius('25vp')
    .padding({left:'28vp'})
  }
}
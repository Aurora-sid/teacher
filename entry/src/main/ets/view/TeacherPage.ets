import router from '@ohos.router';
import MineUser from './components/MineUser'
import MineList from './components/MineList'
import trap from './components/trap';
@Component
export default struct Teacher {
  @State message: string = '名师';

  build() {
    Row() {
      Column(){
        // Text(this.message)
        //   .fontSize('16fp')
        //   .alignSelf(ItemAlign.Start)
       // TeacherList()
      }
      .width('100%')
      .padding('20vp')
      .height('100%')
    }
    .backgroundColor('#f1f3f5')
  }
}
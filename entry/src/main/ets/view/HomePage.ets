import SwiperExample from './components/SwiperExample'
import ListExample from './components/ListExample'
import Daohang from './components/Daohang'
@Component
export default struct Home {
  @State message: string = 'sckdc';

  build() {
    Scroll() {
      Column(){
        // 轮廓
        SwiperExample()
        // 导航
        Daohang()
        // 列表
        ListExample()
      }
      .width('100%')
    }
    .scrollBar(BarState.Auto)
  }
}
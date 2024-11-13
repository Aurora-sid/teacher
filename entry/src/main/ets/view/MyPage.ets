@Component
export default struct My {
  @State message: string = '我的';

  build() {
    Row() {
     Text(this.message)
    }
    .height('100%')
  }
}
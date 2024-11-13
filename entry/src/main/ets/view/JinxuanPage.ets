@Component
export default struct Choice {
  @State message: string = '精选';

  build() {
    Row() {
     Text(this.message)
    }
    .height('100%')
  }
}
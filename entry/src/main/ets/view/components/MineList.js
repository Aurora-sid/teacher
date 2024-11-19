import router from '@ohos.router';
export default struct MineList extends   {
    constructor() { }
    build() {
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius('30vp')
            .padding({
            top: '5vp',
            bottom: '5vp',
            // right:'50vp'
        })
            .divider({
            color: '#dddd',
            strokeWidth: '1vp',
            startMargin: '46vp',
            endMargin: '12vp'
        });
    }
}
//# sourceMappingURL=MineList.js.map
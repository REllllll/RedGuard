@Component
struct Found {
  build() {
    // 顶部导航
    Tabs({ barPosition: BarPosition.Start }) {
      // TabContent的内容:关注、视频、游戏、数码、科技、体育、影视
      TabContent() {
        Text('广场').fontSize(30)
      }.tabBar('广场')

      TabContent() {
        Text('百科').fontSize(30)
      }.tabBar('百科')
    }.scrollable(false)
  }
}

export {Found}
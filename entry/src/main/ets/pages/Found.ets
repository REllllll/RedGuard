import { PostCard } from './components/Cards'
import router from '@ohos.router'
import { UI_Config } from './config'


@Component
struct Found {
  @State bg_color: string = '#ffffffff'
  @State fontColor: string = '#ffffffff'
  @State selectedFontColor: string = '#ff8de8ff'
  @State currentIndex: number = 0
  private tab_controller = new TabsController()


  // build the tapBar
  @Builder
  tabBar(index: number,
         title: string,
         offset: string = '',
         fontSize: number = 12,
         margin: string | number = UI_Config.containerPadding) {
    Column() {
      Column() {
        Text(title)
          .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
          .fontSize(fontSize)
          .fontWeight(this.currentIndex === index ? 800 : 400)

        if (this.currentIndex === index) {
          Rect()
            .width('100%')
            .height(2)
            .fill(this.selectedFontColor)
            .radius(1)
            .margin({ top: 5 })
        }
      }.width(40).onClick(() => {
        this.tab_controller.changeIndex(index)
      })
    }
    .width('100%')
    .height(30)
    .alignSelf(ItemAlign.Start)
    .margin({ left: margin })
    .offset({ x: offset })

  }

  build() {
    // 顶部导航
    Tabs({ barPosition: BarPosition.Start, controller: this.tab_controller }) {
      TabContent() {
        Scroll() {
          // 创建七个PostCard
          Column() {
            PostCard({ title: '这是一个标题'})
            ForEach([1, 2, 3, 4, 5, 6, 7], () => {
              PostCard()
            })
          }
        }
      }.tabBar(this.tabBar(0, '广场', '0',16,0))

      TabContent() {
        Text('百科').fontSize(30)
      }.tabBar(this.tabBar(1, '百科', '0',16,0))
    }.backgroundColor(UI_Config.PrimaryColor).onChange((index: number) => {
      this.currentIndex = index
    }).barHeight(UI_Config.navBarHeight-6)
  }
}

export { Found }
import router from '@ohos.router'
import { NormalUserInfo } from './components/User'

const params = router.getParams()
// const postId = params['postId']

@Extend(Text) function title() {
  .fontColor('#333')
  .fontSize(20)
  .fontWeight(600)
}

@Extend(Text) function body() {
  .fontColor('#666')
  .fontSize(16)
}

@Extend(Text) function head() {
  .fontColor('#333')
  .fontSize(20)
}

@Entry
@Component
struct PostDetail {
  build() {
    Column({space:5}) {
      // nav
      Stack() {
        Column() {
          Button('<')
            .onClick(() => {
              router.back()
            })
            .fontColor('#ff000000')
            .backgroundColor('#fff')
        }.alignItems(HorizontalAlign.Start).width('100%')

        Text('帖子详情')
          .fontSize(20)
          .fontWeight(600)
          .fontColor('#333')
      }.width('100%').height(50).alignContent(Alignment.Center)

      // body

      // User info
      GridRow({columns: 5}) {
        GridCol({span: 2}) {
          NormalUserInfo().alignSelf(ItemAlign.Start)
        }

        GridCol({offset: 1, span: 2}) {
          Text('2月13日  23:36 发布')
            .fontWeight(400)
            .fontSize(14)
            .fontColor('#666')
            .offset({ y: 10 })
            .alignSelf(ItemAlign.End)
        }
      }.width('100%')

      // title&content
      Column({space: 5}) {
        Text('骨髓增生异常综合征会有什么临床症状？')
          .title()
        Text('想问一下大家骨髓增生异常综合征的一些具体的表现呢？感觉自己有可能出现了类似的症状')
          .body()
      }.padding({top: 10, bottom: 10, left: 10, right: 10})
    }.height('100%').width('100%').padding({left:10, right:10})
  }
}
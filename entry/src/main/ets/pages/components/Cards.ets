import router from '@ohos.router'
import { User } from '../../models/auth'
import { UI_Config } from '../config'
import { NormalUserInfo } from './User'

@Styles function fancy_hover() {
  .onTouch(
    (event) => {
      if (event.type === TouchType.Down && this.untouchable === false) {
        console.info('down')
        this.bg_color = this.hover_color
      } else if (event.type === TouchType.Up) {
        console.info('up')
        this.bg_color = this.normal_color
      }
    }
  )
}

@Builder function UserInfo($$: { user: User }) {
  NormalUserInfo({ user: $$.user }).alignSelf(ItemAlign.Start)
    .onTouch((event) => {
      if (event.type === TouchType.Down) {
        console.info('User info clicked')
        this.untouchable = true
      } else if (event.type === TouchType.Up) {
        console.info('User info unclicked')
        this.untouchable = false
      }
    })
}


@Extend(Text) function smallNumber() {
  .fontSize(10)
}

@Preview
@Component
struct Card {
  @BuilderParam children: () => void
  @State normal_color: string = 'white'
  @State hover_color: string = '#f0f0f0'
  @State cardWidth: string | number = undefined
  @State cardHeight: string | number = undefined
  @State flexRatio: number = undefined
  @State bg_color: string = '#ffffffff'
  @State untouchable: boolean = false

  // init the card color
  aboutToAppear() {
    this.bg_color = this.normal_color
  }

  build() {
    Flex() {
      this.children()
    }
    .borderRadius(10)
    .padding(10)
    .fancy_hover()
    .backgroundColor(this.bg_color)
    .width(this.cardWidth)
    .height(this.cardHeight)
    .flexGrow(this.flexRatio)
    .margin(5)
    .animation({ duration: 200, curve: Curve.EaseOut })
  }
}


// Post Card interaction
@Component
struct PostCardInter {
  @State head_pic: Resource = $r('app.media.love')
  @Prop num: number

  build() {
    Column() {
      Row({ space: 5 }) {
        Image(this.head_pic)
          .height(15)
          .width(15)
          .margin(5)
        Text(String(this.num))
          .fontSize(14)
          .margin(5)
      }
    }.width('100%').alignItems(HorizontalAlign.Center)
  }
}


@Preview
@Component
struct PostCard {
  private user: User
  @State title: string = 'Title'
  @State subtitle: string = 'Subtitle'
  @State content_pic: Resource = $r('app.media.sea')
  @State comment_num: number = 0
  @State like_num: number = 0
  @State share_num: number = 0
  @State bg_color: string = '#ffffffff'
  @State normal_color: string = 'white'
  @State hover_color: string = '#f0f0f0'
  @State untouchable: boolean = false

  build() {
    Column() {
      // User info
      Stack() {
        UserInfo({ user: this.user })
      }.margin({ left: UI_Config.containerPadding, top: 5, bottom: 5 }).alignSelf(ItemAlign.Start)

      // Post content
      Image(this.content_pic)
        .width('100%')
        .height(200)

      // Post title
      Column() {
        Text(this.title)
          .fontSize(20)
          .fontWeight('bold')
        Text(this.subtitle)
          .fontSize(16)
          .margin({ top: 5 })
      }.alignItems(HorizontalAlign.Start).width('100%').padding({ left: UI_Config.containerPadding, top: 5, bottom: 5 })

      // Post interaction
      Flex() {
        PostCardInter({ head_pic: $r('app.media.comment'), num: this.comment_num }).flexGrow(1)
        PostCardInter({ head_pic: $r('app.media.like'), num: this.like_num }).flexGrow(1)
        PostCardInter({ head_pic: $r('app.media.share'), num: this.share_num }).flexGrow(1)
      }

      Divider().width('100%').height(1).backgroundColor('#f0f0f0')
    }.fancy_hover()
    .backgroundColor(this.bg_color)
    .animation({ duration: 200, curve: Curve.EaseOut })
    .onClick(() => {
      if (this.untouchable === false) {
        router.pushUrl({
          url: 'pages/PostDetail'
          // params: {
          //   user: User
          // }
        }).then(() => {
          console.info('跳转成功')
        }).catch((err) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      }
    })
  }
}


// Comment Card
@Preview
@Component
struct CommentCard {
  private user: User
  private content: string
  @State like_num: number = 0
  @State reply_num: number = 0
  @State bg_color: string = '#ffffffff'
  @State normal_color: string = '#ffffffff'
  @State hover_color: string = '#f0f0f0'
  @State untouchable: boolean = false

  aboutToAppear() {
    this.bg_color = 'white'
  }

  build() {
    Column({ space: 5 }) {
      GridRow({ columns: 5 }) {
        GridCol({ span: 2 }) {
          UserInfo({ user: this.user })
        }
        // vote
        GridCol({ offset: 1, span: 2 }) {

          Row({ space: 5 }) {
            Image($r('app.media.like'))
              .width(20)
              .height(20)
            Text('0')
              .fontWeight(400)
              .fontSize(12)
              .fontColor('#666')
          }.alignSelf(ItemAlign.End)
        }
      }.width('100%')

      // content
      Text(this.content)
        .fontWeight(400)
        .fontSize(12)
        .fontColor('#666')
        .margin({ top: 5, left: 10 })
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .fancy_hover()
    .backgroundColor(this.bg_color)
    .animation({ duration: 200, curve: Curve.EaseOut }) // animation for hover
    .padding({ bottom: 10, left: 15, right: 15, top: 10 })
  }
}


export { Card, PostCard, PostCardInter, CommentCard }
import { User } from '../../models/auth'
import { NormalUserInfo } from './User'

@Extend(Text) function smallNumber() {
  .fontSize(10)
}

@Preview
@Component
struct Card {
  @BuilderParam children: () => void
  @State color: string = 'white'
  @State cardWidth: string | number = undefined
  @State cardHeight: string | number = undefined
  @State flexRatio: number = undefined

  build() {
    Flex() {
      this.children()
    }
    .borderRadius(10)
    .padding(10)
    .backgroundColor(this.color)
    .width(this.cardWidth)
    .height(this.cardHeight)
    .flexGrow(this.flexRatio)
    .margin(5)
  }
}




// Post Card interaction
@Component
struct PostCardInter {
  @State head_pic: Resource = $r('app.media.love')
  @Prop num: number

  build() {
    Column(){
      Row({ space: 5 }) {
        Image(this.head_pic)
          .height(10)
          .width(10)
          .margin(5)
        Text(String(this.num))
          .fontSize(12)
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


  build() {
    Column() {
      // User info
      NormalUserInfo({user: this.user}).alignSelf(ItemAlign.Start)

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
          .margin({top: 5})
      }.alignItems(HorizontalAlign.Start).width('100%').padding(10)

      // Post interaction
      Flex() {
        PostCardInter({head_pic: $r('app.media.comment'), num: this.comment_num}).flexGrow(1)
        PostCardInter({head_pic: $r('app.media.like'), num: this.like_num}).flexGrow(1)
        PostCardInter({head_pic: $r('app.media.share'), num: this.share_num}).flexGrow(1)
      }
    }
  }
}


export { Card, PostCard }
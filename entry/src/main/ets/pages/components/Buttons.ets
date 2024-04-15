
@Preview
@Component
struct NormalButton{
  @State pic: Resource = $r('app.media.star')
  @State title: string = "Title"

  build(){
    Column({space: 10}) {
      Image(this.pic)
        .height(24)
        .width(24)
      Text(this.title)
        .fontSize(12)
        .fontColor('#ff606060')
    }
    .width(50)
  }
}

export {NormalButton}
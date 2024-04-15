@Preview
@Component
struct NormalEntry {
  @State head_icon: Resource = $r('app.media.star')
  @State title: string = "Title"

  build() {
    Column() {
      Divider()
        .height(1)
        .width('100%')
        .backgroundColor('rgba(247, 247, 247, 0.15)')
        .opacity(0.5)
      GridRow() {
        // icon
        GridCol({ span: 2 }) {
          // 套一层Stack，用于实现垂直居中
          Stack() {
            Image(this.head_icon)
              .height(24)
              .width(24)
              .fillColor('black')
          }.align(Alignment.Center).height('100%')
        }
        // Title
        GridCol({ span: 8 }) {
          Stack() {
            Text(this.title)
              .fontColor('black')
              .fontSize(16)
              .baselineOffset(-2)
          }.align(Alignment.Start).height('100%').width('100%')
        }
        // Arrow
        GridCol({ span: 2 }) {
          Stack() {
            Image($r('app.media.simple_arrow'))
              .width(22)
              .height(22)
          }.align(Alignment.Center).height('100%')
        }
      }.height(48)
      .width('100%')
      .backgroundColor('white')

      Divider()
        .height(1)
        .width('100%')
        .backgroundColor('rgba(247, 247, 247, 0.15)')
        .opacity(0.5)
    }
  }
}

export { NormalEntry }
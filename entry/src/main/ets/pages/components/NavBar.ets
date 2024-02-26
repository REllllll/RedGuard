@Component
struct Navbar {
  build() {
    Row() {
      Column() {
        Text('logo')
      }
      .width('100%')
    }
    .height('20')
    .backgroundColor('blue')
  }
};

export {Navbar}


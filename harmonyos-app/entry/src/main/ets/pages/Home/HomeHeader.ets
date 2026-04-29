@Entry
@Component
export struct HomeHeader {
  @State message: string = 'Hello World';

  build() {
    Row(){
      Text('Header')
    }.height(50).width('100%')
  }
}
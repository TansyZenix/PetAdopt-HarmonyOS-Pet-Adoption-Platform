import {HomeHeader} from './HomeHeader'
import { HomeList } from './HomeList'
import { HomeMenu } from './HomeMenu'
@Entry
@Component
struct HomeIndex {
  @State message: string = 'Hello World';

  build() {
    Column() {
      HomeHeader()
      HomeMenu()
      HomeList()
    }
    .padding(5)
    .height('100%')
    .width('100%')
  }
}
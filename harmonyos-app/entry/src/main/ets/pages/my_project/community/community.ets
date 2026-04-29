import {Sharephoto} from './sharephoto'
import {esp1} from './esp1'
import {esp2} from './esp2'
import {esp3} from './esp3'
import {esp4} from './esp4'


@Entry
@Component

export struct Community {
  @State message: string = 'Hello World';

  build() {
    Column(){
        Tabs() {
          TabContent() {
            Sharephoto()
          }.tabBar('全部')

          TabContent() {
            esp1()
          }.tabBar('讨论/科普')

          TabContent() {
            esp2()
          }.tabBar('救助')

          TabContent() {
            esp3()
          }.tabBar('晒照')

          TabContent() {
            esp4()
          }.tabBar('闲置')
        }
    }
    .height('100%')
    .width('100%')
  }
}
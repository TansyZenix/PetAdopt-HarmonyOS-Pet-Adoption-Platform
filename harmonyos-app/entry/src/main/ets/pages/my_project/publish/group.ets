import router from '@ohos.router';
import {promptAction} from '@kit.ArkUI'
@Entry
@Component
struct Group {
  @State message: string = 'Hello World';

  build() {
   Column(){
     Row(){
     Image($r('app.media.img_2'))
       .margin({ right: 10})
       .width(24)
       .height(24)
       .onClick(() => {
         router.back()
       })
     Text('宠物群详情')
       .padding({right:15})

    }.width('100%')
     .height(56)
     .padding({ left: 0, right: 80 })
     .justifyContent(FlexAlign.SpaceAround)
     Image($r('app.media.img_6'))
       .width(320)
       .height(450)
     Text('群主微信: shoutyu23487')
       .fontColor('#71717A')
       .fontSize(14)
     Button("点击复制")
       .width('30%')
       .height(33)
       .fontSize(18)
       .fontColor('#414708')
       .backgroundColor("#FFCB45")
       .margin({ top: 15 })
       .onClick(() => {
         promptAction.showDialog({
           message:'内容已复制',

         })
       })


   }
    .height('100%')
    .width('100%')
  }
}
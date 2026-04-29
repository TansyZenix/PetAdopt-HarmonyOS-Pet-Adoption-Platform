import router from '@ohos.router';


@Entry
@Component
export struct deliver {
  build() {
    Column() {
      // Page Header
      Column() {
        Text('信息发布')
          .fontSize(20)
           //('#333333')
          .margin({ bottom: 10 })
      }
      .padding(1)
      .backgroundColor('#FFFFFF')
      .width('100%')

      // Modules
      Column() {
        // Module 1: 送养信息
        Row() {
          // Icon
          Column() {
            // Placeholder for icon
            Image($r('app.media.deliver11'))
              .width(90)
              .height(90)
              .backgroundColor('#FFD700')
              .borderRadius(50)
          }.justifyContent(FlexAlign.SpaceEvenly)
          .margin({ right: 16 })

          // Title, Description and Button
          Column() {
            Text('送养信息')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
               //('#333333')
              .margin({ bottom: 4 })
            Text('小可爱找新家')
              .fontSize(14)

               //('#888888')
            Button('发布', { type: ButtonType.Normal })
              .width(80)
              .height(32)
              .backgroundColor('#FFD700')
               //(Color.White)
              .borderRadius(20)
              .margin({ top: 8 })
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/my_project/publish/DonationDelivery' // 这里需要替换为实际的协议页面路由
                })
              })

          }.justifyContent(FlexAlign.SpaceEvenly)
        }.width('95%')
        .padding(16)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .margin({ bottom: 16 })
        .justifyContent(FlexAlign.SpaceEvenly)

        // Module 2: 寻宠信息
        Row() {
          // Icon
          Column() {
            // Placeholder for icon
            Image($r('app.media.deliver12'))
              .width(90)
              .height(90)
              .backgroundColor('#87CEEB')
              .borderRadius(50)
          }.justifyContent(FlexAlign.SpaceEvenly)
          .margin({ right: 16 })

          // Title, Description and Button
          Column() {
            Text('寻宠信息')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
               //('#333333')
              .margin({ bottom: 4 })
            Text('时间就是生命')
              .fontSize(14)
               //('#888888')
            Button('发布', { type: ButtonType.Normal })
              .width(80)
              .height(32)
              .backgroundColor('#FFD700')
               //(Color.White)
              .borderRadius(20)
              .margin({ top: 8 })
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/my_project/publish/deliver2' // 这里需要替换为实际的协议页面路由
                })
              })
          }.justifyContent(FlexAlign.SpaceEvenly)
        }.width('95%')
        .padding(16)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .margin({ bottom: 16 })
        .justifyContent(FlexAlign.SpaceEvenly)

        // Module 3: 寻主信息
        Row() {
          // Icon
          Column() {
            // Placeholder for icon
            Image($r('app.media.deliver13'))
              .width(98)
              .height(98)
              .backgroundColor('#98FB98')
              .borderRadius(50)
          }.justifyContent(FlexAlign.SpaceEvenly)
          .margin({ right: 12 })

          // Title, Description and Button
          Column() {
            Text('寻主信息')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
               //('#333333')
              .margin({ bottom: 4 })
            Text('寻找原主人')
              .fontSize(14)
               //('#888888')
            Button('发布', { type: ButtonType.Normal })
              .width(80)
              .height(32)
              .backgroundColor('#FFD700')
               //(Color.White)
              .borderRadius(20)
              .margin({ top: 8 })
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/my_project/publish/deliver3' // 这里需要替换为实际的协议页面路由
                })
              })
          }.justifyContent(FlexAlign.SpaceEvenly)
        }.width('95%')
        .padding(16)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .margin({ bottom: 16 })
        .justifyContent(FlexAlign.SpaceEvenly)
      }
      .padding(16)
      .backgroundColor('#F5F5F5')
      .width('100%')
      .height('100%')
    }
  }
}
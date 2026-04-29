import router from '@ohos.router';

@Entry
@Component
struct PetFindMaster {
  @State message: string = 'Hello World';

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.back')).width(30).height(30) // 返回按钮
        Text('寻宠寻主')
          .fontSize(20)
          .margin({ left: 115 })
      }.onClick(()=>{
        router.back();
      })
      .width('100%')
      .height(50)

      // 标签页
      Tabs({ barPosition: BarPosition.Start }) {

        // 寻宠标签页
        TabContent() {
          Column() {

            List() {
              // 第一个列表项
              ListItem() {
                Column() {
                  Row(){
                    // 宠物图片
                    Image($r('app.media.maozaizi1')).width(100).height(100).borderRadius(8)

                    // 宠物信息
                    Column() {
                      Text('寻找一只折耳猫')

                      Text('女孩 猫猫')
                        .fontSize(10)


                      Text('金牛区')
                        .fontSize(10)

                      Text('悬赏：￥50.00')
                        .fontColor('#FF0000')
                        .fontSize(15)
                    }
                    .height(80)
                    .width(200)
                    .alignItems(HorizontalAlign.Start)
                    .margin({left:10})
                    .justifyContent(FlexAlign.SpaceBetween)
                    // 操作按钮
                    Column() {
                      Image($r('app.media.heart_add_line')).width(20).height(20)
                      Image($r('app.media.call')).width(20).height(20)
                    }
                    .height('100%')
                    .justifyContent(FlexAlign.SpaceBetween)
                    .margin({ right: 30 })
                  }.margin({bottom:10})
                  Row(){
                    Text('2025-03-20 01:12:44')
                      .fontSize(10)
                    Text('114858 查看')
                      .fontSize(10)
                    Text('609 转发')
                      .fontSize(10)
                  }.justifyContent(FlexAlign.SpaceBetween).width('100%').margin({top:8})




                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .padding({ top: 15, bottom: 15 })

              }
              .height(130)
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .padding(10)
              .margin({ top: 5 })

              ListItem() {
                Column() {
                  Row(){
                    // 宠物图片
                    Image($r('app.media.zaizai01')).width(100).height(100).borderRadius(8)

                    // 宠物信息
                    Column() {
                      Text('寻找狗崽子')

                      Text('男孩 狗狗')
                        .fontSize(10)


                      Text('新都区')
                        .fontSize(10)

                      Text('悬赏：￥5000.00')
                        .fontColor('#FF0000')
                        .fontSize(15)
                    }
                    .height(80)
                    .width(200)
                    .alignItems(HorizontalAlign.Start)
                    .margin({left:10})
                    .justifyContent(FlexAlign.SpaceBetween)
                    // 操作按钮
                    Column() {
                      Image($r('app.media.heart_add_line')).width(20).height(20)
                      Image($r('app.media.call')).width(20).height(20)
                    }
                    .height('100%')
                    .justifyContent(FlexAlign.SpaceBetween)
                    .margin({ right: 30 })
                  }.margin({bottom:10})
                  Row(){
                    Text('2025-03-20 00:00:05')
                      .fontSize(10)
                    Text('1314 查看')
                      .fontSize(10)
                    Text('520 转发')
                      .fontSize(10)
                  }.justifyContent(FlexAlign.SpaceBetween).width('100%').margin({top:8})




                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .padding({ top: 15, bottom: 15 })

              }
              .height(130)
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .padding(10)
              .margin({ top: 5 })
              .onClick(()=>{
                router.pushUrl({
                  url:'pages/my_project/rescue/PetFindMasterForm'
                })
              })

              ListItem() {
                Column() {
                  Row(){
                    // 宠物图片
                    Image($r('app.media.zaizai02')).width(100).height(100).borderRadius(8)

                    // 宠物信息
                    Column() {
                      Text('寻找自家狗子')

                      Text('女孩 狗狗')
                        .fontSize(10)


                      Text('郫都区')
                        .fontSize(10)

                      Text('悬赏：￥2000.00')
                        .fontColor('#FF0000')
                        .fontSize(15)
                    }
                    .height(80)
                    .width(200)
                    .alignItems(HorizontalAlign.Start)
                    .margin({left:10})
                    .justifyContent(FlexAlign.SpaceBetween)
                    // 操作按钮
                    Column() {
                      Image($r('app.media.heart_add_line')).width(20).height(20)
                      Image($r('app.media.call')).width(20).height(20)
                    }
                    .height('100%')
                    .justifyContent(FlexAlign.SpaceBetween)
                    .margin({ right: 30 })
                  }.margin({bottom:10})
                  Row(){
                    Text('2025-03-19 23:00:00')
                      .fontSize(10)
                    Text('5987 查看')
                      .fontSize(10)
                    Text('3654 转发')
                      .fontSize(10)
                  }.justifyContent(FlexAlign.SpaceBetween).width('100%').margin({top:8})




                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .padding({ top: 15, bottom: 15 })

              }
              .height(130)
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .padding(10)
              .margin({ top: 5 })

              ListItem() {
                Column() {
                  Row(){
                    // 宠物图片
                    Image($r('app.media.zaizai03')).width(100).height(100).borderRadius(8)

                    // 宠物信息
                    Column() {
                      Text('寻找大美妞')

                      Text('女孩 狗狗')
                        .fontSize(10)


                      Text('简阳市')
                        .fontSize(10)

                      Text('悬赏：￥300.00')
                        .fontColor('#FF0000')
                        .fontSize(15)
                    }
                    .height(80)
                    .width(200)
                    .alignItems(HorizontalAlign.Start)
                    .margin({left:10})
                    .justifyContent(FlexAlign.SpaceBetween)
                    // 操作按钮
                    Column() {
                      Image($r('app.media.heart_add_line')).width(20).height(20)
                      Image($r('app.media.call')).width(20).height(20)
                    }
                    .height('100%')
                    .justifyContent(FlexAlign.SpaceBetween)
                    .margin({ right: 30 })
                  }.margin({bottom:10})
                  Row(){
                    Text('2025-03-19 19:50:36')
                      .fontSize(10)
                    Text('2387 查看')
                      .fontSize(10)
                    Text('98 转发')
                      .fontSize(10)
                  }.justifyContent(FlexAlign.SpaceBetween).width('100%').margin({top:8})




                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .padding({ top: 15, bottom: 15 })

              }
              .height(130)
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .padding(10)
              .margin({ top: 5 })

              ListItem() {
                Column() {
                  Row(){
                    // 宠物图片
                    Image($r('app.media.zaizai04')).width(100).height(100).borderRadius(8)

                    // 宠物信息
                    Column() {
                      Text('寻找大美妞')

                      Text('男 狗狗')
                        .fontSize(10)


                      Text('双流区')
                        .fontSize(10)

                      Text('悬赏：￥10000.00')
                        .fontColor('#FF0000')
                        .fontSize(15)
                    }
                    .height(80)
                    .width(200)
                    .alignItems(HorizontalAlign.Start)
                    .margin({left:10})
                    .justifyContent(FlexAlign.SpaceBetween)
                    // 操作按钮
                    Column() {
                      Image($r('app.media.heart_add_line')).width(20).height(20)
                      Image($r('app.media.call')).width(20).height(20)
                    }
                    .height('100%')
                    .justifyContent(FlexAlign.SpaceBetween)
                    .margin({ right: 30 })
                  }.margin({bottom:10})
                  Row(){
                    Text('2025-03-19 19:50:36')
                      .fontSize(10)
                    Text('2387 查看')
                      .fontSize(10)
                    Text('98 转发')
                      .fontSize(10)
                  }.justifyContent(FlexAlign.SpaceBetween).width('100%').margin({top:8})




                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .padding({ top: 15, bottom: 15 })

              }
              .height(130)
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .padding(10)
              .margin({ top: 5 })

              ListItem() {
                Column() {
                  Row(){
                    // 宠物图片
                    Image($r('app.media.zaizai05')).width(100).height(100).borderRadius(8)

                    // 宠物信息
                    Column() {
                      Text('救救我的孩子')

                      Text('女孩 狗狗')
                        .fontSize(10)


                      Text('龙泉驿')
                        .fontSize(10)

                      Text('悬赏：￥6000.00')
                        .fontColor('#FF0000')
                        .fontSize(15)
                    }
                    .height(80)
                    .width(200)
                    .alignItems(HorizontalAlign.Start)
                    .margin({left:10})
                    .justifyContent(FlexAlign.SpaceBetween)
                    // 操作按钮
                    Column() {
                      Image($r('app.media.heart_add_line')).width(20).height(20)
                      Image($r('app.media.call')).width(20).height(20)
                    }
                    .height('100%')
                    .justifyContent(FlexAlign.SpaceBetween)
                    .margin({ right: 30 })
                  }.margin({bottom:10})
                  Row(){
                    Text('2025-03-19 19:50:36')
                      .fontSize(10)
                    Text('2387 查看')
                      .fontSize(10)
                    Text('98 转发')
                      .fontSize(10)
                  }.justifyContent(FlexAlign.SpaceBetween).width('100%').margin({top:8})




                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .padding({ top: 15, bottom: 15 })

              }
              .height(130)
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .padding(10)
              .margin({ top: 5 })
            }


          }
          .width('100%')
          // .height('100%')
          .backgroundColor('#F5F5F5')
        }
        .tabBar('寻宠')

        // 寻主标签页
        TabContent() {
          Column() {
            // 这里可以添加寻主的内容
            List(){
              ListItem() {
                Column() {
                  Row(){
                    // 宠物图片
                    Image($r('app.media.xiaokeji')).width(100).height(100).borderRadius(8)

                    // 宠物信息
                    Column() {
                      Text('找主人')

                      Text('男孩 狗狗')
                        .fontSize(10)


                      Text('西南石油大学')
                        .fontSize(10)

                      Text('奖金：￥6000.00')
                        .fontColor('#FF0000')
                        .fontSize(15)
                    }
                    .height(80)
                    .width(200)
                    .alignItems(HorizontalAlign.Start)
                    .margin({left:10})
                    .justifyContent(FlexAlign.SpaceBetween)
                    // 操作按钮
                    Column() {
                      Image($r('app.media.heart_add_line')).width(20).height(20)
                      Image($r('app.media.call')).width(20).height(20)
                    }
                    .height('100%')
                    .justifyContent(FlexAlign.SpaceBetween)
                    .margin({ right: 30 })
                  }.margin({bottom:10})
                  Row(){
                    Text('2025-03-19 19:50:36')
                      .fontSize(10)
                    Text('2387 查看')
                      .fontSize(10)
                    Text('98 转发')
                      .fontSize(10)
                  }.justifyContent(FlexAlign.SpaceBetween).width('100%').margin({top:8})




                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .padding({ top: 15, bottom: 15 })

              }
              .height(130)
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .padding(10)
              .margin({ top: 5 })
            }
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#F5F5F5')
        }
        .tabBar('寻主')
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#FFFFFF')
    }
    .height('100%')
    .width('100%')
  }
}
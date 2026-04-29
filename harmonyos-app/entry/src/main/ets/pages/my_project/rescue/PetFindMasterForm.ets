import router from '@ohos.router';

@Entry
@Component
struct PetDetailPage {
  build() {

      Column() {
        Scroll(){
          Column() {
            // 顶部导航栏
            Row() {
              Image($r('app.media.back')).width(30).height(30) // 返回按钮
              Text('寻宠详情')
                .fontSize(20)
                .margin({ left: 115 })
            }.onClick(()=>{
              router.back();
            })
            .width('100%')
            .height(50)

            // 轮播图部分
            Swiper() {
              Image($r('app.media.zaizai01')).width('100%').height(200)
              Image($r('app.media.zaizai02')).width('100%').height(200)
              Image($r('app.media.zaizai03')).width('100%').height(200)
            }
            .indicator(true) // 显示指示器
            .duration(1000) // 切换时间
            .autoPlay(true) // 自动播放
            .interval(3000) // 自动播放间隔
            .padding({ bottom: 5 })

            // 丢失描述部分
            Column() {
              Row() {
                Text('走丢时身穿红色格子衣服，身体是黄2222222222222222222222222')
                  .fontSize(15)
                  .margin({ left: 5 })
                  .width(250)
                  .maxLines(1)// 限制为一行
                  .textOverflow({ overflow: TextOverflow.Ellipsis }) // 超出部分显示省略号
                Row() {
                  Image($r('app.media.zhuanfa')).width(20).height(20)
                  Text('转发').fontSize(15).fontColor('#808080')
                }

              }.width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
              .padding({ bottom: 5 })

              Row() {
                Text('2025-03-20 10:35:18')
                  .fontSize(14)
                  .fontColor(Color.Gray)
                  .margin({ bottom: 10, left: 5 })

                Text('5166 查看 | 转发0 转发')
                  .fontSize(14)
                  .fontColor(Color.Gray)
                  .margin({ bottom: 10 })
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)

            }
            .alignItems(HorizontalAlign.Start)
            .borderRadius(1)
            .backgroundColor(Color.White)
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)


            // Border部分
            Divider()
              .strokeWidth(1)
              .color('#D3D3D3').margin({ bottom: 5 })

            // 宠物信息部分
            Column() {
              Row() {
                Text().width(5).height(18).backgroundColor('#FFD700').borderRadius(10)
                Text('宠物信息')
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold).margin(5)
              }

              Row() {
                Image($r('app.media.zaizai01')).width(50).height(50).borderRadius(25).margin(5)
                Column() {
                  Text('年年')
                    .fontSize(18)
                    .margin({ bottom: 5 })
                  Row() {
                    Text('女孩')
                      .fontSize(12)
                      .padding(2)
                      .backgroundColor('#FFF700')
                      .margin({ right: 10 })
                    Text('狗狗')
                      .fontSize(12)
                      .padding(2)
                      .backgroundColor('#FFF700')
                      .margin({ right: 10 })
                  }

                }.alignItems(HorizontalAlign.Start)
                .margin({ left: 10 })

              }

            }
            .padding(5)
            .alignItems(HorizontalAlign.Start)
            .borderRadius(10)
            .backgroundColor(Color.White)
            .margin({ bottom: 10 })
            .width('100%')

            // 走失时间/地点部分
            Column() {
              Row() {
                Text().width(5).height(18).backgroundColor('#FFD700').borderRadius(10)
                Text('走失地点/时间')
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold).margin({ left: 5 })
              }.margin({ bottom: 10 })

              Column() {
                Row() {
                  Image($r('app.media.shijian')).width(18).height(18)
                  Text('2025-02-26 15:43').margin({ left: 5 }).fontSize(14)
                }

                Row() {
                  Image($r('app.media.position')).width(20).height(20)
                  Text('四川省成都市武侯区簇桥街道智星二路').margin({ left: 5 }).fontSize(14)
                }
              }.alignItems(HorizontalAlign.Start)
              .width('100%')
              .padding(5)
              .backgroundColor('#FFD54F')

            }
            .padding(5)
            .alignItems(HorizontalAlign.Start)
            .borderRadius(10)
            .backgroundColor(Color.White)
            .margin({ bottom: 10 })
            .width('100%')

            //走失详情
            Column() {
              Row() {
                Text().width(5).height(18).backgroundColor('#FFD700').borderRadius(10)
                Text('走失详情')
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold).margin({ left: 5 })
              }

              Row() {
                Text("走丢时身穿红色格子衣服，身体是黄色毛毛，胸口有一小撮白" +
                  "色毛，鼻子是粉色，断尾，叫年年有反应，丢时她身上穿了衣" +
                  "服，天气要暖和了，她自己脱不了衣服，很担心她在外的状况").fontSize(14).fontColor(Color.Gray)
              }.padding(5)
            }
            .padding(5)
            .alignItems(HorizontalAlign.Start)
            .borderRadius(10)
            .backgroundColor(Color.White)
            .width('100%')

            Text().width('100%').height(10).backgroundColor('#E0E0E0').margin(5)
            //发布者

            Column() {
              Row() {
                Text().width(5).height(18).backgroundColor('#FFD700').borderRadius(10)
                Text('发布者')
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold).margin(5)
              }

              Row() {
                Image($r('app.media.lu_ai_lin')).width(50).height(50).borderRadius(25).margin(5)
                Column() {
                  Text('小不溜')
                    .fontSize(18)
                    .margin({ bottom: 5 })
                  Row() {
                    Text('21岁')
                      .fontSize(12)
                      .padding(2)
                      .margin({ right: 10 })
                    Text('12小时前在线')
                      .fontSize(12)
                      .padding(2)
                      .margin({ right: 10 })
                  }

                }.alignItems(HorizontalAlign.Start)
                .margin({ left: 10 })

              }

            }
            .padding(5)
            .alignItems(HorizontalAlign.Start)
            .borderRadius(10)
            .backgroundColor(Color.White)
            .margin({ bottom: 10 })
            .width('100%')

            // Border部分
            Divider()
              .strokeWidth(1)
              .color('#D3D3D3').margin({ bottom: 5 })

            Grid() {
              // 拔打电话
              GridItem() {
                Column() {
                  Image($r('app.media.dianhua_1')).width(40).height(40) // 电话图标
                  Text('拔打电话').fontSize(14).margin({ top: 5 })
                }
                .justifyContent(FlexAlign.Center)
                .alignItems(HorizontalAlign.Center)
              }

              // 复制微信
              GridItem() {
                Column() {
                  Image($r('app.media.weixin')).width(40).height(40) // 微信图标
                  Text('复制微信').fontSize(14).margin({ top: 5 })
                }
                .justifyContent(FlexAlign.Center)
                .alignItems(HorizontalAlign.Center)
              }

              // 复制QQ号
              GridItem() {
                Column() {
                  Image($r('app.media.QQ')).width(40).height(40) // QQ图标
                  Text('复制QQ号').fontSize(14).margin({ top: 5 })
                }
                .justifyContent(FlexAlign.Center)
                .alignItems(HorizontalAlign.Center)
              }

              // 微信二维码
              GridItem() {
                Column() {
                  Image($r('app.media.erweima')).width(40).height(40) // 二维码图标
                  Text('微信二维码').fontSize(14).margin({ top: 5 })
                }
                .justifyContent(FlexAlign.Center)
                .alignItems(HorizontalAlign.Center)
              }
            }
            .columnsTemplate('1fr 1fr 1fr 1fr') // 两列布局
            // .rowsTemplate('1fr 1fr') // 两行布局
            .width('100%')

            .backgroundColor(Color.White)

            Text().width('100%').height(10).backgroundColor('#E0E0E0').margin(5)

            Row() {
              Column() {
                Text('总寻宠寻主群')
                  .fontSize(18)
                  .margin({ bottom: 5 }).textAlign(TextAlign.Start)
                // Row(){
                Text('全国')
                  .fontSize(12)
                  .padding(2)
                  .fontColor(Color.Gray)
                // }

              }.alignItems(HorizontalAlign.Start)

              Column() {
                Text('加入此群')
                  .fontSize(15)
                  .fontWeight(700)
                  .padding(10)
                  .backgroundColor('#FFF700')
                  .borderRadius(20)
              }

            }.width('100%')
            .margin({ bottom: 10 })
            .justifyContent(FlexAlign.SpaceAround)

            Text().width('100%').height(10).backgroundColor('#E0E0E0').margin(5)

            //最新留言

            Column() {
              Row() {
                Text().width(5).height(18).backgroundColor('#FFD700').borderRadius(10)
                Text('最新留言')
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold).margin({ left: 5 })
              }

            }
            .padding(5)
            .alignItems(HorizontalAlign.Start)
            .borderRadius(10)
            .backgroundColor(Color.White)
            .width('100%')

            Text().width('100%').height(10).backgroundColor('#E0E0E0').margin(5)
          }
        }.scrollBar(BarState.Off)

        // Row() {
        //   // 留言
        //   Navigator({ target: 'pages/CommentPage' }) { // 跳转到留言页面
        //     Column() {
        //       Image($r('app.media.liuyan')).width(24).height(24)// 留言图标
        //       Text('留言').fontSize(14).width(30).height(30)
        //     } // 平分空间
        //     .justifyContent(FlexAlign.Center)
        //     .alignItems(HorizontalAlign.Center)
        //   }
        //
        //   // 海报
        //   Navigator({ target: 'pages/PosterPage' }) { // 跳转到海报页面
        //     Column() {
        //       Image($r('app.media.haibao')).width(24).height(24) // 海报图标
        //       Text('海报').fontSize(14)
        //     }
        //      // 平分空间
        //     .justifyContent(FlexAlign.Center)
        //     .alignItems(HorizontalAlign.Center)
        //   }
        //
        //   // 分享好友
        //   Navigator({ target: 'pages/SharePage' }) { // 跳转到分享页面
        //     Column() {
        //       Text('分享好友').fontSize(14)
        //     }
        //      // 平分空间
        //     .justifyContent(FlexAlign.Center)
        //     .alignItems(HorizontalAlign.Center)
        //   }
        // }
        // .width('100%')
        // .height(20) // 导航栏高度
        // .backgroundColor(Color.White)
        // .border({ width: 1, color: Color.Gray }) // 顶部边框



      }
      .width('100%')







  }
}




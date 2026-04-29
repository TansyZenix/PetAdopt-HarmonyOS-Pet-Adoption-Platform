import router from '@ohos.router';

@Entry
@Component
export struct MyPage {
  // private routeMap: Map<string, string> = new Map([
  //   ['首页', 'pages/my_project/account/HomePage'],
  //   ['发布', 'pages/my_project/account/PublishPage'],
  //   ['社区', 'pages/my_project/account/CommunityPage'],
  //   ['我的', 'pages/my_project/account/MyPage']
  // ]);

  @State isEditingPressed: boolean = false;

  build() {
    Column() {
      // 顶部标题栏
      Row({ space: 12 }) {
        Text('我的')
          .fontSize(24)
          .fontColor(0x333333)
          .fontWeight(FontWeight.Bold)
          .flexGrow(1)

        Image($r('app.media.toolbar_more'))
          .width(24)
          .height(24)

        Image($r('app.media.ic_close'))
          .width(24)
          .height(24)
          .margin({ left: 8 })
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 1, bottom: 5 })
      .backgroundColor(0xFFFFFF)
      .border({ width: 0.5, color: 0xEEEEEE })

      // 用户信息区域
      Column() {
        Column() {
          // 头像
          Image($r('app.media.user_avatar'))
            .width(60)
            .height(60)
            .borderRadius(40)
            .border({ width: 2, color: 0xFFFFFF })
            .margin({ bottom: 5 })

          // 用户名
          Text('小可爱791840')
            .fontSize(20)
            .fontColor(0x333333)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 8 })

          // ID与编辑信息行
          Row() {
            Text('ID: 801840')
              .fontSize(14)
              .fontColor(0x666666)
              .margin({ right: 12 })

            Text('编辑个人信息')
              .fontSize(14)
              .fontColor(0x666666)
              .decoration({ type: TextDecorationType.Underline })
              .opacity(this.isEditingPressed ? 0.6 : 1)
              .onTouch((event) => {
                if (event.type === TouchType.Down) {
                  this.isEditingPressed = true;
                } else if (event.type === TouchType.Up) {
                  this.isEditingPressed = false;
                  router.pushUrl({ url: 'pages/EditPage' });
                }
              })
          }
          .justifyContent(FlexAlign.Center)
        }
        .width('100%')
        .padding(16)
        .backgroundColor(0xF8F8F8)
        .alignItems(HorizontalAlign.Center)
      }

      // 功能入口区域
      Column() {
        Row({ space: 0 }) { // space 设置为 0，由 justifyContent 控制间距
          this.buildFunctionItem('通知', 'ic_notification', 'pages/my_project/account/NotificationPage')
          this.buildFunctionItem('帖子', 'ic_post', 'pages/my_project/account/PostListPage')
          this.buildFunctionItem('收藏', 'ic_collect', 'pages/my_project/account/CollectionPage')
          this.buildFunctionItem('发布', 'ic_publish', 'pages/my_project/account/PublishPage')
        }
        .width('90%')
        .justifyContent(FlexAlign.SpaceBetween) // 均匀分配空间
        .padding({ top: 4, bottom: 4})

        // 分割线
        Divider()
          .strokeWidth(1)
          .color(0xEEEEEE)
          .margin({ top: 1, bottom: 1 })

        this.buildHelpItem('帮助与反馈', 'ic_help', 'pages/my_project/account/HelpPage')
        this.buildHelpItem('平台规则', 'ic_rules', 'pages/my_project/account/PlatformRulesPage')
        this.buildHelpItem('领养协议', 'ic_adopt', 'pages/my_project/account/AdoptionAgreementPage')
        this.buildHelpItem('联系义工', 'ic_contact', 'pages/my_project/account/connectPage')
        this.buildHelpItem('黑名单', 'ic_block', 'pages/my_project/account/BlacklistPage')
        this.buildHelpItem('关注服务号', 'ic_service', 'pages/my_project/account/ServiceAccountPage')
        this.buildHelpItem('购物' , 'ic_shop_sel', 'pages/my_project/account/shoppingPage')
      }
      .padding(16)
      .backgroundColor(0xFFFFFF)
      .flexGrow(1)

      // 底部导航栏
      // Row() {
      //   this.buildNavItem('首页', 'ic_home', false)
      //   this.buildNavItem('发布', 'ic_add', false)
      //   this.buildNavItem('社区', 'ic_community', false)
      //   this.buildNavItem('我的', 'ic_profile', true)
      // }
      // .width('100%')
      // .height(56)
      // .justifyContent(FlexAlign.SpaceAround)
      // .backgroundColor(0xFFFFFF)
      // .shadow({ radius: 8, color: 0x1A000000 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF5F5F5)
  }

  // 功能条目组件
  // 修改后的功能条目组件
  @Builder
  buildFunctionItem(label: string, icon: string, route: string) {
    Column({ space: 5 }) {
      Image($r(`app.media.${icon}`))
        .width(32)
        .height(32)
      Text(label)
        .fontSize(14)
        .fontColor(0x333333)
    }
    .onClick(() => {
      router.pushUrl({ url: route });
    })
  }

  // 帮助条目组件
  @Builder
  buildHelpItem(label: string, icon: string, route: string) {
    Row() {
      Row({ space: 8 }) {
        Image($r(`app.media.${icon}`))
          .width(20)
          .height(20)
        Text(label)
          .fontSize(15)
          .fontColor(0x333333)
      }
      Image($r('app.media.ic_right_arrow'))
        .width(14)
        .height(14)
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ top: 12, bottom: 12 })
    .onClick(() => {
      router.pushUrl({ url: route });
    })
  }


}
import { animal, BarItem, pet_responseType } from '../../types/index'
import { get } from '../../services/request'


import router from '@ohos.router';

@Entry
@Component
export struct Main_page {
  @State selected: number = 1; //下标
  @State isLoadMore: boolean = false //控制触底加载
  @State isRefresh: boolean = false
  @State current_all_page: number = 0
  @State current_wander_page: number = 0
  @State current_adopt_page: number = 0
  @State res: pet_responseType<animal[]> = { code: 0, message: '', count: -1 };
  @State petClass: string = "0" // 这里不支持中文 1: 家养宠物 , 2: 宠物用品
  @State pet_list: animal[] = []
  // @State toolBarList: BarItem[] = [
  //   {
  //     icon: $r('app.media.home'),
  //     sel_icon: $r('app.media.home_selected'),
  //     text: '全部',
  //     id: 1
  //   },
  //   {
  //     icon: $r('app.media.bell'),
  //     sel_icon: $r('app.media.bell_selected'),
  //     text: '流浪救助',
  //     id: 2
  //   },
  //   {
  //     icon: $r('app.media.marker'),
  //     sel_icon: $r('app.media.marker_selected'),
  //     text: '家养宠物',
  //     id: 3
  //   },
  // ]
  @State toolBarList: BarItem[] = [
    {
      icon: $r('app.media.home'),
      sel_icon: $r('app.media.home_selected'),
      text: '首页',
      id: 1
    },
    {
      icon: $r('app.media.bell'),
      sel_icon: $r('app.media.bell_selected'),
      text: '产品',
      id: 2
    },
    {
      icon: $r('app.media.marker'),
      sel_icon: $r('app.media.marker_selected'),
      text: '收藏',
      id: 3
    },
    {
      icon: $r('app.media.user'),
      sel_icon: $r('app.media.user_selected'),
      text: '我的',
      id: 4
    }
  ]
  @State max_page: number = 10;
  @State navigator_selected: number = 1; //下标

  @Builder
  toolBarConfig() {
    Row() {
      ForEach(this.toolBarList, (item: BarItem, index: number) => {
        Column({ space: 5 }) {
          Image(this.navigator_selected == item.id ? item.sel_icon : item.icon).width(25).height(25)
          // Text(item.text).fontColor(this.selected==item.id?Color.Red:Color.Black)
        }.onClick(() => {
          this.navigator_selected = item.id;
        })
      })

    }.width('100%')
    .justifyContent(FlexAlign.SpaceAround)
    .padding({ top: 15 })
  }

  // 根据petClass加载不同内容
  @Builder
  ContentBuilder() {
    Column() {
      if (this.res.code == 0) {
        if (this.res.count != 0) {
          List() {
            ForEach(this.pet_list, (item: animal, index: number) => {
              ListItem() {
                Column() {
                  Row() {
                    Image(item.icon).height('140').width('140').borderRadius(12).padding({ left: 10, right: 10 })
                    Column() {
                      // 标题（最大字号）
                      Text(`${item.title}`)
                        .fontSize(20)
                        .fontWeight(FontWeight.Bold)
                        .width('100%')
                        .textAlign(TextAlign.Start)
                        .margin({ bottom: 10 })
                        .maxLines(2)

                      // 基本信息行（灰色底）
                      Row() {
                        Text(`${item.age}`)
                          .padding({
                            left: 12,
                            right: 12,
                            top: 6,
                            bottom: 6
                          })
                          .backgroundColor('#f0f0f0')
                          .borderRadius(20)
                          .margin({ right: 10 })
                          .fontSize(10)
                          .flexShrink(0) // 防止挤压

                        Text(`${item.sex}`)
                          .padding({
                            left: 12,
                            right: 12,
                            top: 6,
                            bottom: 6
                          })
                          .backgroundColor('#f0f0f0')
                          .borderRadius(20)
                          .margin({ right: 10 })
                          .fontSize(10)
                          .flexShrink(0)

                        Text(`${item.pet_location}`)
                          .padding({
                            left: 12,
                            right: 12,
                            top: 6,
                            bottom: 6
                          })
                          .backgroundColor('#f0f0f0')
                          .borderRadius(20)
                          .fontSize(10)
                          .flexShrink(0)
                      }
                      // .wrap(true) // 允许换行
                      .width('100%')
                      .justifyContent(FlexAlign.Start)
                      .margin({ bottom: 8 })

                      Text(`${item.pet_describe}`)
                        .textAlign(TextAlign.Start)
                        .maxLines(2)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .fontSize(14)
                        .fontColor('#666')
                        .width('60%')
                        .margin({ bottom: 10 })
                        .padding(4)// 增加呼吸空间
                        .lineHeight(20) // 优化行高


                      // 医疗信息行（黄色底）
                      Row() {
                        Text(`${item.jieZhong}`)
                          .padding({
                            left: 12,
                            right: 8,
                            top: 6,
                            bottom: 6
                          })
                          .backgroundColor('#fffbe6')
                          .borderRadius(20)// 胶囊形圆角
                          .margin({ right: 10 })
                          .fontSize(14)

                        Text(`${item.quChong}`)
                          .padding({
                            left: 12,
                            right: 8,
                            top: 6,
                            bottom: 6
                          })
                          .backgroundColor('#fffbe6')
                          .borderRadius(20)
                          .margin({ right: 10 })
                          .fontSize(14)

                        Text(`${item.jueYu}`)
                          .padding({
                            left: 12,
                            right: 8,
                            top: 6,
                            bottom: 6
                          })
                          .backgroundColor('#fffbe6')
                          .borderRadius(20)
                          .fontSize(14)
                      }
                      // .padding(10)
                      .width('100%')
                    }

                    .width('100%')
                    .alignItems(HorizontalAlign.Start)

                    // .padding(15)
                  }.height('200')
                  .backgroundColor('#FFFFFF')
                  .onClick(() => {
                    // console.log(item._id);
                    router.push({
                      url: 'pages/my_project/adoption_details_page',
                      params: {
                        // pet_id: `11111`,
                        pet_id: `${item._id}`,
                      }
                    });
                  })

                  Divider() // 添加分隔线
                  Divider()
                  //点击之后跳转到adoption_details_page页面，数据共享？通过数据库的_id进行识别
                  // .onClick()
                }
              }

            })
          }.height('400')
          .onReachEnd(async () => {
            // console.log("reachEnd")
            if (this.isLoadMore == false) {
              this.isLoadMore = true
              // console.log("past:",this.current_all_page)
              if (this.current_all_page < this.max_page) {
                this.current_all_page = this.current_all_page + 1;
                this.reload_content(this.current_all_page); // 这里可以触发数据重载
                // console.log("current", this.current_all_page)
              }
              this.isLoadMore = false
            }
          })
        } else {
          Text('没有数据')
        }

      }
    }
    // .backgroundColor('#FFFFFF')
    .height('200%')
    .width('100%')

    // .offset({ y: -650 })

  }

  // 数据重载方法
  async reload_content(cur_page: number) {
    let result = await get(`/mypet/?pet_class=${this.petClass}&page_index=${cur_page}`)
    this.res = JSON.parse(result)
    this.pet_list.push(...this.res.data ?? []) // 这里可能是空数组所以要加上??[]
  }

  build() {
    Column() {
      Stack() {
        Row() {
          // 1. 固定导航栏（位于Stack上层）
          // 左侧城市选择
          Row() {
            Image($r('app.media.chengdushi'))
              .width(20)
              .height(20)
            Text(' 成都市')
              .font({ size: 14, weight: FontWeight.Bold })
          }
          .padding({ left: 10, top: 15, bottom: 15 })
          .backgroundColor('#FFFFFF')

          // 中间标题
          Text('救助圈・领养平台')
            .font({ size: 16, weight: FontWeight.Bold })
            .flexGrow(1)
            .textAlign(TextAlign.Center)

          // 右侧菜单按钮
          Image($r('app.media.youshangjiao'))
            .width(90)
            .height(24)
        }
        .width('100%')
        .backgroundColor('#FFFFFF')
        .align(Alignment.Top) // 固定到顶部
        .zIndex(1) // 确保导航栏位于最上层
      }

      Scroll() {
        Column() {

          // 分界线
          Row() {
          }
          .height(2)
          .width('100%')

          // 公告栏
          Column() {
            Image($r('app.media.daohangchuangkou'))
              .width('90%')
              .height("auto")
              .padding({ top: 4 })
              .borderRadius(12) //设置边框
            // .padding({ left: 20, top: 15 })

            Row() {
              Row() {
                Image($r('app.media.gonggao_maomao'))
                  .width('50')
                  .height('auto')
                  .padding({ left: 14, top: 15 })

                Text('公告 |')
                  .font({ size: 14 })
                  .padding({ top: 15 })
                  .textAlign(TextAlign.Center)
              }

              Text('恭喜江门市的还没起名成功找到家')
                .font({ size: 14 })
                .flexGrow(1)
                .padding({ top: 15 })
                .textAlign(TextAlign.Center)
            }

            .align(Alignment.Top)
            .width('100%')
            .height('auto')
            // .height(50)
            .backgroundColor('#FFFFFF')

            // .padding({ top: 10 })
          }
          .width('100%')
          .backgroundColor('#FFFFFF')


          //分界线
          Row() {
          }
          .height(10)
          .width('100%')

          // .backgroundColor('#F6F6F6')

          // 中间的部分
          // 五个部分
          Row({ space: 20 }) {
            Column() {
              Image($r('app.media.center_01'))
                .width('50')
                .borderRadius(12) //设置边框

              Row() {
              }
              .height(10)
              .width(50)

              Text("宠物寻主")
                .font({ size: 12 })
            }
            .padding({ top: 10, left: 10 })
            .onClick(()=>{
              router.pushUrl({
                url:'pages/my_project/rescue/PetFindMaster'
              })
            })

            Column() {
              Image($r('app.media.center_02'))
                .width('50')
                .borderRadius(12) //设置边框

              Row() {
              }
              .height(10)
              .width(50)

              Text("铲屎互动")
                .font({ size: 12 })
            }
            .padding({ top: 10 })

            Column() {
              Image($r('app.media.center_03'))
                .width('50')
                .borderRadius(12) //设置边框

              Row() {
              }
              .height(10)
              .width(50)

              Text("救助人专区")
                .font({ size: 12 })
            }
            .padding({ top: 10 })

            Column() {
              Image($r('app.media.center_04'))
                .width('50')
                .borderRadius(12) //设置边框


              Row() {
              }
              .height(10)
              .width(50)

              Text("合作医院")
                .font({ size: 12 })
            }
            .onClick(()=>{
              router.pushUrl({
                url:'pages/my_project/rescue/CooperativeHospital'
              })
            })
            .padding({ top: 10 })

            Column() {
              Image($r('app.media.center_05'))
                .width('50')
                .borderRadius(12) //设置边框

              Row() {
              }
              .height(10)
              .width(50)

              Text("购物返利")
                .font({ size: 12 })
            }
            .padding({ top: 10, right: 10 })
          }
          .width('100%')
          .backgroundColor('#FFFFFF')
          .width('100%')
          .height('auto')

          Image($r('app.media.zhongjianchakanfujinxinxi'))
            .height('auto')
            .width('100%')

          Row({ space: 4 }) {
            Image($r('app.media.center_left'))
              .padding({ top: 10, left: 10 })
              .height('auto')
              .width('50%')
              .borderRadius(10)
              .onClick(() => {
                // console.log(item._id);
                router.push({
                  url: 'pages/my_project/communication_group_page',
                });

              })

            Image($r('app.media.center_right'))
              .padding({ top: 10, right: 10 })
              .height('auto')
              .width('50%')
              .borderRadius(10)
              .onClick(() => {
                // console.log(item._id);
                router.push({
                  url: 'pages/my_project/affordable_mall_page',
                });
              })
          }.backgroundColor('#FFFFFF')
          .padding({ bottom: 10 })

          //分界线
          Row() {
          }
          .height(10)
          .width('100%')

          // .backgroundColor('#F6F6F6')

          Row() {
          }
          .height(10)
          .width('100%')

          // 动态内容区域
          this.ContentBuilder()

        }
        .width('100%')
        .backgroundColor('#F5F5F5')
      }
      .height('100%')
      .width('100%')
      .scrollable(ScrollDirection.Vertical)


    }
    .height('100%')
    .width('100%')
  }
}
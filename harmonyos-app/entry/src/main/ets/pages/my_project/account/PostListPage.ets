import router from '@ohos.router'

@Extend(Text) function primaryText() {
  .fontColor('#2D4B6D')
}

@Extend(Text) function secondaryText() {
  .fontColor('#647C94')
}

interface PostItem {
  title: string
  content: string
  author: string
  time: string
  likes: number
  comments: number
}

@Entry
@Component
struct PostList {
  @State posts: PostItem[] = [
    {
      title: '这个小猫咪好可爱哎，爱了爱了！！！',
      content: '今天刚领养的小猫咪，心要融化啦',
      author: '喵呜',
      time: '10分钟前',
      likes: 128,
      comments: 32
    },
    {
      title: '狗狗不吃饭求教',
      content: '家人们怎么办啊，我家的小狗最近几天都不吃饭，怎么办啊，求权威人士教一下',
      author: '汪汪',
      time: '30分钟前',
      likes: 256,
      comments: 45
    },
    {
      title: '遗弃宠物收容',
      content: '这些遗弃小动物的人好可恶啊，今天遇到一只很可怜的小猫，有人想要收容他吗？',
      author: '天使收容',
      time: '1小时前',
      likes: 89,
      comments: 67
    }
  ]

  @Styles
  cardStyle() {
    .width('100%')
    .padding({ left: 16, right: 16 })
    .backgroundColor(Color.White)
    .borderRadius(16)
    .shadow({
      radius: 12,
      color: '#1A000000',
      offsetX: 2,
      offsetY: 4
    })
  }

  build() {
    Column() {
      // 顶部导航栏
      Row({ space: 12 }) {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .onClick(() => router.back())
        Text('帖子')
          .fontSize(24)
          .fontColor('#2D4B6D')
          .fontWeight(FontWeight.Bold)
          .flexGrow(1)
        Image($r('app.media.toolbar_more'))
          .width(24)
          .height(24)
          .margin({ right: 16 })
      }
      .width('100%')
      .padding(16)
      .backgroundColor('#FFFFFF')
      .shadow({
        radius: 8,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 2
      })

      // 帖子列表
      List({ space: 12 }) {
        ForEach(this.posts, (post: PostItem) => {
          ListItem() {
            Column() {
              Row() {
                Image($r('app.media.ic_avatar'))
                  .width(40)
                  .height(40)
                  .borderRadius(20)
                Column() {
                  Text(post.author)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .primaryText()
                  Text(post.time)
                    .fontSize(14)
                    .secondaryText()
                }
                .alignItems(HorizontalAlign.Start)
                .margin({ left: 12 })
              }
              .width('100%')
              .margin({ top: 16 })

              Text(post.title)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .primaryText()
                .margin({ top: 12 })

              Text(post.content)
                .fontSize(16)
                .secondaryText()
                .margin({ top: 8 })
                .maxLines(3)
                .textOverflow({ overflow: TextOverflow.Ellipsis })

              Row() {
                Row() {
                  Image($r('app.media.ic_like'))
                    .width(20)
                    .height(20)
                    .fillColor('#647C94')
                  Text(post.likes.toString())
                    .fontSize(14)
                    .secondaryText()
                    .margin({ left: 4 })
                }
                Row() {
                  Image($r('app.media.ic_comment'))
                    .width(20)
                    .height(20)
                    .fillColor('#647C94')
                  Text(post.comments.toString())
                    .fontSize(14)
                    .secondaryText()
                    .margin({ left: 4 })
                }
                .margin({ left: 16 })
              }
              .margin({ top: 12, bottom: 16 })
            }
            .cardStyle()
          }
        })
      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)
      .margin({ top: 12, left: 16, right: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
  }
}
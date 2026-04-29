import router from '@ohos.router'
import prompt from '@ohos.prompt'
import {detail_information,iResponseModel} from './../../../types/index'
import {get} from '../../../services/request'


interface Publisher {
  nickname: string
  avatar: Resource
  status: string
}

interface Post {
  category: string
  title: string
  content: string
  images: Resource[]
  publishTime: string
  viewCount: number
  shareCount: number
  publisher: Publisher
}

interface CommentUser {
  nickname: string
  avatar: Resource
}

interface Comment {
  user: CommentUser
  content: string
  time: string
  likeCount: number
}

@Entry
@Component
struct PostDetailPage {
  @State post: Post = {
    category: '闲置',
    title: '小猫咪',
    content: '好可爱啊',
    images: [
      $r('app.media.ic_add_photo'),
      $r('app.media.ic_add_photo'),
      $r('app.media.ic_add_photo')
    ],
    publishTime: '2025-03-15 13:18:17',
    viewCount: 767,
    shareCount: 0,
    publisher: {
      nickname: '小可爱645307',
      avatar: $r('app.media.default_avatar'),
      status: '4天前在线'
    }
  }

  @State comments: Comment[] = [{
    user: {
      nickname: '小可爱796426',
      avatar: $r('app.media.default_avatar')
    },
    content: '博主地址在哪里',
    time: '2025-03-16 18:55:38',
    likeCount: 0
  }, {
    user: {
      nickname: '爱猫人士',
      avatar: $r('app.media.default_avatar')
    },
    content: '多大了啊，平时爱吃什么，打疫苗了吗？',
    time: '2025-03-16 18:30:00',
    likeCount: 2
  }, {
    user: {
      nickname: '铲屎官',
      avatar: $r('app.media.default_avatar')
    },
    content: '请问具体是什么牌子的羊奶粉呢？',
    time: '2025-03-16 18:20:15',
    likeCount: 1
  }]
  @State res:iResponseModel<detail_information> = {code:0,message:''}
  @State curName:object = router.getParams()
  // @State curName:String = '2'
  @State commentText: string = ''
  @State cur_page_data:detail_information|undefined = {
    _id:"",
    userName:"",
    title:"",
    avatar:"",
    time:"",
    picture:"",
    tag:"",
    text:"",
  };



  async aboutToAppear():Promise<void> {
    // let result = await get(`/community/getByName?userName=${this.curName}`);
    console.log(`/community/getByName?userName=${this.curName['userName']}`)
    let result = await get(`/community/getByName?userName=${this.curName['userName']}`);
    this.res = JSON.parse(result);
    this.cur_page_data = this.res.data;
    console.log(`/community/getByName?userName=${this.curName['userName']}`)
    // console.log('111',this.res.message)
  }

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.ic_back')).height(30).width(30).padding({left:10,bottom:2})
          .onClick(()=>{
            router.back();
          })
        Text('帖子详情')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .margin({ left: 16 })
        Blank()
        Image($r('app.media.more'))
          .width(120)
          .height(24)
          .margin({ right: 16 })
      }
      .width('100%')
      .height(56)
      .backgroundColor(Color.White)

      // 帖子内容区域
      Scroll() {
        Column() {

          Image(this.cur_page_data?.picture).height(240).width('100%').borderRadius(12).padding({left:10,right:10})

          // 帖子头部信息
          Row() {
            Image(this.cur_page_data?.avatar)
              .width(40)
              .height(40)
              .borderRadius(20)
            Column() {
              Text(this.cur_page_data?.title)
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text(this.post.publisher.status)
                .fontSize(12)
                .fontColor('#999999')
            }
            .alignItems(HorizontalAlign.Start)
            .margin({ left: 12 })
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Color.White)

          // 帖子分类和标题
          Row() {
            Text(this.cur_page_data?.tag)
              .fontSize(14)
              .backgroundColor('#F5F5F5')
              .padding({ left: 12, right: 12, top: 4, bottom: 4 })
              .borderRadius(12)
            Text(' | ')
              .fontSize(14)
              .fontColor('#999999')
            Text(this.post.title)
              .fontSize(14)
          }
          .width('100%')
          .padding({ left: 16, right: 16, top: 8, bottom: 8 })
          .backgroundColor(Color.White)

          // 帖子正文
          Text(this.cur_page_data?.text)
            .fontSize(16)
            .width('100%')
            .padding(16)
            .backgroundColor(Color.White)

          // 帖子数据
          Row() {
            Text(this.post.publishTime)
              .fontSize(12)
              .fontColor('#999999')
            Blank()
            Text(`${this.post.viewCount} 查看`)
              .fontSize(12)
              .fontColor('#999999')
            Text(`${this.post.shareCount} 转发`)
              .fontSize(12)
              .fontColor('#999999')
              .margin({ left: 16 })
          }
          .width('100%')
          .padding({ left: 16, right: 16, top: 8, bottom: 8 })
          .backgroundColor(Color.White)

          // 分割线
          Text('最新留言')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .width('100%')
            .padding(16)
            .margin({ top: 8 })
            .backgroundColor(Color.White)

          // 评论列表
          ForEach(this.comments, (comment: Comment) => {
            Column() {
              Row() {
                Image(comment.user.avatar)
                  .width(32)
                  .height(32)
                  .borderRadius(16)
                Column() {
                  Text(comment.user.nickname)
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                  Text(comment.time)
                    .fontSize(12)
                    .fontColor('#999999')
                }
                .alignItems(HorizontalAlign.Start)
                .margin({ left: 8 })
                Blank()
                Image($r('app.media.ic_like'))
                  .width(20)
                  .height(20)
                Text(comment.likeCount.toString())
                  .fontSize(12)
                  .fontColor('#999999')
                  .margin({ left: 4 })
              }
              .width('100%')
              .padding({ left: 16, right: 16, top: 12, bottom: 8 })

              Text(comment.content)
                .fontSize(14)
                .width('100%')
                .padding({ left: 56, right: 16, bottom: 12 })
            }
            .backgroundColor(Color.White)
          })
        }
      }
      .layoutWeight(1)

      // 底部评论栏
      Row() {
        Row() {
          Image($r('app.media.ic_comment'))
            .onClick(()=>{
              router.pushUrl({url:'pages/my_project/community/CommentPage'})
            })
            .width(20)
            .height(20)
            .margin({ right: 8 })
          TextInput({ text: this.commentText, placeholder: '写留言...' })
            .fontSize(14)
            .backgroundColor('transparent')
            .placeholderColor('#999999')
            .layoutWeight(1)
            .height(36)
            .type(InputType.Normal)
            .onChange((value: string) => {
              this.commentText = value
            })
        }
        .backgroundColor('#F5F5F5')
        .padding({ left: 16, right: 16 })
        .height(36)
        .borderRadius(18)
        .layoutWeight(1)

        Button() {
          Text('发送')
            .fontColor(this.commentText.trim() ? '#000000' : '#999999')
            .fontSize(14)
        }
        .height(36)
        .backgroundColor(this.commentText.trim() ? '#FFD700' : '#F5F5F5')
        .margin({ left: 16 })
        .onClick(() => {
          if (!this.commentText.trim()) {
            return
          }
          // TODO: 处理发送评论逻辑
          const newComment: Comment = {
            user: {
              nickname: '我',
              avatar: $r('app.media.default_avatar')
            },
            content: this.commentText,
            time: new Date().toLocaleString(),
            likeCount: 0
          }
          this.comments.unshift(newComment)
          this.commentText = ''
          prompt.showToast({
            message: '发送成功'
          })
        })
      }
      .width('100%')
      .padding(16)
      .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F8F8F8')
  }
}
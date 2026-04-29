import { promptAction,router } from '@kit.ArkUI';
import { post } from './../services/request'
@Entry
@Component
export struct Login {
  @State message: string = 'Hello World';
  @State email: string = '';
  @State pwd: string ='';
  //登录的流程
  async login(){
    //1. 判断用户名或密码是否为空
     if(this.email.length==0){
       AlertDialog.show({ message:'请输入Email'})
       // promptAction.showToast({
       //   message:'请输入Email',
       //   duration:2000
       // })
       return;
     }

    if(this.pwd.length==0){
      promptAction.showToast({
        message:'请输入密码',
        duration:2000
      })
      return;
    }
    //2. 验证有效 email 格式 @ . 正则表达式的验证
    // ArkTs正则表达式   正则表达式.test(字符串)
    // Email正则式
    // if(!/^[a-zA-Z0-9_\.]+@[a-zA-Z0-9-]+[\.a-zA-Z]+$/.test(this.email)){
    //   promptAction.showToast({
    //     message:'Email的格式有问题',
    //     duration:2000
    //   })
    //   return;
    // }

    //3. 将输入的Email和密码，发送到服务器进行验证
    let param =JSON.stringify({
      "userName":this.email,
      "userPwd":this.pwd
    });
    let result = await post('http://localhost:3000/user/login',param);
   let code:number =  JSON.parse(result).code;
   if(code==200){
     //4. 提示登录成功
     promptAction.showToast({
       message:'登录成功',
       duration:2000
     })
     //5.跳转到首页
     router.pushUrl({url:'pages/Day02'})
   }else{
     promptAction.showToast({
       message:JSON.parse(result).message,
       duration:2000
     })
   }

    //router.replaceUrl({url:'pages/Day02'}) //不会记录页面历史
  }
  build() {
    Column() {

      // 线
       Row(){

       }.width('100%').height(20).border({
         width:{bottom:1},
         color:{bottom:'#BDBDBD'}
       })
      //logo
       Image($r('app.media.Group')).width(94).height(94).offset({y:-47})
         .backgroundColor(Color.White)
         .padding(15)

         //标题
      Text('Hello !').width('100%').fontFamily('Merriweather').fontSize(30).fontColor('#909090')
      Text('WELCOME BACK').width('100%')
        .fontFamily('Merriweather')
        .fontSize(24)
        .fontColor('#303030')
        .fontWeight(FontWeight.Bolder)
        .lineHeight(45)
        .letterSpacing(1.2)

      // 输入框
      TextInput({placeholder:'Email'})
        .backgroundColor(Color.Transparent).border({
        width:{bottom:2},
        color:{bottom:'#E0E0E0'},
        radius:0
      }).margin({top:70,bottom:30})
        .fontFamily('Nunito Sans')
        .fontSize(14)
        .lineHeight(20)
        .letterSpacing(0)
        .placeholderColor('#909090')
        .onChange((v)=>{
          //v: 表示文本框输入的内容
          this.email = v;
        })

      TextInput({placeholder:'Password'})
        .type(InputType.Password)
        .backgroundColor(Color.Transparent).border({
        width:{bottom:2},
        color:{bottom:'#E0E0E0'},
        radius:0
      })
        .fontFamily('Nunito Sans')
        .fontSize(14)
        .lineHeight(20)
        .letterSpacing(0)
        .placeholderColor('#909090')
        .onChange((v)=>{
          //v: 表示文本框输入的内容
          this.pwd = v;
        })

      //密码密码
      Text('Forgot Password').margin({top:30,bottom:60}).fontSize(18).fontFamily('Nunito Sans')

      //登录按钮
      Button('Log in',{type:ButtonType.Normal}).width(285).height(50)
        .backgroundColor('#242424').borderRadius(4).fontSize(20)
        //.enabled(this.email.length>0&&this.pwd.length>0?true:false)
        .onClick(()=>{
          //进行登录的流程
          this.login()
        })

      // SIGN UP
      Text('SING UP').margin({top:40}).fontFamily('Nunito Sans')
        .fontWeight(600)
    }
    .height('100%')
    .width('100%')
    .padding({left:30,right:30})
  }
}
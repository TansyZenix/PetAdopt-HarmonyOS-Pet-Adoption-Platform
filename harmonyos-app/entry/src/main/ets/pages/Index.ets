@Entry
@Component
export struct Index {
  @State message: string = 'PetAdopt Home';

  build() {
   Column(){
     Row(){}.height(100).width(100).borderWidth(2).borderRadius(50)
     Row(){}.height(50).width(200).borderWidth(2).borderRadius(25)
       // Text('Welcome to PetAdopt')
       //   .fontColor(Color.Green)
       //   .fontSize(30)
       //   .fontStyle(FontStyle.Italic)
       //   .fontWeight(FontWeight.Bold)
       //   .lineHeight(69)
         //边框设置
         // .borderStyle(BorderStyle.Solid)
         // .borderWidth(2)
         // .borderColor(Color.Red)
         // .border({
         //   style:{
         //     top:BorderStyle.Solid,
         //     left:BorderStyle.Dotted,
         //     right:BorderStyle.Dashed,
         //     bottom:BorderStyle.Dotted
         //   },
         //   width:{
         //     top:20,
         //     left:10,
         //     right:13,
         //     bottom:5
         //   },
         //   color:{
         //     top:Color.Red,
         //     left:Color.Green,
         //     right:Color.Orange,
         //     bottom:Color.Pink
         //   },
         //   radius:{
         //     topLeft:2,
         //     topRight:20,
         //     bottomLeft:50,
         //     bottomRight:100
         //   }
         // })
         // .borderRadius(12)

         // .decoration({
         //
         //   type: TextDecorationType.Underline,
         //
         //   color: Color.Red,
         //
         //   style: TextDecorationStyle.DOTTED
         //
         // })
       // Text('How are you !')
       // Text('Fine ,thank you').fontColor(Color.Red)
     // }
    //  .backgroundColor(Color.Gray)
    //   .backgroundImage($r('app.media.app_icon'))
    // // .backgroundImageSize(ImageSize.Cover)
    //  .backgroundImage("https://img2.baidu.com/it/u=2215267353,4092178050&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=1084")
    //  .backgroundImageSize(ImageSize.Contain)
    //  .backgroundImagePosition({x:50,y:50})



   }.height('100%')
    .width('100%')
  }
}
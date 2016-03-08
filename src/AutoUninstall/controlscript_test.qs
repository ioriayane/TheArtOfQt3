//コンストラクタ（必須）
function Controller()
{
}

//概要ページが表示されたときのコールバック
Controller.prototype.IntroductionPageCallback = function()
{
  if(!installer.isInstaller()){                         //インストーラ以外のとき
    var widget = gui.currentPageWidget()                //現在のページのオブジェクトを取得
    if(widget != null){
      //ラジオボタンの削除を選択
      widget.findChild("UninstallerRadioButton").checked = true
      //ラジオボタンを非表示
//      widget.findChild("UninstallerRadioButton").visible = false
//      widget.findChild("PackageManagerRadioButton").visible = false
//      widget.findChild("UpdaterRadioButton").visible = false

//widget.MessageLabel.text = widget.findChild("UninstallerRadioButton").text
    }
  }
}

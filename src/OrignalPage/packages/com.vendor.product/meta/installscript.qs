//コンストラクタ
function Component()
{
  //標準インストールで通らないページを非表示にする。
  installer.setDefaultPageVisible(QInstaller.TargetDirectory, false)
  installer.setDefaultPageVisible(QInstaller.ComponentSelection, false)

  //ロードされたときのシグナル
  component.loaded.connect(this, Component.prototype.loaded)
  //ページを追加する
  installer.addWizardPage(component, "StandardOrCustom", QInstaller.TargetDirectory)
}

//翻訳が行われたときに実行する処理
Component.prototype.retranslateUi = function()
{
  try{
    //ページのオブジェクトを取得（QWidget）
    var widget = gui.pageWidgetByObjectName("DynamicStandardOrCustom")
    if(widget != null){
      //メッセージの一部をアプリ名に変更
      widget.standardLabel.text = widget.standardLabel.text.replace("%NAME%"
                                             , installer.value("ProductName"))
    }
  }catch(e){
    print(e)
  }
}

//ロードされたときのシグナルハンドラ
Component.prototype.loaded = function ()
{
  try{
    //ページのオブジェクトを取得（QWidget）
    var widget = gui.pageWidgetByObjectName("DynamicStandardOrCustom")
    if(widget != null){
      //標準のラジオボタンの状態がトグルしたときのシグナル
      widget.standardRadioButton.toggled.connect(
                         Component.prototype.standardRadioButtonToggled)
    }
  }catch(e){
    print(e)
  }
}

//標準のラジオボタンの状態がトグルしたときのシグナルハンドラ
Component.prototype.standardRadioButtonToggled = function (checked)
{
  try{
    //インストール先の選択
    installer.setDefaultPageVisible(QInstaller.TargetDirectory, !checked)
    //コンポーネントの選択
    installer.setDefaultPageVisible(QInstaller.ComponentSelection, !checked)
  }catch(e){
    print(e)
  }
}

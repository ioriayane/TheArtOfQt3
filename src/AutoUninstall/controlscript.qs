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
      widget.findChild("UninstallerRadioButton").checked = true           //ラジオボタンの削除を選択
      gui.clickButton(buttons.NextButton)               //次へボタンを押す
    }
  }else{
    gui.clickButton(buttons.NextButton)     //次へボタンを押す
  }
}

//フォルダ選択が表示されたときのコールバック
Controller.prototype.TargetDirectoryPageCallback = function()
{
  gui.clickButton(buttons.NextButton)     //次へボタンを押す
}

//ライセンス許諾ページが表示されたときのコールバック
Controller.prototype.LicenseAgreementPageCallback = function()
{
  var widget = gui.currentPageWidget()                //現在のページのオブジェクトを取得
  if(widget != null){
    widget.AcceptLicenseRadioButton.checked = true    //ラジオボタンの同意側を選択
    gui.clickButton(buttons.NextButton)               //次へボタンを押す
  }
}

//コンポーネント選択ページが表示されたときのコールバック
Controller.prototype.ComponentSelectionPageCallback = function()
{
  gui.clickButton(buttons.NextButton)       //次へボタンを押す
}

//スタートメニューディレクトリ選択ページが表示されたときのコールバック
Controller.prototype.StartMenuDirectoryPageCallback = function()
{
  gui.clickButton(buttons.NextButton)       //次へボタンを押す
}

//開始確認ページが表示されたときのコールバック
Controller.prototype.ReadyForInstallationPageCallback = function()
{
  gui.clickButton(buttons.CommitButton)     //次へボタンを押す
}

//完了確認ページが表示されたときのコールバック
Controller.prototype.FinishedPageCallback = function()
{
  gui.clickButton(buttons.FinishButton)     //次へボタンを押す
}

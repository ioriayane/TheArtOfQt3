//�R���X�g���N�^
function Component()
{
  //�W���C���X�g�[���Œʂ�Ȃ��y�[�W���\���ɂ���B
  installer.setDefaultPageVisible(QInstaller.TargetDirectory, false)
  installer.setDefaultPageVisible(QInstaller.ComponentSelection, false)

  //���[�h���ꂽ�Ƃ��̃V�O�i��
  component.loaded.connect(this, Component.prototype.loaded)
  //�y�[�W��ǉ�����
  installer.addWizardPage(component, "StandardOrCustom", QInstaller.TargetDirectory)
}

//�|�󂪍s��ꂽ�Ƃ��Ɏ��s���鏈��
Component.prototype.retranslateUi = function()
{
  try{
    //�y�[�W�̃I�u�W�F�N�g���擾�iQWidget�j
    var widget = gui.pageWidgetByObjectName("DynamicStandardOrCustom")
    if(widget != null){
      //���b�Z�[�W�̈ꕔ���A�v�����ɕύX
      widget.standardLabel.text = widget.standardLabel.text.replace("%NAME%"
                                             , installer.value("ProductName"))
    }
  }catch(e){
    print(e)
  }
}

//���[�h���ꂽ�Ƃ��̃V�O�i���n���h��
Component.prototype.loaded = function ()
{
  try{
    //�y�[�W�̃I�u�W�F�N�g���擾�iQWidget�j
    var widget = gui.pageWidgetByObjectName("DynamicStandardOrCustom")
    if(widget != null){
      //�W���̃��W�I�{�^���̏�Ԃ��g�O�������Ƃ��̃V�O�i��
      widget.standardRadioButton.toggled.connect(
                         Component.prototype.standardRadioButtonToggled)
    }
  }catch(e){
    print(e)
  }
}

//�W���̃��W�I�{�^���̏�Ԃ��g�O�������Ƃ��̃V�O�i���n���h��
Component.prototype.standardRadioButtonToggled = function (checked)
{
  try{
    //�C���X�g�[����̑I��
    installer.setDefaultPageVisible(QInstaller.TargetDirectory, !checked)
    //�R���|�[�l���g�̑I��
    installer.setDefaultPageVisible(QInstaller.ComponentSelection, !checked)
  }catch(e){
    print(e)
  }
}

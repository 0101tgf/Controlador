object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 263
  Width = 293
  object conexao: TFDConnection
    Params.Strings = (
      'OpenMode=ReadWrite'
      'LockingMode=Normal'
      
        'Database=C:\Users\0101tgf\Desktop\Controlador\Win32\Release\conf' +
        'ig.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 144
    Top = 96
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 144
    Top = 152
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 144
    Top = 32
  end
end

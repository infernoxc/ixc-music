; Inno Setup 6 script for IXC Music (optional .exe installer).
; Built by build\build.ps1 -Installer  (passes AppVersion and SourceDir). Per-user install, no admin rights.
; The .exe simply unpacks the release files and runs scripts\install.ps1 - the same thing Install.bat does.
; Copyright (c) 2026 Ishan (InFerNoxC) - MIT License

#ifndef AppVersion
  #define AppVersion "1.0.0"
#endif
#ifndef SourceDir
  #define SourceDir "..\dist\stage"
#endif

[Setup]
AppId={{3B7E2A91-5C4D-4F8E-A1B2-7D9C0E6F1A01}
AppName=IXC Music
AppVersion={#AppVersion}
AppPublisher=Ishan (InFerNoxC)
AppPublisherURL=https://github.com/infernoxc/ixc-music
AppSupportURL=https://github.com/infernoxc/ixc-music/issues
DefaultDirName={localappdata}\IXC-OBS\package-IXC-Music
DisableDirPage=yes
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputBaseFilename=IXC-Music-Setup-v{#AppVersion}
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
LicenseFile={#SourceDir}\LICENSE
UninstallDisplayName=IXC Music
Uninstallable=yes

[Files]
Source: "{#SourceDir}\*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion

[Run]
Filename: "{sysnative}\WindowsPowerShell\v1.0\powershell.exe"; Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{app}\scripts\install.ps1"""; StatusMsg: "Installing IXC Music..."; Flags: runhidden waituntilterminated

[UninstallRun]
Filename: "{sysnative}\WindowsPowerShell\v1.0\powershell.exe"; Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{localappdata}\IXC-OBS\app\scripts\uninstall.ps1"" -App music"; Flags: runhidden waituntilterminated; RunOnceId: "IXCUninstall"

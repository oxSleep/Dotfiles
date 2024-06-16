$Env:_ZO_DATA_DIR = "$Env:XDG_CONFIG_HOME\zoxide"
$Env:XMAKE_GLOBALDIR = "$Env:XDG_CONFIG_HOME\xmake"

function prompt {
  "$(Get-Location) >> "
}

Set-PSReadlineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineOption -BellStyle None
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -Colors @{
    Command = 'Yellow'
    Parameter = 'Green'
    String = 'DarkCyan'
}

Set-PSReadLineKeyHandler -Key ctrl+p -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key ctrl+n -Function HistorySearchForward

Invoke-Expression (& { (zoxide init powershell | Out-String) })
Clear-Host

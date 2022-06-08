param(
  [string]$pth # file path
)
process {
  $dir=Split-Path -Parent $pth
  $new=$_
  if (Test-Path $pth) {
    $stm=New-Object System.IO.StreamReader($pth)
    $old=$stm.ReadToEnd()
    $stm.Close()
  }
  else {
    $old=''
  }
  if ($new -ne $old) {
    if (-Not(Test-Path $dir)) {
      New-Item -ItemType Directory $dir
    }
    [IO.File]::WriteAllText($pth,$new)
  }
}

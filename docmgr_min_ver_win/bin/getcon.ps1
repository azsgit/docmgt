param(
  [string]$pth # file path
)
process {
  $stm=New-Object System.IO.StreamReader($pth)
  $stm.ReadToEnd()
}

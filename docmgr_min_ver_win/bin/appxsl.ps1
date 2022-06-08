param(
  [string]$xsl='', # xslt file path
  [string[]]$arg=@() # xslt params (a=x,b=y,...)
)

begin {

# input

  $stmget=New-Object System.IO.MemoryStream
  $stmwri=New-Object System.IO.StreamWriter($stmget)

# transform

  $xslobj=New-Object System.Xml.Xsl.XslCompiledTransform
  $xslobj.Load($xsl)

  $xslarg=New-Object System.Xml.Xsl.XsltArgumentList
  foreach ($i in $arg) {
    $a=$i.Split('=')
    $xslarg.AddParam(@($a)[0],'',@($a)[1])
  }

# output

  $stmset=New-Object System.IO.MemoryStream
  $stmrea=New-Object System.IO.StreamReader($stmset)

  $xmlprm=$xslobj.OutputSettings

}

process {

# input

  $stmwri.Write($_)
  $stmwri.Flush()
  $stmget.Position=0
  $xmlget=[System.Xml.XmlReader]::Create($stmget)

# output

  $xmlset=[System.Xml.XmlWriter]::Create($stmset,$xmlprm)

# transform

  $xslobj.Transform($xmlget,$xslarg,$xmlset)

# output

  $stmset.Position=0
  $stmrea.ReadToEnd()

}

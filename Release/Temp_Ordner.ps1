Add-Type -AssemblyName System.Windows.Forms

$TempFolder = $env:TEMP
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Ordner Löschen"
$Form.Width = 400
$Form.Height = 200

$Label = New-Object System.Windows.Forms.Label
$Label.Text = "Temp Ordner löschen: $TempFolder"
$Label.AutoSize = $true
$Label.Location = New-Object System.Drawing.Point(10,10)
$Form.Controls.Add($Label)

$Button = New-Object System.Windows.Forms.Button
$Button.Text = "Löschen"
$Button.Location = New-Object System.Drawing.Point(10,60)
$Button.Add_Click({
    if(Test-Path $TempFolder){
        Remove-Item -Path $TempFolder -Recurse -Force
        $Form.Close()
        Write-Host "Der Temp Ordner $TempFolder wurde gelöscht."
    }else{
        Write-Host "Der Temp Ordner existiert nicht."
    }

})
$Form.Controls.Add($Button)

$Form.ShowDialog()

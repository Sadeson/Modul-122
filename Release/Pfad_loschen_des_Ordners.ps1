Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Ordner löschen"
$Form.Width = 300
$Form.Height = 200

$Label = New-Object System.Windows.Forms.Label
$Label.Text = "Pfad eingeben welches gelöscht werden soll:"
$Label.AutoSize = $true
$Label.Location = New-Object System.Drawing.Point(10,10)
$Form.Controls.Add($Label)

$TextBox = New-Object System.Windows.Forms.TextBox
$TextBox.Location = New-Object System.Drawing.Point(10,30)
$Form.Controls.Add($TextBox)

$Button = New-Object System.Windows.Forms.Button
$Button.Text = "Delete"
$Button.Location = New-Object System.Drawing.Point(10,60)
$Button.Add_Click({
    $FolderPath = $TextBox.Text
    if(Test-Path $FolderPath){
        Remove-Item -Path $FolderPath -Recurse -Force
        $Form.Close()
        Write-Host "Der Ordner $FolderPath wurde gelöscht."
    }else{
        Write-Host "Ordner existiert nicht bitte nochmal überprüfen."
    }

})
$Form.Controls.Add($Button)

$Form.ShowDialog()
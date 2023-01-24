Add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form
$form.Text = "My PowerShell GUI"
$form.Size = New-Object System.Drawing.Size(300,200)

$label = New-Object System.Windows.Forms.Label
$label.Text = "Hello, World!"
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(10,10)
$form.Controls.Add($label)

$button = New-Object System.Windows.Forms.Button
$button.Text = "Klick mich"
$button.Size = New-Object System.Drawing.Size(75,30)
$button.Location = New-Object System.Drawing.Point(200,10)
$form.Controls.Add($button)


$button.Add_Click({
    $label.Text = "Button wurde betätigt!"
})


$form.ShowDialog()

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$formHash = New-Object System.Windows.Forms.Form
$formHash.Text = 'Hash Function'
$formHash.Size = New-Object System.Drawing.Size(300,200)
$formHash.StartPosition = 'CenterScreen'

$okButtonHash = New-Object System.Windows.Forms.Button
$okButtonHash.Location = New-Object System.Drawing.Point(75,120)
$okButtonHash.Size = New-Object System.Drawing.Size(75,23)
$okButtonHash.Text = 'OK'
$okButtonHash.DialogResult = [System.Windows.Forms.DialogResult]::OK
$formHash.AcceptButton = $okButtonHash
$formHash.Controls.Add($okButtonHash)

$cancelButtonHash = New-Object System.Windows.Forms.Button
$cancelButtonHash.Location = New-Object System.Drawing.Point(150,120)
$cancelButtonHash.Size = New-Object System.Drawing.Size(75,23)
$cancelButtonHash.Text = 'Cancel'
$cancelButtonHash.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$formHash.CancelButton = $cancelButtonHash
$formHash.Controls.Add($cancelButtonHash)

$labelHash = New-Object System.Windows.Forms.Label
$labelHash.Location = New-Object System.Drawing.Point(10,20)
$labelHash.Size = New-Object System.Drawing.Size(280,20)
$labelHash.Text = 'Please select a cryptographic hash function:'
$formHash.Controls.Add($labelHash)

$listBoxHash = New-Object System.Windows.Forms.ListBox
$listBoxHash.Location = New-Object System.Drawing.Point(10,40)
$listBoxHash.Size = New-Object System.Drawing.Size(260,80)

[void] $listBoxHash.Items.Add('SHA1')
[void] $listBoxHash.Items.Add('SHA256')
[void] $listBoxHash.Items.Add('SHA384')
[void] $listBoxHash.Items.Add('SHA512')
[void] $listBoxHash.Items.Add('MD5')

$formHash.Controls.Add($listBoxHash)

$formHash.Topmost = $true

$resultHash = $formHash.ShowDialog()

if ($resultHash -eq [System.Windows.Forms.DialogResult]::OK)
{
    $selectedAlgorithm = $listBoxHash.SelectedItem
}
else
{
    Write-Host "Program Closing..."
    Start-Sleep -Seconds 1
    exit
}

$formDataEntry = New-Object System.Windows.Forms.Form
$formDataEntry.Text = 'Data Entry Form'
$formDataEntry.Size = New-Object System.Drawing.Size(300,200)
$formDataEntry.StartPosition = 'CenterScreen'

$okButtonDataEntry = New-Object System.Windows.Forms.Button
$okButtonDataEntry.Location = New-Object System.Drawing.Point(75,120)
$okButtonDataEntry.Size = New-Object System.Drawing.Size(75,23)
$okButtonDataEntry.Text = 'OK'
$okButtonDataEntry.DialogResult = [System.Windows.Forms.DialogResult]::OK
$formDataEntry.AcceptButton = $okButtonDataEntry
$formDataEntry.Controls.Add($okButtonDataEntry)

$cancelButtonDataEntry = New-Object System.Windows.Forms.Button
$cancelButtonDataEntry.Location = New-Object System.Drawing.Point(150,120)
$cancelButtonDataEntry.Size = New-Object System.Drawing.Size(75,23)
$cancelButtonDataEntry.Text = 'Cancel'
$cancelButtonDataEntry.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$formDataEntry.CancelButton = $cancelButtonDataEntry
$formDataEntry.Controls.Add($cancelButtonDataEntry)

$labelDataEntry = New-Object System.Windows.Forms.Label
$labelDataEntry.Location = New-Object System.Drawing.Point(10,20)
$labelDataEntry.Size = New-Object System.Drawing.Size(280,20)
$labelDataEntry.Text = 'Please enter the object name for exe file:'
$formDataEntry.Controls.Add($labelDataEntry)

$textBoxDataEntry = New-Object System.Windows.Forms.TextBox
$textBoxDataEntry.Location = New-Object System.Drawing.Point(10,40)
$textBoxDataEntry.Size = New-Object System.Drawing.Size(260,20)
$formDataEntry.Controls.Add($textBoxDataEntry)

$labelInput = New-Object System.Windows.Forms.Label
$labelInput.Location = New-Object System.Drawing.Point(10,70)
$labelInput.Size = New-Object System.Drawing.Size(280,20)
$labelInput.Text = $selectedAlgorithm + ' ' + 'Sum'
$formDataEntry.Controls.Add($labelInput)

$textBoxInput = New-Object System.Windows.Forms.TextBox
$textBoxInput.Location = New-Object System.Drawing.Point(10,90)
$textBoxInput.Size = New-Object System.Drawing.Size(260,20)
$formDataEntry.Controls.Add($textBoxInput)

$formDataEntry.Topmost = $true

$formDataEntry.Add_Shown({$textBoxDataEntry.Select()})
$resultDataEntry = $formDataEntry.ShowDialog()

if ($resultDataEntry -eq [System.Windows.Forms.DialogResult]::OK)
{
    $objectName = $textBoxDataEntry.Text
    $checksum = $textBoxInput.Text
}
else
{
    Write-Host "Program Closing..."
    Start-Sleep -Seconds 1
    exit
}

try
{
    $hashResult = Get-FileHash $objectName -Algorithm $selectedAlgorithm -ErrorAction Stop | Select-Object -ExpandProperty Hash
}
catch
{
    $ErrorMessage = $_.Exception.Message
}



if($hashResult -eq $checksum.ToLower()){
    $result = [System.Windows.Forms.MessageBox]::Show("Success", "Checksum Result", [System.Windows.Forms.MessageBoxButtons]::OK)
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        Write-Host "Program Closing..."
        Start-Sleep -Seconds 1
        exit
    }
}
else{
    $result = [System.Windows.Forms.MessageBox]::Show("Error Message = "+$ErrorMessage, "Checksum Result", [System.Windows.Forms.MessageBoxButtons]::OK)
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        Write-Host "Program Closing..."
        Start-Sleep -Seconds 1
        exit
    }
}


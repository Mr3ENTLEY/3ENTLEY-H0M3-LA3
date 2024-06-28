# VAR
$DeviceName = $env:COMPUTERNAME
$CPU = (Get-WmiObject Win32_Processor).Name
$RAM = "Total Installed RAM: $((Get-WmiObject Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB) GB"
$ARCH = (Get-WmiObject Win32_OperatingSystem).OSArchitecture

# Get storage information for each drive (C:, D:, E:, F:)
$STOR = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 } | ForEach-Object {
    "Drive: $($_.DeviceID), Volume Name: $($_.VolumeName), Capacity: $([math]::Round($_.Size / 1GB, 2)) GB"
}

$GCARD = (Get-WmiObject Win32_VideoController).Name

$filePath = "E:\DEV\GitHub\Readme.md" ## Adjust this path based on your device configuration! 

function Format-MarkdownLine {
    param(
        [string]$Component,
        [string]$Specification,
        [int]$maxLength
    )
    $componentPadded = $Component.PadRight($maxLength)
    "| $componentPadded | $Specification |"
}

$maxComponentLength = ($DeviceName.Length, $CPU.Length, $RAM.Length, $ARCH.Length, "Storage".Length, $GCARD.Length) | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum

$storageLines = foreach ($index in 0..($STOR.Count - 1)) {
    $storageLabel = "Storage $($index + 1)"
    Format-MarkdownLine -Component $storageLabel -Specification $STOR[$index] -maxLength $maxComponentLength
}

$newContent = @"
## $DeviceName

$(Format-MarkdownLine -Component "Device Name" -Specification $DeviceName -maxLength $maxComponentLength)
$(Format-MarkdownLine -Component "CPU" -Specification $CPU -maxLength $maxComponentLength)
$(Format-MarkdownLine -Component "RAM" -Specification $RAM -maxLength $maxComponentLength)
$(Format-MarkdownLine -Component "Architecture" -Specification $ARCH -maxLength $maxComponentLength)
$($storageLines -join "`n")
$(Format-MarkdownLine -Component "Graphics Card" -Specification $GCARD -maxLength $maxComponentLength)
"@

$newContent | Set-Content -Path $filePath -Force

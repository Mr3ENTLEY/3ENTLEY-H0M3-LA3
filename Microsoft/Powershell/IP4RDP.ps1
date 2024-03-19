<#
.SYNOPSIS

This PowerShell script is designed to simplify remote desktop access by automatically generating and managing Remote Desktop Protocol (RDP) files. Here's how it functions:

Initially, it checks and clears any existing RDP files from a specified iCloud Drive folder to prevent duplication and ensure only the most current configurations are stored.
It fetches the current public IP address of the machine using an external API, a crucial step for setting up RDP connections over the internet.
The script creates RDP file contents, incorporating the public IP, a designated port number, and user credentials (username and password), which are essential for remote access.
The generated RDP files, named after a predefined "FriendlyName," are then uploaded to a specific iCloud Drive folder. This process facilitates easy access to RDP files across various devices, streamlining remote connections.
After uploading, the script periodically checks to ensure the RDP files are successfully updated in the iCloud Drive folder, using the presence of the file as confirmation.

The script is structured for ease of use and automation, aiming to facilitate a seamless setup for remote desktop connections by managing RDP files effectively. It emphasizes the importance of manually adjusting the iCloud Drive folder path to match the user's system configuration and calls for caution regarding security practices, particularly the handling of user credentials and the use of port forwarding.#>
#>

function Clear-ICloudDriveFolder {
    param(
        [string]$FolderPath
    )
    try {
        # Check if the folder exists
        if (Test-Path $FolderPath) {
            # Get all files in the folder and delete them
            Get-ChildItem -Path $FolderPath -Filter "*.rdp" | ForEach-Object { Remove-Item $_.FullName -Force }
            Write-Host "All previous RDP files in the iCloud Drive folder have been deleted."
        } else {
            Write-Host "The specified iCloud Drive folder does not exist."
        }
    } catch {
        Write-Host "Failed to clear the iCloud Drive folder: $_"
    }
}

function Get-PublicIPAddress {
    try {
        $publicIp = Invoke-RestMethod -Uri "https://api.ipify.org" -UseBasicParsing
        return $publicIp
    } catch {
        Write-Host "Failed to retrieve public IP address: $_"
        return $null
    }
}

function Generate-RDPFile {
    param(
        [string]$publicIp,
        [int]$portNumber,
        [string]$username,
        [string]$password
    )

    $rdpContent = @"
full address:s:${publicIp}:${portNumber}
username:s:${username}
password 51:b:${password}
"@
    return $rdpContent
}

function Upload-ToICloudDrive {
    param(
        [string]$Content,
        [string]$FriendlyName
    )
    try {
        $iCloudDriveFolder = "C:\Users\*\iCloudDrive\RDP" # Ensure this path is correct
        $rdpFileName = "${FriendlyName}.rdp"
        $rdpFilePath = Join-Path -Path $iCloudDriveFolder -ChildPath $rdpFileName
        $Content | Set-Content -Path $rdpFilePath -Encoding ASCII
        Write-Host "RDP configuration file ($FriendlyName) uploaded to iCloud Drive as $rdpFileName"
    } catch {
        Write-Host "Failed to upload RDP configuration file: $_"
    }
}

function Check-RDPFileUpdate {
    param(
        [string]$FriendlyName
    )
    $iCloudDriveFolder = "C:\Users\*\iCloudDrive\RDP" # Ensure this path is correct
    try {
        $rdpFileName = "${FriendlyName}.rdp"
        $rdpFilePath = Join-Path -Path $iCloudDriveFolder -ChildPath $rdpFileName
        $fileExists = Test-Path $rdpFilePath
        return $fileExists
    } catch {
        Write-Host "Failed to check RDP file ($FriendlyName) update: $_"
        return $false
    }
}

# Main script execution
$publicIp = Get-PublicIPAddress
if ($publicIp -eq $null) {
    Write-Host "Unable to retrieve public IP address."
    return
}

$iCloudDriveFolder = "C:\Users\*\iCloudDrive\RDP"  # Ensure this path is correct
Clear-ICloudDriveFolder -FolderPath $iCloudDriveFolder

$rdpFiles = @(
    @{FriendlyName = "*"; Username = "*"; Password = "*"; Port = 1234}, # Ensure these values are correct
    @{FriendlyName = "*"; Username = "*"; Password = "*"; Port = 1235}, # Ensure these values are correct
    @{FriendlyName = "*"; Username = "*"; Password = "*"; Port = 1236}  # Ensure these values are correct
)

foreach ($file in $rdpFiles) {
    $rdpContent = Generate-RDPFile -publicIp $publicIp -portNumber $file.Port -username $file.Username -password $file.Password
    Upload-ToICloudDrive -Content $rdpContent -FriendlyName $file.FriendlyName

    while (-not (Check-RDPFileUpdate -FriendlyName $file.FriendlyName)) {
        Write-Host "Waiting for RDP file ($file.FriendlyName) to be updated..."
        Start-Sleep -Seconds 10
    }

    Write-Host "RDP file ($file.FriendlyName) has been updated."
}

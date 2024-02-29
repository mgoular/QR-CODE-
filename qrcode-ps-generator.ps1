# Import the required module for generating QR codes
Import-Module PSQRCode

<#
.SYNOPSIS
Generates a QR code containing the provided WiFi network name and password.

.DESCRIPTION
This function takes the WiFi network name and password as input and generates a QR code that can be scanned to easily connect to the WiFi network.

.PARAMETER wifiName
The name of the WiFi network.

.PARAMETER wifiPassword
The password for the WiFi network.

.PARAMETER outputPath
The path where the generated QR code image will be saved.

.EXAMPLE
GenerateWiFiQRCode "MyWiFiNetwork" "MySecurePassword123" "C:\Users\Username\Documents\WiFiQRCode.png"
Generates a QR code for the WiFi network "MyWiFiNetwork" with the password "MySecurePassword123" and saves it to the specified path.

.NOTES
Requires the PSQRCode module to be installed. You can install it using the following command:
Install-Module -Name PSQRCode
#>
function GenerateWiFiQRCode {
    param (
        [string]$wifiName,
        [string]$wifiPassword,
        [string]$outputPath
    )

    # Combine the WiFi network name and password into a single string
    $wifiInfo = "WIFI:T:WPA;S:$wifiName;P:$wifiPassword;;"

    # Generate the QR code with the WiFi information
    New-QRCode -Text $wifiInfo -OutputPath $outputPath
}

# Usage example for generating a QR code for WiFi network
# ----------------------------------------------------------------------------
GenerateWiFiQRCode "MyWiFiNetwork" "MySecurePassword123" "C:\Users\Username\Documents\WiFiQRCode.png"

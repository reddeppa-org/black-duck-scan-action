param (
  [string]$BlackDuckUrl,
  [string]$BlackDuckToken,
  [string]$ProjectName,
  [string]$VersionName,
  [string]$OutputPath = "bd-results"
)

Write-Host "Downloading Black Duck Detect CLI..."
Invoke-WebRequest -Uri "https://detect.synopsys.com/detect.ps1" -OutFile "detect.ps1"

Write-Host "Running Black Duck scan..."
.\detect.ps1 `
  --blackduck.url="$BlackDuckUrl" `
  --blackduck.api.token="$BlackDuckToken" `
  --detect.project.name="$ProjectName" `
  --detect.project.version.name="$VersionName" `
  --detect.output.path="$OutputPath" `
  --detect.report.format=sarif

Write-Host "Scan completed. SARIF output saved to $OutputPath"
$myDir = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition)
$path2add = $myDir -join ';'
$systemPath = [Environment]::GetEnvironmentVariable('Path', 'Machine');

If (!$systemPath.contains($path2add)) {
    $systemPath += $path2add
    $systemPath = $systemPath -join ';'
    [Environment]::SetEnvironmentVariable('Path', $systemPath, 'Machine');
    write-host "Script Added to path!"
}


$redmineUrl = [Environment]::GetEnvironmentVariable('REDMINE_URL', 'User');
if([string]::IsNullOrEmpty($redmineUrl)) {
    $redmineUrl = Read-Host -Prompt 'Set your redmine url with procotol (Example: http://redmine.com)';
    [Environment]::SetEnvironmentVariable('REDMINE_URL', $redmineUrl, 'User');
}

$redmineApikey = [Environment]::GetEnvironmentVariable('REDMINE_APIKEY', 'User');
if([string]::IsNullOrEmpty($redmineApikey)) {
    $redmineApikey = Read-Host -Prompt 'Set your redmine url api key';
    [Environment]::SetEnvironmentVariable('REDMINE_APIKEY', $redmineApikey, 'User');
}
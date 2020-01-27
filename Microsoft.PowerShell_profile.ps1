function hexocgd {
    hexo clean; hexo g; hexo d;
}
function hexogd {
    hexo g; hexo d;
}
function workspace {
    Set-Location D:\WorkSpace\;
}
function editpspre {
    code C:\Users\HZJ\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1;
}
function cddesktop {
    Set-Location C:\Users\HZJ\Desktop;
}
$startUpPath = 'C:\Users\HZJ\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup';
function echoStartUpPath {
    $startUpPath;
}
#set-alias hexogd 
#set-alias hexocgd
function hosts {
    code "%SystemRoot%\system32\drivers\etc\hosts";
}
function updatehosts{
    ipconfig /flushdns;
}
function restartWsl{
    net stop LxssManager;
    net start LxssManager;
}

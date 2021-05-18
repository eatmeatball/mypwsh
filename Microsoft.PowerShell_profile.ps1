# 为了防止以后新版本的powershell 会出现冲突命令
# 对于一些存在于cmd hash的已有命令，
# 如果需要自己实现相同共能尽量不要起相同的名字
# 例如 cmd 存在where bash存在的which 命令 ，powershell 暂未发现对应命令，
# 但是在win + powershell + cmd 中可以在powershell通过 cmd /c where 使用相同效果，如封装成函数，不应命名为where 或者which

function hexocgd {
    hexo clean; hexo g; hexo d;
}
function hexogd {
    hexo g; hexo d;
}

function editpspre {
    code  $PROFILE
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
function updatehosts {
    ipconfig /flushdns;
}
function restartWsl {
    net stop LxssManager;
    net start LxssManager;
}

# 已经没用了，先作为一个例子留在此处
# Chocolatey profile
# $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# if (Test-Path($ChocolateyProfile)) {
#   Import-Module "$ChocolateyProfile"
# }

function zwhichis() {
    cmd /c where $command
}



function pgsql() {
    &'D:\Program files\PostgreSQL\12\scripts\runpsql.bat'
}

function getDate() {
    Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
}
function getTime()
{
    (([DateTime]::Now.ToUniversalTime().Ticks - 621355968000000000)/10000000).tostring().Substring(0,10)
}

set-alias grep select-string

Import-Module posh-git
Import-Module oh-my-posh
# Set-Theme Paradox
Set-Theme Darkblood


Set-PSReadlineKeyHandler -Key Tab -Function Complete # 设置 Tab 键补全
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete # 设置 Ctrl+d 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo # 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward # 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward # 设置向下键为前向搜索历史纪录


function godocstart() {
    godoc -http=:6060 ; Start-Process "http://127.0.0.1:6060/doc"
}

function godocshow() {
    Start-Process "http://127.0.0.1:6060/doc"
}

function ll() {
    Get-ChildItem
}


function gitsetp() {
    git config --global http.proxy http://127.0.0.1:11000
    git config --global https.proxy http://127.0.0.1:11000
}


function gitunsetp() {
    git config --global --unset http.proxy
    git config --global --unset https.proxy
}


function setp() {
    $env:HTTPS_PROXY = "http://127.0.0.1:11000"
    $env:HTTP_PROXY = "http://127.0.0.1:11000"
}

function unsetp() {
    Remove-Item Env:http_proxy
    Remove-Item Env:https_proxy
}

function work() {
    Set-Location 'C:\Users\HZJ\Desktop\work'
}
function workspace {
    Set-Location D:\WorkSpace\;
}
function cddr ($ps) {
    switch ($ps) {
        'n' {
            "准备进入nginx容器"
            docker exec -it nginx_lumen  //bin//sh 
        }
        'p' {
            "准备进入php容器"
            docker exec -it php_lumen //bin//sh 
        }
        default {
            "容器不存在"
        }       
    }
}

function xqssh($ps) {
    switch ($ps) {
        '1' {
            "准备进入st" + $ps 
            ssh httpd@172.17.224.7
        }
        '2' {
            "准备进入st" + $ps 
            ssh httpd@172.17.225.9
        }
        '3' {
            "准备进入st" + $ps
            ssh httpd@172.17.226.7
        }
        Default {
            "准备进入st1" 
            ssh httpd@172.17.224.7
        }
    }
}

function wblog() {
    code C:\Users\HZJ\Desktop\blog
}

function cdworktool{
    Set-Location D:\WorkSpace\simple\laravel8
}

function gitpushall($message = "update all")
{
    git add .  ; git commit -m '"'$message'"'  ; git push
}

function gitcpush($message = "update all"){
    git commit -m '"'$message'"' ; git push
}

function adbscreencap(){
    $time =  Get-Date -Format 'yyyyMMddHHmmssfff'
    $filePath = '/sdcard/'+$time+'.png'
    C:\Users\HZJ\AppData\Local\Android\Sdk\platform-tools\adb.exe shell screencap -p $filePath
    C:\Users\HZJ\AppData\Local\Android\Sdk\platform-tools\adb.exe pull $filePath
}

function echoadbpath(){
    "C:\Users\HZJ\AppData\Local\Android\Sdk\platform-tools\adb.exe"
}

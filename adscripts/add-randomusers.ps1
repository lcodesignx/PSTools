Import-Module ActiveDirectory

[int]$num_users = Read-Host 'enter number of users'
$username = 'devuser'
$default_passwd = ConvertTo-SecureString -String 'Password123456' -AsPlainText -Force

1..$num_users | Foreach-Object {
    $params = @{
        name = $username$_
        samAccountName = $username$_
        userPrincipalName = $username$_@apldev.edu
        Enabled = $true
        AccountPassword = $default_passwd
    }

    New-ADUser @params
}
